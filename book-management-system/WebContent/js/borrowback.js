$(document).ready(function(){
	$("#two1").click(function(){
		$("#two1").addClass("hover");
		$("#two3").removeClass("hover");
		$("#illegal_info1").css("display","block");
		$("#illegal_info3").css("display","none");
	});
	$("#two3").click(function(){
		$("#two1").removeClass("hover");
		$("#two3").addClass("hover");
		$("#illegal_info1").css("display","none");
		$("#illegal_info3").css("display","block");
	});
	$("#input_readerID").focus(function() { // �û���������꽹��
		var txt_value = $(this).val(); // �õ���ǰ�ı����ֵ
		if (txt_value == "����������ͼ����")
			$(this).val("");
	});

	$("#input_readerID").blur(function() { // �û�����ʧȥ��꽹��
		var txt_value = $(this).val(); // �õ���ǰ�ı����ֵ
		if (txt_value == "") {
			$(this).val("����������ͼ����"); // �����������������������
		}				
	});
	
	function borrowBookAjax(){
		$("#bookID").click(function(){
			alert("ad");
		})
	}
	
});
	   

























