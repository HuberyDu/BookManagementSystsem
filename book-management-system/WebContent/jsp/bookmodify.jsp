<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312" import="edu.jxsd.x3510.bean.Book"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/bookmodify.css" rel="stylesheet"
	type="text/css" />
<title>图书信息修改</title>
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
										<h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
										<p>
											<a href="http://www.adobe.com/go/getflashplayer"><img
												src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
												alt="获取 Adobe Flash Player" width="112" height="33"> </a>
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
		int pageNow = ((Integer) (session.getAttribute("pageNow")))
				.intValue();
	%>
	<table width="1024px" border="0" align="center" cellpadding="0"
		cellspacing="0"
		style="height: 34px; background-color: #0F73C1; border: 0px; margin: 0 auto; padding: 0px;">
		<tbody>
			<tr>
				<td class="menu">
					<ul>
						<li><a href="admin.jsp">首页</a>
						</li>
						<li><a href="exit1.jsp">重新登录</a>
						</li>
						<li><a href="userguide.jsp">用户指南</a>
						</li>
						<li><a
							href="/book-management-system/ReaderServlet?actionType=login1&adminName=<%=adminName%>">读者首页</a>
						</li>
					</ul>
				</td>
				<td class="menu1"><ul>
						<%
							if (session.getAttribute("register") == null)
								session.setAttribute("register", "注册");
							if (session.getAttribute("login") == null)
								session.setAttribute("login", "登录");
						%>
						<li><a
							href=<%if (session.getAttribute("login") == "登录") {
				out.print("/book-management-system/jsp/login.jsp");
			} else {
				out.print("/book-management-system/jsp/myLibrary.jsp");
			}%>
							style="color: #FFF"> <%
 	out.print(session.getAttribute("login"));
 %> &nbsp;&nbsp; </a>
						</li>
						<li><a
							href=<%if (session.getAttribute("register") == "注册") {
				out.print("/book-management-system/jsp/register.jsp");
			} else {
				out.print("/book-management-system/jsp/exit1.jsp");
			}%>
							style="color: #FFF"> <%
 	out.print(session.getAttribute("register"));
 %> &nbsp;&nbsp; </a>
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
						href="/book-management-system/ReaderServlet?actionType=readerView&adminName=<%=adminName%>">用户管理</a>
					</li>
					<li id="borrow"><a
						href="/book-management-system/BookServlet?actionType=bookView&adminName=<%=adminName%>">图书管理</a>
					</li>
					<li id="illegal"><a href="admin.jsp">借阅管理</a>
					</li>
					<li id="illegal"><a
						href="/book-management-system/BookServlet?actionType=informView&adminName=<%=adminName%>">通知管理</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="right">

			<div id="borrow_info">
				<div class="menu_box">
					<ul>
						<li id="one2" class="hover"><a href="bookmodify.jsp">修改信息</a>
						</li>
					</ul>
				</div>
				<div id="book2" style="display: block;">
					<%
						Book book = new Book();
						book = (Book) session.getAttribute("book");
					%>
					<form name="form1" method="post"
						action="/book-management-system/BookServlet?actionType=bookUpdate&bookID=<%=book.getBookID()%>&pageNow=<%=pageNow%>"
						onSubmit="">
						<table class="book1" width="700px;" cellpadding="0px;"
							style="border-collapse: collapse">
							<tr height="30px;">
								<td>图书ID：</td>
								<td><input type="text" name="ISBN"
									value=<%=book.getBookID()%> /></td>
							</tr>
							<tr>
								<td>图书ISBN：</td>
								<td><input type="text" name="ISBN"
									value=<%=book.getISBN()%> /></td>
							</tr>
							<tr height="30px;">
								<td>图书名称：</td>
								<td><input type="text" name="bookName"
									value=<%=book.getBookName()%> /></td>
							</tr>
							<tr height="30px;">
								<td>图书作者：</td>
								<td><input type="text" name="author"
									value=<%=book.getAuthor()%> /></td>
							</tr>
							<tr height="30px;">
								<td>图书价格：</td>
								<td><input type="text" name="price"
									value=<%=book.getPrice()%> /></td>
							</tr>
							<tr height="30px;">
								<td>图书出版社：</td>
								<td><input type="text" name="press"
									value=<%=book.getPress()%> /></td>
							</tr>
							<tr height="30px;">
								<td>存入时间：</td>
								<td><input type="text" name="storageTime"
									value=<%=book.getStorageTime()%> /></td>
							</tr>
							<tr height="30px;">
								<td>图书类型：</td>
								<td><input type="text" name="bookTypeName"
									value=<%=book.getBookTypeName()%> /></td>
							</tr>
							<tr height="30px;">
								<td>图书存放处</td>
								<td><input type="text" name="readingRoomName"
									value=<%=book.getReadingRoomName()%> /></td>
							</tr>
						</table>
						<div style="height: 20px;"></div>
						<div align="center">
							<input type="submit" value="保存" /> <input type="reset"
								value="返回" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 1024px; height: 4px;"></div>

	<div id="footer"></div>
</body>
</html>