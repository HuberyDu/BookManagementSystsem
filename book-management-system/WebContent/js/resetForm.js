$(function(){
	var password=$("#password");
	    confirmPassword=$("#confirmPassword");
	    resetPasswordChecked=true;
	    
	    password.focus(function() {
			$(".post_error1").html("");

		});
	    password.blur(function() {
			if (password.val() === "") {
				$(".post_error1").html("��������������");
				 resetPasswordChecked= false;
			} else {
				$(".post_error1").html("");
			}
		});

	    confirmPassword.focus(function() {
			$(".post_error2").html("");
		});
	    confirmPassword.blur(function() {
			if (confirmPassword.val() === "") {
				$(".post_error2").html("���ٴ���������");
				registerChecked = false;
			} else if (confirmPassword.val() !== password.val()) {
				$(".post_error2").html("�������벻һ��");
				 resetPasswordChecked = false;
			} else {
				$(".post_error2").html("");
			}
		});

		$("#resetForm").submit(function() {
			 resetPasswordChecked = true;
			password.blur();
			confirmPassword.blur();
			return  resetPasswordChecked;
		});
});