<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link media=all href="/book-management-system/css/register.css"
	type=text/css rel=stylesheet>
<title>ע��</title>
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
	<table width="1024px" border="0" align="center" cellpadding="0"
		cellspacing="0" style="height: 34px; background-color: #0F73C1;">

		<tr>
			<td class="menu">
				<ul>
					<li><a href="/book-management-system/jsp/index.jsp">��ҳ</a></li>
					<li><a href="/book-management-system/jsp/myLibrary.jsp">�ҵ�ͼ���</a>
					</li>
					<li><a href="/book-management-system/jsp/hotborrow.jsp">���Ž���</a>
					</li>
					<li><a href="/book-management-system/jsp/hotcomment.jsp">��������</a>
					</li>
				</ul>
			</td>
			<td class="menu1"></td>
		</tr>
	</table>
	<div id="box">
		<div id="wrap">
			<div id="space"></div>
			<div
				style="font-family: ������, ����ϸ��; font-weight: bold;; font-size: 20px; color: #2173bf; text-align: left;">ע�����û�</div>
			<form id="register" name="register"
				action="/book-management-system/ReaderServlet?actionType=register"
				method="post">
				<table width="500" height="328" border="0" align="left"
					id="register_table">
					<tr>
						<td width="17" height="30"><div align="center" class="STYLE8">*</div>
						</td>
						<td width="100" height="30"><div align="right" class="STYLE7">��&nbsp;&nbsp;��&nbsp;&nbsp;</div>
						</td>
						<td height="30" width="183" colspan="2"><input class="a2"
							type="text" name="readerName" id="readerName" value=""></td>

						<td width="200" height="30" align="left"><span
															class="post_error2"> <%
								 	String readerNameMsg = null;
								 	readerNameMsg = (String) request.getAttribute("readerNameMsg");
								 	if (readerNameMsg != null) {
								 		out.println("���û�����ע��");
								 	}
								 	request.setAttribute("readerNameMsg", null);
								 %> </span>
						<div class="info" id="info2" style="display: none;">
								ʹ����ʵ����<span class="dec"> <s class="dec1">��</s><s
									class="dec2">��</s> </span>
							</div></td>
					</tr>

					<tr>
						<td height="30"><div align="center" class="STYLE8">*</div></td>
						<td width="100" height="30"><div align="right" class="STYLE7">��&nbsp;&nbsp;��&nbsp;&nbsp;</div>
						</td>
						<td height="30" width="183" colspan="2"><input class="a2"
							type="text" name="Email" id="Email"></td>
						<td width="300" height="30" align="left"><span
							class="post_error3"> <%
						 	String email = null;
						 	email = (String) request.getAttribute("email");
						 	if (email != null) {
						 		out.println("������������ѱ�ע��");
						 	}
						 %> </span>
							<div class="info" id="info3" style="display: none;">
								��ȷ�������� <span class="dec"> <s class="dec1">��</s> <s
									class="dec2">��</s> </span>
							</div></td>
					</tr>
					<tr>
						<td height="30"><div align="center" class="STYLE8">*</div></td>
						<td width="100" height="30"><div align="right" class="STYLE7">��&nbsp;&nbsp;��&nbsp;&nbsp;</div>
						</td>
						<td height="30" width="183" colspan="2"><input class="a2"
							type="password" name="readerPassword" id="readerPassword">
						</td>
						<td width="200" height="30" align="left"><span
							class="post_error4"></span>
							<div class="info" id="info4" style="display: none;">
								��Ϊ���ֻ��ַ�<span class="dec"> <s class="dec1">��</s> <s
									class="dec2">��</s> </span>
							</div></td>
					</tr>
					<tr>
						<td height="30"><div align="center" class="STYLE8">*</div></td>
						<td width="100" height="30"><div align="right" class="STYLE7">ȷ������</div>
						</td>
						<td height="30" width="183" colspan="2"><input class="a2"
							type="password" name="readerPasswordConfirm"
							id="readerPasswordConfirm"></td>
						<td width="200" height="30" align="left"><span
							class="post_error5"></span>
							<div class="info" id="info5" style="display: none;">
								��ȷ������<span class="dec"> <s class="dec1">��</s> <s
									class="dec2">��</s> </span>
							</div></td>
					</tr>
					<tr>
						<td height="30">&nbsp;</td>
						<td width="100" height="30"><div align="right" class="STYLE7">��&nbsp;&nbsp;��&nbsp;&nbsp;</div>
						</td>
						<td height="30" width="183" colspan="2"><input class="a2"
							type="text" name="tel" id="tel"></td>
					</tr>
					<tr>
						<td width="17" height="30"><div align="center" class="STYLE8"></div>
						</td>
						<td width="100" height="30"><div align="right" class="STYLE7">��&nbsp;&nbsp;��&nbsp;&nbsp;</div>
						</td>
						<td height="30" width="183" colspan="2">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
							name="sex" id="sex" value="��" checked>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="radio" name="sex" id="sex" value="Ů">Ů</td>
					</tr>
					<tr>
						<td width="100" height="30" colspan="2" align="right"><div
								align="right" class="STYLE7">ѧ&nbsp;&nbsp;Ժ &nbsp;&nbsp;</div></td>
						<td height="30"><select name="academy" id="academy">
								<option>���ѧԺ</option>
								<option>����ѧԺ</option>
								<option>����ѧԺ</option>
								<option>����ѧԺ</option>
								<option>��������ѧԺ</option>
								<option>����ѧԺ</option>
								<option>����ѧԺ</option>
								<option>����ѧԺ</option>
								<option>����ѧԺ</option>
								<option>��ѧԺ</option>
								<option>������ѧѧԺ</option>
								<option>�����ѧԺ</option>
								<option>��ѧԺ</option>
								<option>����ѧԺ</option>
						</select></td>
						<td height="30" width="50"><div align="right" class="STYLE7">��&nbsp;&nbsp;��</div>
						</td>
						<td height="30"><select name="className" id="className">
								<option>10��һ��</option>
								<option>10������</option>
								<option>10������</option>
								<option>10���İ�</option>
								<option>10�����</option>
								<option>10������</option>
								<option>10���߰�</option>
						</select></td>
					</tr>

					<tr>
						<td height="30">&nbsp;</td>
						<td width="100" height="30"><div align="right" class="STYLE7">��֤��&nbsp;&nbsp;</div>
						</td>
						<td height="30" width="183" colspan="2"><input class="a2"
							type="text" name="inputCode" id="inputCode"></td>
						<td><img src="/book-management-system/AuthImg" alt="��һ��"
							style="cursor: pointer;" onclick="changeImage(this)" /> 
							<span class="post_error6" style="line-height: 24px;">
							<%
						 	String code = null;
						 	code = (String) request.getAttribute("codeMsg");
						 	if (code != null) {
						 		out.println("��֤�����");
						 	}
						 %>
							</span></td>
					</tr>
					<tr>
						<td height="60">&nbsp;</td>
						<td align="center" height="60"></td>
						<td width="112" height="60" align="center"><input
							name="submit" type="submit" class="button1" tabindex="3"
							value="ע��">
						</td>
						<td width="74" align="center"><input name="reset"
							type="reset" class="button1" tabindex="3" value="����"></td>
						<td align="center" height="60">&nbsp;</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="footer"></div>
	<script src="/book-management-system/js/jquery-1.8.2.js"
		type="text/javascript"></script>
	<script src="/book-management-system/js/register.js"
		type="text/javascript"></script>

</body>
</html>