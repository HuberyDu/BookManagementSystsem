<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<%@page import="java.sql.*,java.util.*,edu.jxsd.x3510.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/book-management-system/css/admin.css" rel="stylesheet"
	type="text/css" />
<title>����Ա����</title>
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
		String adminName = null;
		adminName = (String) session.getAttribute("login");
		session.setAttribute("adminName", adminName);
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
						href="/book-management-system/InformServlet?actionType=informView&adminName=<%=adminName%>">֪ͨ����</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="right">
			<div id="illegal_info">
				<div class="menu_box">
					<ul>
						<li id="two1" class="hover"><a href="#">�û���¼</a>
						</li>
					</ul>
				</div>
				<form method="post"
					action="/book-management-system/BorrowBackServlet?actionType=readerBorrow">
					<div id="illegal_info1" style="display: block;">
						<img src="/book-management-system/images/icon_err.jpg"
							align="middle">����������û�����<input type="text"
							name="readerName"></input><input type="submit" value="��¼"
							onclick="borrowback.jsp"></input>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="footer"></div>
</body>
</html>


