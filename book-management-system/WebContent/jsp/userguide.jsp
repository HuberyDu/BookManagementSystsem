<%@ page language="java" contentType="text/html; charset=GB2312"
    pageEncoding="GB2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<link href="/book-management-system/css/inform.css" rel="stylesheet" type="text/css"/>
<title>�û�ָ����Ϣ</title>
</head>
<body style="background-color: #e4e4e4">
<div class="container">
  <table width="1024" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody><tr>
      <td><div style="width:430px; float:left"><img src="/book-management-system/images/top_01.jpg" width="430" height="129"></div>
        <div style="width:594px; float:left">
          <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="594" height="129">
            <param name="movie" value="/book-management-system/images/banner.swf">
            <param name="quality" value="high">
            <param name="wmode" value="opaque">
            <param name="swfversion" value="9.0.45.0">
            <!-- �� param ��ǩ��ʾʹ�� Flash Player 6.0 r65 �͸��߰汾���û��������°汾�� Flash Player��������������û���������ʾ���뽫��ɾ���� -->
            <param name="expressinstall" value="/Scripts/expressInstall.swf">
            <!-- ��һ�������ǩ���ڷ� IE �����������ʹ�� IECC ����� IE ���ء� -->
            <!--[if !IE]>-->
            <object type="application/x-shockwave-flash" data="/book-management-system/images/banner.swf" width="594" height="129">
              <!--<![endif]-->
              <param name="quality" value="high">
              
			  aram name="wmode" value="opaque" /&gt;
              <param name="swfversion" value="9.0.45.0">
              <param name="expressinstall" value="/Scripts/expressInstall.swf">
              <!-- ��������������������ʾ��ʹ�� Flash Player 6.0 �͸��Ͱ汾���û��� -->
              <div>
                <h4>��ҳ���ϵ�������Ҫ���°汾�� Adobe Flash Player��</h4>
                <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="��ȡ Adobe Flash Player" width="112" height="33"></a></p>
              </div>
              <!--[if !IE]>-->
            </object>
            <!--<![endif]-->
          </object>
        </div></td>
    </tr>
    </tbody>
  </table>
</div>
	<table width="1024px" border="0" align="center" cellpadding="0"
		cellspacing="0" style="height: 34px; background-color: #0F73C1;border: 0px;margin: 0 auto;padding: 0px;">
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
					<li><a href="index.jsp">������ҳ</a>
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
<div id="content" style="font-size: 12px;">
<div style="width: 1024px;height: 10px;"></div>
<!-- <div id="left_content"><img src="/book-management-system/image/lmdh_bg.gif"></div>  -->
<div id="right_content">

<div ><p align="center" style="font-size: 18px;font-weight: bold;">ͼ�����ϵͳ�û�ָ��</p>     
<p>һ.�û�ʹ��˵</p>

<p>
A��ѧԺ����Ա�����½ҳ���ַ��http://192.168. 208.23��8081</p>
<p>1�� ��¼����ͼ��ݷ������������ѧԺͼ������Ա�Ĺ���Ȩ�ޣ�</p> 

<p>2�� ѡ���ʦ����</p> 

<p>3�� �鿴����״̬</p> 

<p>״̬1��������δ���գ���½��ѡ�����֣����� ���ģ��Զ����������룬���뷢Ʊ�ţ�ѡ��ͨ������</p> 

<p>״̬2��ͼ���δ���� ��ϵͼ��ݽ�������</p> 

<p>״̬3�������Һ�ͼ���ȫ��ͨ������ ��ӡ�ͱ��嵥�����յ�</p> 

    <p>ע�⣺��ӡʱ�谴�涨���С�ҳ�����á����ڹ涨��ֽ�ţ����ղ��񴦵�Ҫ���ϴ�ӡ��</p> 


<p>C��ͼ��ݹ����½ҳ���ַ�����ԣ�</p> 

<p>1�� ��¼</p> 

<p>2�� ѡ����ͨ��ѧԺ����Ա���գ���δͨ��ͼ������յ����ϣ��������ա�</p> 

<p>3�� ѡ����ͨ��ͼ������յ����ϣ���ӡͼ���嵥���Դ浵��⡣</p> 
<p align="center" style="color: red;"><a href="admin.jsp">����</a></p>
</div>
</div>
<div style="width: 1024px;height: 10px;"></div>
<div id="footer"></div>
</div>

</body>
</html>