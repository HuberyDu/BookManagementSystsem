<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<%@page import="java.sql.*,java.util.*,edu.jxsd.x3510.bean.Reader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/usertable.css" rel="stylesheet"
	type="text/css" />
<script src="/book-management-system/js/usertable.js"
	type="text/javascript">
	
</script>
<title>�û���Ϣ��</title>
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
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%
		String adminName = (String) session.getAttribute("login");
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
						<li><a
							href="/book-management-system/ReaderServlet?actionType=login1&adminName=<%=adminName%>">������ҳ</a>
						</li>
					</ul></td>
				<td class="menu1"><ul>
						<%
							if (session.getAttribute("register") == null)
								session.setAttribute("register", "ע��");
							if (session.getAttribute("login") == null)
								session.setAttribute("login", "��¼");
						%>
						<li><a
							href=<%if (session.getAttribute("login") == "��¼") {
				out.print("/book-management-system/jsp/login.jsp");
			} else {
				out.print("/book-management-system/jsp/admin.jsp");
			}%>
							style="color: #FFF"> <%
 	out.print(session.getAttribute("login"));
 %>
								&nbsp;&nbsp; </a>
						</li>
						<li><a
							href=<%if (session.getAttribute("register") == "ע��") {
				out.print("/book-management-system/jsp/register.jsp");
			} else {
				out.print("/book-management-system/jsp/exit1.jsp");
			}%>
							style="color: #FFF"> <%
 	out.print(session.getAttribute("register"));
 %>
								&nbsp;&nbsp; </a>
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
						href="/book-management-system/BookServlet?actionType=bookView&adminName=<%=adminName%>">ͼ�����</a>
					</li>
					<li id="illegal"><a href="admin.jsp">���Ĺ���</a>
					</li>
					<li id="illegal"><a
						href="/book-management-system/BookServlet?actionType=informView&adminName=<%=adminName%>">֪ͨ����</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="right">

			<div id="reader_info">
				<div class="menu_box">
					<ul>
						<li id="one1" Class="hover"><a href="#">�û���Ϣ��</a></li>
					</ul>
					<input type="button" onClick="selectCheckedBook();" value="����ɾ��">
				</div>
				<table class="book1" width="700px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<tr style="background-color: #efeefe;" height="30px;">
						<td><input class="" name="" type="checkbox" value=""
							onclick="checkAll();" />
						</td>
						<td>�û�ID</td>
						<td>�û���</td>
						<td>�Ա�</td>
						<td>����ѧԺ</td>
						<td>���ڰ༶</td>
						<td>�绰����</td>
						<td>����</td>
						<td>����Ա����</td>
					</tr>
					<%
						ArrayList<Reader> readList = new ArrayList<Reader>();
						readList = (ArrayList) session.getAttribute("readList");
						System.out.println(readList);
						Iterator it = readList.iterator();
						while (it.hasNext()) {
							Reader read = (Reader) it.next();
					%>

					<tr style="height: 30px;">
						<td align="center"><input type="checkbox" name="isbns"
							value="<%=read.getReaderID()%>" />
						<td align="center"><%=read.getReaderID()%></td>
						<td align="center"><%=read.getReaderName()%></td>
						<td align="center"><%=read.getSex()%></td>
						<td align="center"><%=read.getAcademy()%></td>
						<td align="center"><%=read.getClassName()%></td>
						<td align="center"><%=read.getTel()%></td>
						<td align="center"><%=read.getEmail()%></td>
						<td><a
							href="/book-management-system/ReaderServlet?actionType=readerDelete&readerID=<%=read.getReaderID()%>"><img
								src="/book-management-system/images/del.png" width="16"
								height="16" /> </a></td>
					</tr>
					<%
						}
					%>
				</table>
				<div style="height: 20px;"></div>
				<div align="center">
					<%
						int pageCount = ((Integer) (session.getAttribute("pageCount")))
								.intValue();
						int pageNow = ((Integer) (session.getAttribute("pageNow")))
								.intValue();
						if (pageNow == 1) {
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow=1>��һҳ</a>");
							out.print("   ");
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow="
									+ (pageNow + 1) + ">��һҳ</a>");
							out.print("   ");
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow="
									+ pageCount + ">���һҳ</a>");
							out.print("   ");
						} else if (pageNow == pageCount) {
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow=1>��һҳ</a>");
							out.print("   ");
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow="
									+ (pageNow - 1) + ">��һҳ</a>");
							out.print("   ");
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow="
									+ pageCount + ">���һҳ</a>");
							out.print("   ");
						} else {
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow=1>��һҳ</a>");
							out.print("   ");
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow="
									+ (pageNow - 1) + ">��һҳ</a>");
							out.print("   ");
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow="
									+ (pageNow + 1) + ">��һҳ</a>");
							out.print("   ");
							out.print("<a href=/book-management-system/ReaderServlet?actionType=readerPage&pageNow="
									+ pageCount + ">���һҳ</a>");
							out.print("   ");
						}
					%>
					<div style="height: 10px;"></div>
					<form
						action="/book-management-system/ReaderServlet?actionType=readerPage"
						method="post">
						��ǰҳ��<font color="red"><%=pageNow%>/<%=pageCount%></font>
					</form>
				</div>
			</div>

		</div>
		<div style="width: 1024px; height: 4px;"></div>

	</div>
	<div id="footer"></div>
</body>
</html>


