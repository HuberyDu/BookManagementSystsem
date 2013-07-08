create database BookManagementSystem
use BookManagementSystem 
create table admin_info(
	adminID int  primary key ,
	adminName varchar(30) not null ,
	password varchar(30) not null
)

alter table reader_info add activate bit 
create table reader_info(
	readerID int  primary key,
	readerName varchar(30) not null ,
	readerPassword varchar(30) not null,
	academy varchar(20) not null,
	className varchar(40) not null,
	tel varchar(20),
	email varchar(100) not null,
	sex varchar(2) check(sex in('Ů','��'),
	activate bit not null,
)

create table reading_room(
	readingRoomName varchar(30) primary key
)

create table book_type(
	bookTypeName varchar(30) primary key
)

create table book_info(
	bookID int  primary key,
    ISBN varchar(13) not null ,	
	bookName varchar(70) not null,
	press varchar(70) not null,
	author varchar(60) not null,
	price float not null,
	storageTime DateTime not null,
	bookTypeName varchar(30) not null foreign key references book_type(bookTypeName),
	readingRoomName varchar(30) not null foreign key references reading_room(readingRoomName),
	summaryNote Text not null,
    bookImage varchar(100) null,
) 

create table borrow_info(
	readerID int  foreign key references  reader_info(readerID),
	bookID int foreign key references book_info(bookID),
	borrowTime DateTime,
	returnTime DateTime not null,
	primary key(readerID,bookID,borrowTime)
)

create table giveback_info(
	readerID int  foreign key references  reader_info(readerID),
	bookID int  foreign key references book_info(bookID),
	borrowTime DateTime not null,
	returnTime DateTime ,
	fine float,
	primary key(readerID,bookID,returnTime)
)

create table reserve_info(
	readerID int  foreign key references  reader_info(readerID),
	bookID int  foreign key references book_info(bookID),
	reserveTime DateTime ,
	primary key(readerID,bookID ,reserveTime)
)

create table comment_info(
	readerID int  foreign key references  reader_info(readerID),
	bookID int  foreign key references book_info(bookID),
	comment TEXT not null,
	commentTime DateTime not null,
	primary key(readerID,bookID)
)
create table inform_info(
    informID int not null primary key,
    title varchar(20) not null,
    informTime DateTime not null,
    inform text not null,
    informType varchar(20) not null
)

--����book_info�Ĳ��봥������Ҫ���ܲ���ISBN��ͬ����
create trigger book_info_ins on book_info
instead of insert as
begin
	if not exists (select * from inserted where ISBN in (select ISBN from book_info))
		begin
			insert into book_info select * from inserted
		end
	else
		begin
			print '��������ͼ��ISBN��ͬ��ͼ��'
			rollback
		end
end
		
--����admin_info�Ĳ��봥������Ҫ���ܲ������Ա������ͬ�Ĺ���Ա
create trigger admin_info_ins on admin_info
instead of insert as
begin
	if  not exists(select * from inserted where adminName in (select adminName from admin_info))
		begin
			insert admin_info select * from inserted
		end
	else
		begin 
			print '�����������Ա������ͬ�Ĺ���Ա'
			rollback
		end 		
end

--����reader_info�Ĳ��봥������Ҫ���ܲ����û�����ͬ���û�
create trigger reader_info_ins on reader_info
instead of insert as
begin
	if not exists (select readerName from inserted where readerName in (select readerName from reader_info))
		begin
			insert reader_info select * from inserted
		end
	else
		begin
			print '������û���������ͬ'
			rollback
		end
end

--����book_type���� ɾ�� �޸� ������
create trigger book_type_del_upa on book_type
instead of delete,update
as
	if not exists(select * from inserted)
		begin	
			delete book_info where bookTypeName in (select bookTypeName from deleted)		
			delete book_type where bookTypeName in (select bookTypeName from deleted)			
		end
	else
		begin
			insert book_type select * from inserted
			update book_info set bookTypeName = (select bookTypeName from inserted) where bookTypeName in (select bookTypeName from deleted)	
			delete book_type where bookTypeName in (select bookTypeName from deleted)
		end

--����reading_room���� ɾ�� �޸� ������
create trigger reading_room_del_upa on reading_room
instead of delete,update
as
	if not exists(select * from inserted)
		begin	
			delete book_info where readingRoomName in (select readingRoomName from deleted)		
			delete reading_room where readingRoomName in (select readingRoomName from deleted)
			
		end
	else
		begin
			insert reading_room select * from inserted
			update book_info set readingRoomName = (select readingRoomName from inserted) where readingRoomName in (select readingRoomName from deleted)	
			delete reading_room where readingRoomName in (select readingRoomName from deleted)
		end

--����reader_info���� ɾ�� �޸� ������
create trigger reader_info_del_upa on reader_info
instead of delete,update
as 
	if not exists(select * from inserted)
		begin
			delete borrow_info where readerID in(select readerID from deleted)
			delete giveback_info where readerID in(select readerID from deleted)
			delete reserve_info where readerID in(select readerID from deleted)
			delete comment_info where readerID in(select readerID from deleted)
			delete reader_info where readerID in(select readerID from deleted)
		end
	else
		if update(readerID)
			begin
				insert reader_info select * from inserted
				update borrow_info set readerID = (select readerID from inserted) where readerID in (select readerID from deleted)
				update giveback_info set readerID = (select readerID from inserted) where readerID in (select readerID from deleted)
				update reserve_info set readerID = (select readerID from inserted) where readerID in (select readerID from deleted)
				update comment_info set readerID = (select readerID from inserted) where readerID in (select readerID from deleted)
				delete reader_info where readerID = (select readerID from deleted)
			end
		else 
			begin
				update reader_info set readerName = (select readerName from inserted),readerPassword = (select readerPassword from inserted),academy = (select academy from inserted),className = (select className from inserted),tel = (select tel from inserted),email = (select email from inserted),sex = (select sex from inserted) ,activate = (select activate from inserted )where readerID = (select readerID from deleted)		
			end
			

--����book_info���� ɾ�� �޸� ������
create trigger book_info_del_upa on book_info
instead of delete,update
as 
	if not exists(select * from inserted)
		begin
			delete borrow_info where bookID in(select bookID from deleted)
			delete giveback_info where bookID in(select bookID from deleted)
			delete reserver_info where bookID in(select bookID from deleted)
			delete comment_info where bookID in(select bookID from deleted)
			delete book_info where bookID in(select bookID from deleted)
		end
	else
		if update(bookID)
			begin
				insert book_info select * from inserted
				update borrow_info set bookID = (select bookID from inserted) where bookID in (select bookID from deleted)
				update giveback_info set bookID = (select bookID from inserted) where bookID in (select bookID from deleted)
				update reserve_info set bookID = (select bookID from inserted) where bookID in (select bookID from deleted)
				update comment_info set bookID = (select bookID from inserted) where bookID in (select bookID from deleted)
				delete book_info where bookID = (select bookID from deleted)
			end
		else
			begin
				update book_info set ISBN = (select ISBN from inserted),bookName = (select bookName from inserted),press = (select press from inserted),author = (select author from inserted),price = (select price from inserted),storageTime = (select storageTime from inserted),bookTypeName = (select bookTypeName from inserted),readingRoomName = (select readingRoomName from inserted),summaryNote = (select summaryNote from inserted),bookImage = (select bookImage from inserted) where bookID = (select bookID from deleted)
			end


--���鲻�ܳ���5��
create trigger  more_than_5 on borrow_info
after insert 
as 
if (select count(*) from borrow_info where readerID in ( select readerID from inserted) )>5
begin 
print'�����������ܳ���5��'
rollback
end   


--ԤԼ�鲻�ܳ���5��
create trigger  reserve_more_than_5 on reserve_info
after insert 
as 
if (select count(*) from reserve_info where readerID in ( select readerID from inserted) )>5
begin 
print'ԤԼ�������ܳ���5��'
rollback
end 

--��ö�����ʷ������Ϣ������
create trigger get_readerBorrow_history on borrow_info
after delete
as
  begin
  insert into giveback_info(readerID,bookID,borrowTime,returnTime) select readerID,bookID,borrowTime,returnTime from deleted
end


--��admin_info ��������
select * from admin_info
delete admin_info where adminID>0
insert admin_info values(1,'��С��','($,fidEGE')
insert admin_info values(2,'����ɺ','($,fidEGE')
insert admin_info values(3,'������','($,fidEGE')

--��reader_info��������
select * from reader_info
delete reader_info where readerName = '��С��'
insert reader_info values(1,'��С��','123456','���ѧԺ','10��һ��','18770091747','549262189@qq.com','��')
update reader_info set activate = 1 where email = '549262189@qq.com'
insert reader_info values(2,'����ɺ','123456','���ѧԺ','10��һ��','18770091747','549262189@qq.com','Ů',0)
insert reader_info values(3,'������','123456','���ѧԺ','10��һ��','18770091747','549262189@qq.com','��')
insert reader_info values(3,'������','123456','���ѧԺ','10��һ��','18770091747','549262189@qq.com','��')
insert reader_info values(10004,'�ܼ�','-,0agbEAC','���ѧԺ','10��һ��','18770091747','549ags2@qq.com','��',1)
insert reader_info values(10005,'��','-,0agbEAC','���ѧԺ','10��һ��','18770091747','549ghd2@qq.com','��',1)
insert reader_info values(10006,'�ܼ��wei','-,0agbEAC','���ѧԺ','10��һ��','18770091747','542@qq.com','��',1)
insert reader_info values(10007,'�ܼ��11','-,0agbEAC','���ѧԺ','10��һ��','18770091747','54@qq.com','��',1)


select top 1 readerID from reader_info order by readerID desc

update reader_info set readerPassword = '123' where readerID = 1

--��reading_room��������
select * from reading_room
insert reading_room values('��ѧ������')
insert reading_room values('�Ƽ�������')
insert reading_room values('����������')
insert reading_room values('����������')
insert reading_room values('��ʷ������')
insert reading_room values('����������')

--��book_type��������
insert book_type values('��ѧ')
insert book_type values('�Ƽ�')
insert book_type values('����')
insert book_type values('����')
insert book_type values('��ʷ')
insert book_type values('����')

--��inform_info��������
insert inform_info values(1,'EBSCO11����ѵ����','2012-12-11','���ڰ�˼Ψ��ClinicalKey���ܼ��������������ջ��ʼ��֪ͨΪ����������Ч����ASP/ASC+BSP/BSC����Դ��ASP/ASC+BSP/BSC�����Լ������пƽ������������ι�˾�����˱��µ���ѵ���żƻ����������ʣ� Training Center ?? ʵʱ�γ̡����ѡע�� (������)����д�����ݺ������յ�ȷ���ţ���׼ʱ��ᡣ��ȷ������ע��(����)�ĳ������������ݿ⣬��λ�ж�������ȷ��������ʹ�ø����ݿ⡣������������γ�¼�����ѡ¼�ƵĿγ̡�','֪ͨ����')
insert inform_info values(2,'EBSCO11����ѵ����','2012-12-11','���ڰ�˼Ψ��ClinicalKey���ܼ��������������ջ��ʼ��֪ͨΪ����������Ч����ASP/ASC+BSP/BSC����Դ��ASP/ASC+BSP/BSC�����Լ������пƽ������������ι�˾�����˱��µ���ѵ���żƻ����������ʣ� Training Center ?? ʵʱ�γ̡����ѡע�� (������)����д�����ݺ������յ�ȷ���ţ���׼ʱ��ᡣ��ȷ������ע��(����)�ĳ������������ݿ⣬��λ�ж�������ȷ��������ʹ�ø����ݿ⡣������������γ�¼�����ѡ Training Center �� ¼�ƵĿγ̡�','��Դ��̬')
insert inform_info values(3,'EBSCO11����ѵ����','2012-12-11','���ڰ�˼Ψ��ClinicalKey���ܼ��������������ջ��ʼ��֪ͨΪ����������Ч����ASP/ASC+BSP/BSC����Դ��ASP/ASC+BSP/BSC�����Լ������пƽ������������ι�˾�����˱��µ���ѵ���żƻ����������ʣ�m���з��ʡ�ע���������£��μ����߽���ѵ���γ̣�����߱�һ̨���������ļ��������ʹ�ü�����ڽ������ȡ��������õļ����λ�ڹ���������ͼ��ݵļ����������Ա����������¸�������Ϣ���ѡ Training Center ?? ʵʱ�γ̡����ѡע�� (������)����д�����ݺ������յ�ȷ���ţ���׼ʱ��ᡣ��ȷ������ע��(����)�ĳ������������ݿ⣬��λ�ж�������ȷ��������ʹ�ø����ݿ⡣������������γ�¼�����ѡ Training Center �� ¼�ƵĿγ̡�','����')

--��book_info���в�������
select * from book_info
select * from book_info where bookName = 'Χ��'
insert into book_info values('10000','9787111126768','����ѧԭ�����£�','[��] ����','��е��ҵ������','88.0','2012-12-13 01:46:40','��ѧ','��ѧ������','<p>�ˡ�����ѧԭ���ĵ�3��ѽ϶�ƪ������Ӧ�������ߣ�����ƪ����������ľ������ۡ�������Ҫ�ӹ�����������ҵ��Ϊ��������ѡ�����ۡ����ھ�����������ھ��ò����Լ���۾������ߵȽǶ�����ǳ���������˾���ѧ���ǵ�����ۡ�</p>','http://localhost:8080/book-management-system/images/book/9787111126768.jpg')
delete book_info where bookID > 0
select * from book_info order by storageTime desc

select top 20  CONVERT(NVARCHAR(255),a.summaryNote , 112) as summaryNote,a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName,a.storageTime,count(b.bookID) as borrowedTimes
  from book_info a  left join giveback_info b on a.bookID = b.bookID 
group by a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName ,CONVERT(NVARCHAR(255) , a.summaryNote , 112),a.storageTime having a.bookTypeName = '����' order by borrowedTimes  desc 

select a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName,count(b.bookID) as borrowedTimes from book_info a  left join giveback_info b on a.bookID = b.bookID group by a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName having a.bookTypeName = '����'order by borrowedTimes desc

select *  from book_info a  left join giveback_info b on a.bookID = b.bookID 

(select top 6  * from book_info where summaryNote like '%����%')  
select top 6 bookName from book_info where summaryNote like '%�޲���%'

select * from book_info where bookTypeName = '��ѧ'
select * from borrow_info where  
delete book_info where ISBN = '9789882075645'

select count(*) as bookNumber from book_info

15
select count(*) as bookListSize from book_info where bookTypeName = '��ѧ'
select top 15 * from book_info where bookTypeName like '%��%' and bookID not in (select top 15 bookID from book_info where bookTypeName like '%��%')

select * from book_info where summaryNote like '%��ͼ%' and bookID in(select bookID from book_info where bookTypeName='��ѧ' and summaryNote like '%��%')



--��giveback_info ��������
select * from giveback_info

insert giveback_info values(1,1,'2012-04-05','2012-05-05',null)
insert giveback_info values(1,3,'2012-04-05','2012-05-05',null)
insert giveback_info values(1,4,'2012-04-05','2012-05-05',null)
insert giveback_info values(1,5,'2012-04-05','2012-05-05',null)

insert giveback_info values(2,1,'2012-04-05','2012-05-05',null)
insert giveback_info values(2,3,'2012-04-05','2012-05-05',null)
insert giveback_info values(2,4,'2012-04-05','2012-05-05',null)
insert giveback_info values(2,5,'2012-04-05','2012-05-05',null)

--��reserver_info��������
insert reserve_info values(1,1,'2012-05-05')
insert reserve_info values(1,2,'2012-05-05')
insert reserve_info values(1,3,'2012-05-05')
insert reserve_info values(1,4,'2012-05-05')
insert reserve_info values(1,5,'2012-05-05')

insert reserve_info values(2,1,'2022-05-05')
insert reserve_info values(2,2,'2022-05-05')
insert reserve_info values(2,3,'2022-05-05')
insert reserve_info values(2,4,'2022-05-05')
insert reserve_info values(2,5,'2022-05-05')

--��comment_info��������
select * from comment_info
select * from reader_info
delete comment_info where readerID = 10000
insert comment_info values(1,1,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')
insert comment_info values(1,2,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')
insert comment_info values(1,3,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')
insert comment_info values(1,4,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')
insert comment_info values(1,5,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')

insert comment_info values(2,1,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')
insert comment_info values(2,2,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')
insert comment_info values(2,3,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')
insert comment_info values(2,4,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')
insert comment_info values(2,5,'���ǰ���ļ��ͷ������Ƕ�����ajksdfhasd','2012-05-05')


select * from reserve_info
delete from reserve_info where readerID >100
select * from book_info
update reserve_info set readerID = 10004 where readerID = 10000

insert reserve_info values(10000,10000,'2007-12-12')

select * from book_info where ISBN = '9787532759064'
delete from book_info where ISBN = '9787540453176'
select * from book_info where bookID = '10001'

select * from inform_info
select top 5 * from inform_info where informType='֪ͨ����'
select top 5 from inform_info where informType='��Դ��̬'

delete comment_info where readerID=10000 and bookID = 10005
select * from comment_info
select * from giveback_info
select * from reader_info

select * from giveback_info
select * from borrow_info
delete  from giveback_info where readerID = 10003
delete  from borrow_info where readerID = 10003


insert giveback_info(readerID,bookID,borrowTime,returnTime) values(select readerID,bookID,borrowTime,returnTime from borrow_info where bookID=10001)


select count(*)  from borrow_info where readerID=10003
