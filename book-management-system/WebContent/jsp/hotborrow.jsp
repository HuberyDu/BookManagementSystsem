<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<%@page import="java.sql.*,java.util.*,edu.jxsd.x3510.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link media=all href="/book-management-system/css/hotborrow.css"
	type=text/css rel=stylesheet>
<title>���Ž���</title>
</head>

<body style="background-color: #e4e4e4">
<%
	if(session.getAttribute("newBookList") == null){
%>
<jsp:forward page="../BookServlet?actionType=getHotBorrow"></jsp:forward>
<%}else {%>
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
									<!--<![endif]-->
									<param name="quality" value="high">
									<param name="swfversion" value="9.0.45.0">
									<param name="expressinstall"
										value="/Scripts/expressInstall.swf">
									<div>
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
	 <table  width="1024px" border="0" align="center" cellpadding="0" cellspacing="0" style="height:34px;background-color: #0F73C1;">
  <tbody><tr>
    <td  class="menu"> 
      <ul >
           <li><a href="/book-management-system/jsp/index.jsp">��ҳ</a></li>
    		<li><a href="/book-management-system/ReaderServlet?actionType=myLibrary">�ҵ�ͼ���</a></li>
   		 <li><a href="/book-management-system/BookServlet?actionType=getHotBorrow">���Ž���</a></li>
    		<li><a href="/book-management-system/BookServlet?actionType=getHotComment">��������</a></li>
      </ul></td>
    <td  class="menu1"><ul>
      <%
      	if (session.getAttribute("register") == null)
      		session.setAttribute("register", "ע��");
      	if (session.getAttribute("login") == null)
      		session.setAttribute("login", "��¼");
      %>
      <li><a href=
		<%if (session.getAttribute("login") == "��¼") {
				out.print("/book-management-system/jsp/login.jsp");
			} else {
				out.print("/book-management-system/jsp/myLibrary.jsp");
			}%>
		style="color:#FFF">
		<%
			out.print(session.getAttribute("login"));
		%>
		&nbsp;&nbsp;
		</a>
		</li>
      <li><a href=
		<%if (session.getAttribute("register") == "ע��") {
				out.print("/book-management-system/jsp/register.jsp");
			} else {
				out.print("/book-management-system/jsp/exit.jsp");
			}%>
		style="color:#FFF">
		<%
			out.print(session.getAttribute("register"));
		%>
		&nbsp;&nbsp;
		</a>
		</li>
    </ul></td>
  </tr>
</tbody></table>
 
	<div id="content">
		<div id="space" style="height: 20px;"></div>
		<div id="left">
			<div id="nav_sidebar">
				<div id="nav_sidebar_content">
					<ul>
					    <li style="background-color:#efeefe"><a href="#">����ͨ��</a></li>
						<li ><a href="#">��������</a></li>
						<li ><a href="#">��ѧ</a></li>
						<li><a href="#">�Ƽ�</a></li>
						<li><a href="#">����</a></li>
						<li><a href="#">��Ӫ</a></li>
						<li><a href="#">��ʷ</a></li>
						<li><a href="#">����</a></li>
						
					</ul>
				</div>
			</div>
		</div>
		<div id="right">
		<!-- ���� -->
		<div style="display: block;">
				<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>���</td>
							<td>ͼ��ID</td>
							<td>ͼ������</td>
							<td>������</td>
							<td>ͼ������</td>
							<td>�عݵ�</td>
							<td>���Ĵ���</td>
						</tr>
					</thead>
					<tbody>
						<%
						
							ArrayList<Book> newBookList = new ArrayList<Book>();
							newBookList = (ArrayList<Book>)session.getAttribute("newBookList");
							for(int i = 0;i < newBookList.size()&&i<28;i++){
								Book book = newBookList.get(i);
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress() %></td>
							<td><%=book.getBookTypeName() %></td>
							<td><%=book.getReadingRoomName() %></td>
							<td><%=book.getBorrowedTimes() %></td>
						</tr>
					</tbody>
					<% } %>
				</table>
			</div>
		<!-- ���� -->
		<div style="display: none;">
			<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>���</td>
							<td>ͼ��ID</td>
							<td>ͼ������</td>
							<td>������</td>
							<td>ͼ������</td>
							<td>�عݵ�</td>
							<td>���Ĵ���</td>
						</tr>
					</thead>
					<tbody>
						<%
						
							ArrayList<Book> allHotBookList = new ArrayList<Book>();
							allHotBookList = (ArrayList<Book>)session.getAttribute("allHotBookList");
							for(int i = 0;i < allHotBookList.size()&&i<28;i++){
								Book book = allHotBookList.get(i);

						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress() %></td>
							<td><%=book.getBookTypeName() %></td>
							<td><%=book.getReadingRoomName() %></td>
							<td><%=book.getBorrowedTimes() %></td>
						</tr>
					</tbody>
					<% } %>
				</table>
			</div>
		<!-- ��ѧ --> 
		<div style="display: none;">
				<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>���</td>
							<td>ͼ��ID</td>
							<td>ͼ������</td>
							<td>������</td>
							<td>ͼ������</td>
							<td>�عݵ�</td>
							<td>���Ĵ���</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotLiteratureBookList = new ArrayList<Book>();
							hotLiteratureBookList = (ArrayList<Book>) session
									.getAttribute("hotLiteratureBookList");
							for (int i = 0; i < hotLiteratureBookList.size() && i < 28; i++) {
								Book book = hotLiteratureBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
								<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>
		<!-- �Ƽ� -->
		<div style="display: none;">
				<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>���</td>
							<td>ͼ��ID</td>
							<td>ͼ������</td>
							<td>������</td>
							<td>ͼ������</td>
							<td>�عݵ�</td>
							<td>���Ĵ���</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotTechBookList = new ArrayList<Book>();
							hotTechBookList = (ArrayList<Book>) session.getAttribute("hotTechBookList");
							for (int i = 0; i < hotTechBookList.size() && i < 28; i++) {
								Book book = hotTechBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>

			</div>
		<!-- ���� -->
		<div style="display: none;">
				<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>���</td>
							<td>ͼ��ID</td>
							<td>ͼ������</td>
							<td>������</td>
							<td>ͼ������</td>
							<td>�عݵ�</td>
							<td>���Ĵ���</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotLifeBookList = new ArrayList<Book>();
						hotLifeBookList = (ArrayList<Book>) session.getAttribute("hotLifeBookList");
							for (int i = 0; i < hotLifeBookList.size() && i < 28; i++) {
								Book book = hotLifeBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>

			</div>
		<!-- ���� -->
		<div style="display: none;">
					<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>���</td>
							<td>ͼ��ID</td>
							<td>ͼ������</td>
							<td>������</td>
							<td>ͼ������</td>
							<td>�عݵ�</td>
							<td>���Ĵ���</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotEconomyBookList = new ArrayList<Book>();
							hotEconomyBookList = (ArrayList<Book>) session.getAttribute("hotEconomyBookList");
							for (int i = 0; i < hotEconomyBookList.size() && i < 28; i++) {
								Book book = hotEconomyBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
	
			</div>
		<!-- ��ʷ -->
		<div style="display: none;">
					<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>���</td>
							<td>ͼ��ID</td>
							<td>ͼ������</td>
							<td>������</td>
							<td>ͼ������</td>
							<td>�عݵ�</td>
							<td>���Ĵ���</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotHistoryBookList = new ArrayList<Book>();
							hotHistoryBookList = (ArrayList<Book>) session.getAttribute("hotHistoryBookList");
							for (int i = 0; i < hotHistoryBookList.size() && i < 28; i++) {
								Book book = hotHistoryBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
	
			</div>
		<!-- ���� -->
		<div style="display: none;">
					<table class="book" width="759px;" cellpadding="0px;"
					style="border-collapse: collapse">
					<thead>
						<tr style="background-color:#efeefe;" height="30px;">
							<td>���</td>
							<td>ͼ��ID</td>
							<td>ͼ������</td>
							<td>������</td>
							<td>ͼ������</td>
							<td>�عݵ�</td>
							<td>���Ĵ���</td>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Book> hotPopularBookList = new ArrayList<Book>();
							hotPopularBookList = (ArrayList<Book>) session.getAttribute("hotPopularBookList");
							for (int i = 0; i < hotPopularBookList.size() && i < 28; i++) {
								Book book = hotPopularBookList.get(i);

								/* Iterator<Book> it = hotBookList.iterator();
								while(it.hasNext())
								{
									i++;
									Book book = it.next(); */
						%>
						<tr height="30px;">
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=i+1 %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookID() %></a></td>
							<td><a href="/book-management-system/BookServlet?actionType=bookIntroduce&bookID=<%=book.getBookID() %>"><%=book.getBookName() %></a></td>
							<td><%=book.getPress()%></td>
							<td><%=book.getBookTypeName()%></td>
							<td><%=book.getReadingRoomName()%></td>
							<td><%=book.getBorrowedTimes()%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
				<%
					int i =0;
					if(session.getAttribute("i")!=null){
						i = Integer.parseInt(session.getAttribute("i").toString());
					}
				%>
			<input type="text" id="indexID" value="<%=i%>" style="display: none;">
			<%i=0; %>
			</div>
		</div>
	</div>

	<div id="footer"></div>
	<script src="/book-management-system/js/jquery-1.8.2.js"
		type="text/javascript"></script>
	<script src="/book-management-system/js/hotborrow.js"
		type="text/javascript"></script>
<%} session.removeAttribute("i");%>
</body>
</html>