<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<%@page import="edu.jxsd.x3510.bean.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/borrowback.css" rel="stylesheet"
	type="text/css" />
<title>�û��黹ͼ�����</title>
</head>
<body style="background-color: #e4e4e4">
	<div class="container">
		<table width="1024" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tbody>
				<tr>
					<td><div style="width: 430px; float: left">
							<img src="/book-management-system/images/top_01.jpg" width="430"
								height="129">
						</div>
						<div style="width: 594px; float: left">
							<object id="FlashID"
								classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="594"
								height="129">
								<param name="movie"
									value="/book-management-system/images/banner.swf">
								<param name="quality" value="high">
								<param name="wmode" value="opaque">
								<param name="swfversion" value="9.0.45.0">
								<param name="expressinstall" value="/Scripts/expressInstall.swf">
								<object type="application/x-shockwave-flash"
									data="/book-management-system/images/banner.swf" width="594"
									height="129">
									<param name="quality" value="high">
									<param name="swfversion" value="9.0.45.0">
									<param name="expressinstall"
										value="/Scripts/expressInstall.swf">
									<div>
										<h4>��ҳ���ϵ�������Ҫ���°汾�� Adobe Flash Player��</h4>
										<p>
											<a href="http://www.adobe.com/go/getflashplayer"><img
												src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
												alt="��ȡ Adobe Flash Player" width="112" height="33"> </a>
										</p>
									</div>
								</object>
							</object>
						</div></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%
	   String adminName =  (String) session.getAttribute("login");
	   String readerName = (String) session.getAttribute("readerName");
	%>
	<table width="1024px" border="0" align="center" cellpadding="0"
		cellspacing="0"
		style="height: 34px; background-color: #0F73C1; border: 0px; margin: 0 auto; padding: 0px;">
		<tbody>
			<tr>
				<td class="menu">
					<ul>
					<li><a href="admin.jsp">��ҳ</a>
					</li>
					<li><a href="exit1.jsp">���µ�¼</a>
					</li>
					<li><a href="userguide.jsp">�û�ָ��</a>
					</li>
					<li><a href="/book-management-system/ReaderServlet?actionType=login1&adminName=<%=adminName%>">������ҳ</a>
					</li>
				</ul></td>
				<td class="menu1"><ul>
			             <%
							if (session.getAttribute("register") == null)
								session.setAttribute("register", "ע��");
							if (session.getAttribute("login") == null)
								session.setAttribute("login", "��¼");
						%>
						<li><a href=<%if (session.getAttribute("login") == "��¼") 
						                 { out.print("/book-management-system/jsp/login.jsp");
			                             } else {  out.print("/book-management-system/jsp/myLibrary.jsp");
			                         }%> style="color: #FFF"> 
			                    <%  out.print(session.getAttribute("login")); %> &nbsp;&nbsp; 
			                </a>
						</li>
						<li><a href=<%if (session.getAttribute("register") == "ע��") 
						                {  out.print("/book-management-system/jsp/register.jsp");
			                            } else { out.print("/book-management-system/jsp/exit1.jsp");
			                        }%> style="color: #FFF"> 
			                    <%  out.print(session.getAttribute("register")); %> &nbsp;&nbsp; 
			                </a>
						</li>
					</ul>
				</td>
						</tr>
		</tbody>
	</table>

	<div id="content">
		<div id="header"></div>
		<div id="left">
			<div id="navsidebar">
				<ul id="nav_sidebar_content">
					<li id="reader" class=""><a
						href="/book-management-system/ReaderServlet?actionType=readerView&adminName=<%=adminName%>">�û�����</a>
					</li>
					<li id="borrow"><a
						href="/book-management-system/BorrowBackServlet?actionType=bookView&adminName=<%=adminName%>">ͼ�����</a>
					</li>
					<li id="illegal"><a href="borrowback.jsp">���Ĺ���</a></li>
					<li id="illegal"><a
						href="/book-management-system/BorrowBackServlet?actionType=informView&adminName=<%=adminName%>">֪ͨ����</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="right">
			<div id="illegal_info">
			<p style="color: red; border-bottom: thin;"><%=readerName%>������
				</p>
				<div class="menu_box">
					<ul>
						<li id="two1" class="hover"><a href="#">��ǰ����</a></li>
						<li id="two3" class=""><a href="#">��ʷ����</a></li>
					</ul>
				</div>
				<div id="illegal_info1" style="display: block;">
					<div align="left">
						<div id="book1" style="display: block">
							<table class="book1" width="700px;" cellpadding="0px;"
								style="border-collapse: collapse">
								<thead>
										<tr style="background-color: #efeefe;" height="30px;">
											<td>ͼ��ID</td>
											<td>ͼ������</td>
											<td>��������</td>
											<td>Ӧ������</td>
											<td>�عݵ�</td>
											<td>����Ա����</td>
										</tr>
									</thead>
									<tbody>
							<%
							   ArrayList<BorrowBook> borrowList = new ArrayList<BorrowBook>(); 
								borrowList = (ArrayList<BorrowBook>)session.getAttribute("borrow");
								  Iterator it=borrowList.iterator();
					              while(it.hasNext()){   
					            	  BorrowBook borrow=(BorrowBook)it.next(); 
					            	 
					            	  
					
					       %>
							<tr height="30px;">
								<td><%=borrow.getBookID()%></td>
								<td><%=borrow.getBookName()%></td>
								<td><%=borrow.getBorrowTime()%></td>
								<td><%=borrow.getReturnTime()%></td>
								<td><%=borrow.getReadingRoomName()%></td>
								<td><input type="button" value="�ѻ�" onclick="window.location.href='/book-management-system/BorrowBackServlet?actionType=bookBack&readerName=<%=readerName%>&bookID=<%=borrow.getBookID()%>'">
								</td>
								<%
									}
								%>
							
						</tbody>
								</table>
						</div>
						
					</div>
				
				<div id="illegal_info2" style="display: block;">
					
				    <form action="/book-management-system/BorrowBackServlet?actionType=BorrowBookID&readID=<%=session.getAttribute("readerID")%>&readerName=<%=readerName %>&adminName=<%=adminName %>" method="post">
		
					<div style="font-size: 15px; color: #1E95E5; margin-top: 50px;"  >
					<%
						String borrowError = "";
						if((String)session.getAttribute("borrowMsg")!=null){
							borrowError = (String)session.getAttribute("borrowMsg");
						}
						 
					%>
					<span style="color:red"><%out.write(borrowError); %></span><br/>
					 <input id="input_readerID"  type="text" name="bookID"
							style="height: 20px; width: 200px;color: #888888" value="����������ͼ����" > <input id="bookID"
						type="submit" name="bookID" value="�ύ"	style="height: 26px; width: 40px;" /> <input type="reset"
							name="bookID" value="����" style="height: 26px; width: 40px;" />
					</div>
					</form>
				</div>
				</div>
			</div>

			<div id="illegal_info3" style="display: none;">
				<table class="book1" width="700px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<tr style="background-color: #efeefe;" height="30px;">
						<td>�û���</td>
						<td>����ͼ��</td>
						<td>����ʱ��</td>
						<td>Ӧ��ʱ��</td>
						<td>����</td>
					</tr>
					<tbody>
							<%
								ArrayList<GiveBackBook> givebackList = null;
								givebackList = (ArrayList<GiveBackBook>)session.getAttribute("givebackList");
								System.out.println("asdfgasdfasdfasdfasdfasdfasdfasdfasdf");
								for(int i=0;i<givebackList.size();i++){
					            	  GiveBackBook giveBackBook=new GiveBackBook();
					            	  giveBackBook=givebackList.get(i);
							%>
							<tr height="30px;">
								<td><%=giveBackBook.getReaderName()%></td>
								<td><%=giveBackBook.getBookName()%></td>
								<td><%=giveBackBook.getBorrowTime()%></td>
								<td><%=giveBackBook.getReturnTime()%></td>
								<td><%=giveBackBook.getFine()%></td>
							</tr>
							<%
								}     
							%>
							
						</tbody>
				</table>
	</div>

</div>
</div>
	<div id="footer"></div>
	<script type="text/javascript"
		src="/book-management-system/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="/book-management-system/js/borrowback.js"></script>
		
</body>
</html>


