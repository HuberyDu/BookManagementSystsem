function ajaxFunction(){
	var xmlHttp;
	if (window.xmlHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlHttp=new XMLHttpRequest();
	  }
	return xmlHttp;
}

window.onload = function(){	
	document.getElementById("book-comment").onclick = function(){
		xmlHttp=new XMLHttpRequest();
		var bookID = document.getElementById("bookID").value;
		var readerID = document.getElementById("readerID").value;
		if(readerID == 0){
			alert("���ȵ�¼");
			return false;
		}
		var comment = document.getElementById("r_content").value;
		xmlHttp.onreadystatechange=function()
		  {
			if (xmlHttp.readyState==4 && xmlHttp.status==200)
		    {
				
			  var data = xmlHttp.responseText;
			  if(data == "�������۹���")
			  alert(data);
			  var dataObj = eval("("+data+")");
			  document.getElementById("myReaderName").innerHTML = dataObj.readerName+"������";
			  document.getElementById("myCommentTime").innerHTML = dataObj.commentTime;
			  document.getElementById("myComment").innerHTML = dataObj.comment;	  
			  document.getElementById("r_content").value = "";
		    }
		 };
		xmlHttp.open("post","/book-management-system/BookServlet?actionType=comment",true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		//comment = encodeURI(encodeURI(comment));
		comment = escape(escape(comment));
		xmlHttp.send("bookID="+bookID+"&readerID="+readerID+"&comment="+comment+"");
	};
	
	document.getElementById("reserve").onclick = function(){
		xmlHttp=new XMLHttpRequest();
		var bookID = document.getElementById("bookID").value;
		var readerID = document.getElementById("readerID").value;
		if(readerID == 0){
			alert("���ȵ�¼");
			return false;
		}
		xmlHttp.onreadystatechange=function()
		  {
			if (xmlHttp.readyState==4 && xmlHttp.status==200)
		    {
			  var data = xmlHttp.responseText;
			  if(data == "ԤԼ�ɹ�"){
				  $("#reserve").css("display","none"); 
				  $("#status").html("ͼ��״̬:��ԤԼ");
			  }else{
				  alert(data);
			  }
			  return true;
		    }
		 }
		xmlHttp.open("post","/book-management-system/BookServlet?actionType=reserve",true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.send("bookID="+bookID+"&readerID="+readerID+"");
	}
}