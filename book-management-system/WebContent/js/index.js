
$(document).ready(function(){
	function ajaxFunction(){
		var xmlHttp;
		if (window.xmlHttpRequest)
		  {
		  xmlHttp=new XMLHttpRequest();
		  }
		else
		  {
		  xmlHttp=new ActiveXObject("Microsoft.XMLHttp");
		  }
		return xmlHttp;
	}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	function bookAjax(){
		xmlHttp=new XMLHttpRequest();
		
		xmlHttp.onreadystatechange=function()
		  {
			if (xmlHttp.readyState==4 && xmlHttp.status==200)
		    {
			   var data = xmlHttp.responseText;		
			   var bookList = eval("("+data+")");
			   for(var i = 0;i < 6;i++){
				   addDiv(i,bookList);
			   }			   
			}
		 };
		xmlHttp.open("post","../BookServlet?actionType=getHotBorrowIndexAjax",true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		//xmlHttp.open("GET","/AjaxTest/ajax?t=" + Math.random(),true);
		xmlHttp.send();
	}
	bookAjax();

	function informAjax(){
		xmlHttp2=new XMLHttpRequest();
		xmlHttp2.onreadystatechange=function()
		  {
			if (xmlHttp2.readyState==4 && xmlHttp2.status==200)
		    {
			   var data = xmlHttp2.responseText;		
			   var informList = eval("("+data+")");
			   addInform(informList);   
			}
		 };
		xmlHttp2.open("get","/book-management-system/InformServlet?actionType=getInformByAjax",true);
		xmlHttp2.send();
	}
	informAjax();
	
function addInform(informList) {
	for ( var i = 0; i < 5; i++) {
		$("#inform_content_1")
				.find("tbody")
				.append(
						"<tr>"
								+ "<td width='15' align='center' valign='top' style='padding-top: 8px;'>"
								+ "<img src='/book-management-system/images/icon1.gif' width='9'	height='5'></td><"
								+ "td style='line-height: 22px;'><a	href='/book-management-system/InformServlet?actionType=inform&informID="+informList.informList[i].informID+"'>"
								+ ""+informList.informList[i].informTitle+"</a>	"
								+ "</td></tr>");
	}
	for ( var i = 5; i < 10; i++) {
		$("#inform_content_2")
				.find("tbody")
				.append(
						"<tr>"
								+ "<td width='15' align='center' valign='top' style='padding-top: 8px;'>"
								+ "<img src='/book-management-system/images/icon1.gif' width='9'	height='5'></td><"
								+ "td style='line-height: 22px;'><a	href='/book-management-system/InformServlet?actionType=inform&informID="+informList.informList[i].informID+"'>"
								+ ""+informList.informList[i].informTitle+"</a>	"
								+ "</td></tr>");
	}
	for ( var i = 10; i < 15; i++) {
		$("#inform_content_3")
				.find("tbody")
				.append(
						"<tr>"
								+ "<td width='15' align='center' valign='top' style='padding-top: 8px;'>"
								+ "<img src='/book-management-system/images/icon1.gif' width='9'	height='5'></td><"
								+ "td style='line-height: 22px;'><a	href='/book-management-system/InformServlet?actionType=inform&informID="+informList.informList[i].informID+"'>"
								+ ""+informList.informList[i].informTitle+"</a>	"
								+ "</td></tr>");
	}
}

	
  $("#one1").mouseover(function(){
    $("#one1").addClass("hover");
    $("#one2").removeClass("hover");
    $("#con_one_1").css("display","block");
    $("#con_one_2").css("display","none");
  });
  

  $("#one2").mouseover(function(){
	    $("#one2").addClass("hover");
	    $("#one1").removeClass("hover");
	    $("#con_one_2").css("display","block");
	    $("#con_one_1").css("display","none");
	  });
	  
  var tab = new Array();
  var inform_content = new Array();
  for(var i=0;i<$(".tab_1").length;i++){
	  tab[i] = $(".tab_1").eq(i);
  }
  for(var i=0;i<$(".inform_content_1").length;i++){
	  inform_content[i] = $(".inform_content_1").eq(i);
  }
  
  function setTab(i){
	  tab[i].mouseover(function(){
		  tab[i].addClass("over");
		  inform_content[i].css("display","block");
		  for(var j=0;j<$(".tab_1").length;j++){
			  if(j!=i){
				  tab[j].removeClass("over");
				  inform_content[j].css("display","none");
			  }
		  }
	  });
  }
  for(var i=0;i<$(".tab_1").length;i++){
	  setTab(i);
  }
  
  var tp = new Array(); 
  for(var i=0;i<$(".tp").length;i++){
	  tp[i] = $(".tp").eq(i);
  }
  
  function tpClick(i){
	  tp[i].mouseover(function(){
		  tp[i].attr("src","/book-management-system/images/dsb_index1125yyc_0"+(i+1)+".jpg");
	  });
	  tp[i].mouseleave(function(){
		  tp[i].attr("src","/book-management-system/images/dsb_index1101yyc_1"+(i+3)+".jpg");
	  });
	  tp[i].click(function(){
		  $(".content2_book:eq("+i+")").css("display","block");
		  for(var j=0;j<$(".tp").length;j++){
			  if(j!=i){
				  $(".content2_book:eq("+j+")").css("display","none");
			  }
		  }
	  });
  }
  for(var i=0;i<$(".tp").length;i++){
	  tpClick(i);
  } 
/*  $("#tp000").click(function(){
	  $(".content2_book:eq(0)").css("display","block");
	  $(".content2_book:eq(1)").css("display","none");
	  $(".content2_book:eq(2)").css("display","none");
	  $(".content2_book:eq(3)").css("display","none");
	  $(".content2_book:eq(4)").css("display","none");
	  $(".content2_book:eq(5)").css("display","none");   
  })
  
  
  $("#tp001").click(function(){
	  $(".content2_book:eq(0)").css("display","none");
	  $(".content2_book:eq(1)").css("display","block");
	  $(".content2_book:eq(2)").css("display","none");
	  $(".content2_book:eq(3)").css("display","none");
	  $(".content2_book:eq(4)").css("display","none");
	  $(".content2_book:eq(5)").css("display","none");  
  })
  
   $("#tp002").click(function(){
	  $(".content2_book:eq(0)").css("display","none");
	  $(".content2_book:eq(1)").css("display","none");
	  $(".content2_book:eq(2)").css("display","block");
	  $(".content2_book:eq(3)").css("display","none");
	  $(".content2_book:eq(4)").css("display","none");
	  $(".content2_book:eq(5)").css("display","none");  
  })
  
 $("#tp003").click(function(){
	  $(".content2_book:eq(0)").css("display","none");
	  $(".content2_book:eq(1)").css("display","none");
	  $(".content2_book:eq(2)").css("display","none");
	  $(".content2_book:eq(3)").css("display","block");
	  $(".content2_book:eq(4)").css("display","none");
	  $(".content2_book:eq(5)").css("display","none");  
  })
  
   $("#tp004").click(function(){
	  $(".content2_book:eq(0)").css("display","none");
	  $(".content2_book:eq(1)").css("display","none");
	  $(".content2_book:eq(2)").css("display","none");
	  $(".content2_book:eq(3)").css("display","none");
	  $(".content2_book:eq(4)").css("display","block");
	  $(".content2_book:eq(5)").css("display","none");  
  })
 
   $("#tp005").click(function(){
	  $(".content2_book:eq(0)").css("display","none");
	  $(".content2_book:eq(1)").css("display","none");
	  $(".content2_book:eq(2)").css("display","none");
	  $(".content2_book:eq(3)").css("display","none");
	  $(".content2_book:eq(4)").css("display","none");
	  $(".content2_book:eq(5)").css("display","block");  
  })*/

	  var content2_book = new Array();
  	  var a = new Array(); 
  	  var dof = new Array();
  	  var fleft,fright;
  	  var coverList = new Array();
  	  for(var i = 0;i < $(".content2_book").length;i++){
  		  content2_book[i] = $(".content2_book").eq(i);
  	  }
  	  var images = new Array(4);
  	  for(var i = 0;i < images.length ;i++){ 
  		  images[i]=new Array(7); 
  		  
  	  }
	  
  	  
	  function getA(i){
		  fleft = content2_book[i].find(".fleft");
		  fright = content2_book[i].find(".fright");

		  dof[0] = content2_book[i].find(".switch_dot").find(".dof_1");
		  dof[1] = content2_book[i].find(".switch_dot").find(".dof_2");
		  dof[2] = content2_book[i].find(".switch_dot").find(".dof_3");
		  dof[3] = content2_book[i].find(".switch_dot").find(".dof_4");
			  	  
		  for(j = 0;j < content2_book[i].find(".cover_list").length;j++){
			  a[j] = content2_book[i].find(".cover_list").eq(j).position().left; 
			  coverList[j] = content2_book[i].find(".cover_list").eq(j);
			  for(k = 0;k < content2_book[i].find(".cover_list").eq(j).find("img").length;k++){
				  images[j][k]  = content2_book[i].find(".cover_list").eq(j).find("img").eq[k];
			  }
		  }	 
	  }
	  
	 
	  function addDiv(i,bookList){
		  var t = i * 28;
		  for(j = 0;j < 4;j++)
			  for(k = 0;k < 7;k++,t++){
				  if(k<4){
					  //alert(bookList.bookList[t].bookName);
					  content2_book[i].find(".cover_list").eq(j).find("a").eq(k).attr('href',"/book-management-system/BookServlet?actionType=bookIntroduce&bookID="+bookList.bookList[t].bookID+"");				
					  content2_book[i].find(".cover_list").eq(j).find("img").eq(k).attr('src',bookList.bookList[t].bookImage);
					  content2_book[i].find(".cover_list").eq(j).find("a").eq(k).before(
							  '<div class="info" >'+
								'<h2>'+bookList.bookList[t].bookName+'</h2>'+
								'<p class="color-gray">'+bookList.bookList[t].author+'/ '+bookList.bookList[t].press+'/'+bookList.bookList[t].price+'元 / 平装</p>'+
								'<p>'+bookList.bookList[t].summaryNote+''+
									'<span class="dec"> <s class="dec1">◆</s> <s class="dec2">◆</s>'+
									'</span>'+
								'</div>'
					  );
				  }
				  else{
					  content2_book[i].find(".cover_list").eq(j).find("a").eq(k).attr('href',"/book-management-system/BookServlet?actionType=bookIntroduce&bookID="+bookList.bookList[t].bookID+"");						
					  content2_book[i].find(".cover_list").eq(j).find("img").eq(k).attr('src',bookList.bookList[t].bookImage);						
					  content2_book[i].find(".cover_list").eq(j).find("a").eq(k).before(
							  '<div class="info_two" >'+
							  '<h2>'+bookList.bookList[t].bookName+'</h2>'+
							  '<p class="color-gray">'+bookList.bookList[t].author+'/ '+bookList.bookList[t].press+'/'+bookList.bookList[t].price+'元 / 平装</p>'+
								'<p>'+bookList.bookList[t].summaryNote+''+
									'<span class="dec_two"> <s class="dec1_two">◆</s> <s class="dec2_two">◆</s>'+
									'</span>'+
								'</div>'
					  );
				  }
			  }
	  }
	 
	  function display1(i,j,k){
		  content2_book[i].find(".cover_list").eq(j).find("img").eq(k).mouseover(function(){
			  content2_book[i].find(".cover_list").eq(j).find("li").eq(k).css("position","relative");
			  content2_book[i].find(".cover_list").eq(j).find("li").eq(k).find(".info").css("display","block");
		  })
		  
		  content2_book[i].find(".cover_list").eq(j).find("img").eq(k).mouseleave(function(){
			  content2_book[i].find(".cover_list").eq(j).find("li").eq(k).css("position","static");
			  content2_book[i].find(".cover_list").eq(j).find("li").eq(k).find(".info").css("display","none");
		  })
	  }
	  
	  function display2(i,j,k){
		  content2_book[i].find(".cover_list").eq(j).find("img").eq(k).mouseover(function(){
			  content2_book[i].find(".cover_list").eq(j).find("li").eq(k).css("position","relative");
			  content2_book[i].find(".cover_list").eq(j).find("li").eq(k).find(".info_two").css("display","block");
		  })
		  
		  content2_book[i].find(".cover_list").eq(j).find("img").eq(k).mouseleave(function(){
			  content2_book[i].find(".cover_list").eq(j).find("li").eq(k).css("position","static");
			  content2_book[i].find(".cover_list").eq(j).find("li").eq(k).find(".info_two").css("display","none");
		  })
	  }
	  
	  function bookInfo(i){
		  for(j = 0;j < 4;j++)
			  for(k = 0;k < 7;k++){
				  if(k<4){
					  display1(i,j,k);
				  }
				  else{
					  display2(i,j,k);
				  }
			  }
	  }	  
	  
	  function moveLeftRight(i){
		  
		  getA(i);
		 
		  fleft.click(function(){
			  getA(i);
			  		if(a[0]==0){
					   
			  		}
			  		
			  		 else if(a[1]==0){
						   dof[0].css({'background-image':'url(/book-management-system/images/switch_dot_small_02.gif)'});
						   dof[1].css({'background-image':'url(/book-management-system/images/switch_dot_small_01.gif)'});
						   fleft.css({'background-image':'url(/book-management-system/images/rl_03.gif)'});
						   coverList[1].animate({left:-964},800);
						   coverList[0].animate({left:0},800);
						   
						   
					   }
			  		
			  		else if(a[2]==0){
			  			   dof[1].css({'background-image':'url(/book-management-system/images/switch_dot_small_02.gif)'});
			  			   dof[2].css({'background-image':'url(/book-management-system/images/switch_dot_small_01.gif)'});
						   coverList[2].animate({left:-964},800);
						   coverList[1].animate({left:0},800);
						 
					   }
			  		
			  	   else if(a[3]==0){
					   dof[2].css({'background-image':'url(/book-management-system/images/switch_dot_small_02.gif)'});
					   dof[3].css({'background-image':'url(/book-management-system/images/switch_dot_small_01.gif)'});
					   coverList[3].animate({left:-964},800);
					   coverList[2].animate({left:0},800);
					   fright.css({'background-image':'url(/book-management-system/images/rl_02.gif)'});
					   
				   }
			  });
		  
		  fright.click(function(){
			  getA(i);
			  if(a[0]==0){
					
					fleft.css({'background-image':'url(/book-management-system/images/rl_01.gif)'});
					dof[1].css({'background-image':'url(/book-management-system/images/switch_dot_small_02.gif)'});
					dof[0].css({'background-image':'url(/book-management-system/images/switch_dot_small_01.gif)'});
					coverList[0].animate({left:964},800);
					coverList[1].animate({left:0},800);
			   }
			  
			  else if(a[1]==0){
				   
					 dof[2].css({'background-image':'url(/book-management-system/images/switch_dot_small_02.gif)'});
					 dof[1].css({'background-image':'url(/book-management-system/images/switch_dot_small_01.gif)'});
					 coverList[1].animate({left:964},800);
					 coverList[2].animate({left:0},800);
			   }
			  
			  else if(a[2]==0){
				   
					 dof[3].css({'background-image':'url(/book-management-system/images/switch_dot_small_02.gif)'});
					 dof[2].css({'background-image':'url(/book-management-system/images/switch_dot_small_01.gif)'});
					 fright.css({'background-image':'url(/book-management-system/images/rl_04.gif)'});
					 coverList[2].animate({left:964},800);
					 coverList[3].animate({left:0},800);
			   }
			  
			  else if(a[3]==0){
				   
			  }
			
		   });
		  
	  }
	  for(i = 0;i < 6;i++){	 
		  getA(i);
		  bookInfo(i);
		  moveLeftRight(i);	
	  }	 
});