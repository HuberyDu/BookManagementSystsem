$(document).ready(	
		function() {	
			loginChecked= true;	
			// ���û�������в���
			function  checkForms(t) {//�жϷǷ��ַ�
				var pat=new RegExp("[^a-zA-Z0-9\_\u4e00-\u9fa5]","i"); 
				if(pat.test(t) == true){
					return false;	
				}
				return true;
			}
			
			$("#user_name").focus(function() { // �û���������꽹��
				var txt_value = $(this).val(); // �õ���ǰ�ı����ֵ
				if (txt_value == "�û���/����")
					$(this).val("");
			});

			$("#user_name").blur(function() { // �û�����ʧȥ��꽹��
				var txt_value = $(this).val(); // �õ���ǰ�ı����ֵ
				if (txt_value == "") {
					$(this).val("�û���/����"); // �����������������������
				}
				if(checkForms(txt_value) == false){//�жϷǷ��ַ�
					$(".post_error1").html("�û������ܺ��зǷ��ַ�");
					loginChecked = false;
				}
							
			});
			
			$("#password").blur(function() { // �û�����ʧȥ��꽹��
				var txt_value = $(this).val(); // �õ���ǰ�ı����ֵ
				if(checkForms(txt_value) == false){
					$(".post_error2").html("���벻�ܺ��зǷ��ַ�");
					loginChecked = false;
				}		
			})
			
			$("#login").submit(function() {
				loginChecked = true;
				$("#user_name").blur();
				$("#password").blur();
				return loginChecked;
			});

		});

