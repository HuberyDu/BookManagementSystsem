<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/bookadd.css" rel="stylesheet"
	type="text/css" />
<title>ͼ������</title>
<SCRIPT src="/book-management-system/js/jquery-1.8.2.js"
	type=text/javascript></SCRIPT>
<SCRIPT src="/book-management-system/js/bookAdd.js" type=text/javascript></SCRIPT>
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
		String adminName = (String) session.getAttribute("login");
	%>
	<table width="1024px" border="0" align="center" cellpadding="0"
		cellspacing="0"
		style="height: 34px; background-color: #0F73C1; border: 0px; margin: 0 auto; padding: 0px;">
		<tbody>
			<tr>
				<td class="menu">
					<ul>
						<li><a href="admin.jsp">��ҳ</a></li>
						<li><a href="exit1.jsp">���µ�¼</a></li>
						<li><a href="userguide.jsp">�û�ָ��</a></li>
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
				out.print("/book-management-system/jsp/myLibrary.jsp");
			}%>
							style="color: #FFF"> <%
 	out.print(session.getAttribute("login"));
 %>
								&nbsp;&nbsp; </a></li>
						<li><a
							href=<%if (session.getAttribute("register") == "ע��") {
				out.print("/book-management-system/jsp/register.jsp");
			} else {
				out.print("/book-management-system/jsp/exit1.jsp");
			}%>
							style="color: #FFF"> <%
 	out.print(session.getAttribute("register"));
 %>
								&nbsp;&nbsp; </a></li>
					</ul></td>
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
					<li id="illegal"><a href="admin.jsp">���Ĺ���</a></li>
					<li id="illegal"><a
						href="/book-management-system/BookServlet?actionType=informView&adminName=<%=adminName%>">֪ͨ����</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="right">
			<div id="borrow_info">
				<div class="menu_box">
					<p style="font-weight: bold; margin-bottom: 10px;">ͼ����Ϣ��
					<p>
				</div>
				<div id="book2" style="display: block;">
					<form name="form1" method="post"
						action="/book-management-system/BookServlet?actionType=bookAdd"
						onSubmit="" ENCTYPE="multipart/form-data">
						<table id="book1" class="book1" width="700px;" cellpadding="0px;"
							style="border-collapse: collapse">
							<tr height="30px;">
								<td>ͼ��ISBN</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
									class="area" id="ISBNvalue" type="text" name="ISBN" />&nbsp; <input
									id="ISBN" type="button" value="��ȡ��Ϣ">
								</td>
							</tr>
							<tr height="30px;">
								<td>ͼ������</td>
								<td><input class="area" type="text" name="bookName" />
								</td>
							</tr>
							<tr height="30px;">
								<td>ͼ������</td>
								<td><input class="area" type="text" name="author" />
								</td>
							</tr>
							<tr height="30px;">
								<td>ͼ��۸�</td>
								<td><input class="area" type="text" name="price" />
								</td>
							</tr>
							<tr height="30px;">
								<td>ͼ�������</td>
								<td><input class="area" type="text" name="press" />
								</td>
							</tr>
							<tr height="30px;">
								<td>����ʱ��</td>
								<td><input class="area" type="text" name="storageTime" />
								</td>
							</tr>
							<tr height="30px;">
								<td>ͼ������</td>
								<td><input class="area" type="text" name="bookTypeName" />
								</td>
							</tr>
							<tr height="30px;">
								<td>ͼ���Ŵ�</td>
								<td><input class="area" type="text" name="readingRoomName" />
								</td>
							</tr>
							<tr height="30px;">
								<td>ͼ����</td>
								<td><textarea name="textarea" cols="37" rows="4"></textarea>
									<!-- <input id="area" type="text" name="summaryNote" /> -->
								</td>
							</tr>
							<tr height="30px;">
								<td>ͼƬ��Ŵ�</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="area" type="file" name="bookImage"
									style="width: 270px;" /></td>
							</tr>
						</table>

						<div style="height: 20px;"></div>
						<p style="margin-left: 300px;">
							<input type="submit" value="����"
								style="height: 26px; width: 40px;" /> <input type="reset"
								value="����" style="height: 26px; width: 40px;" />
						</p>
					</form>
				</div>
			</div>

		</div>
	</div>

	<div id="footer"></div>
</body>
</html>