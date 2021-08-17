<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/adminlte.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="/resources/javascript/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
	<link rel="stylesheet" href="/resources/css/join.css">

<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="/resources/css/log.css">


<html>
    	<script type="text/javascript">
		//============= "�α���"  Event ���� =============
		$( function() {
	
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#login").on("click" , function() {
				var email=$("input:text").val();
				var pw=$("input:password").val();
				
				
				if(email == null || email.length <1) {
					swal('ID�� �Է����ּ���.','','warning');
					$("#email").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					swal('�н����带 �Է����ּ���.','','warning');
					$("#password").focus();
					return;
				}
				
				$("#login_form").attr("method","POST").attr("action","loginView").attr("target","_parent").submit();
			});
		});	
		
		
		
	</script>	
    
    
<head>
<title>My Awesome Login Page</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');
body, table, div, p, th, td{
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}
#mail_check_button:hover,#addBtn:hover,#cancelBtn:hover {
	color:white;
}
</style>	
</head>
<!--Coded with love by Mutiullah Samim-->
<body>
	<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="/resources/images/oglogo.png" class="brand_logo" alt="Logo">
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
					<form id="login_form">
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="email" id="email" class="form-control input_user" value="" placeholder="email">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="password" id="password" class="form-control input_pass" value="" placeholder="password">
						</div>

							<div class="d-flex justify-content-center mt-3 login_container">
				 	<button type="button" name="button" id="login" class="btn login_btn">Login</button>
				 	
				   </div>
				   
				   
					</form>
				</div>
		
				<div class="mt-4">
					<div class="d-flex justify-content-center links">
						Don't have an account? 
						<a href="#" class="ml-2" data-toggle="modal" data-target="#myModal">ȸ������</a>
					</div>
					
					<div class="d-flex justify-content-center links">
						<a href="getPassword">Forgot your password?</a>
					</div>
				</div>
				
			</div>
			
		</div>
		
		
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="background-color:#5bafff;">
						<h4 class="modal-title">ȸ������</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    </div>
					
					<div class="modal-body">
						
						<form id="join_form" method="post">
							<div class="wrap">
								<div class="mail_wrap">
									<label for="inputEmail" class="col-lg-2 control-label">�̸���</label>
					                <div class="col-lg-5">
										<div class="form-control">
											<input class="mail_input" name="email">
										</div>
										<span class="final_mail_ck">�̸����� �Է����ּ���.</span>
										<span class="mail_input_box_warn"></span>
										<div class="mail_check_wrap">
											<input class="mail_check_input_box" id="mail_check_input_box_false" style="height:40px;">
												
											<div class="mail_check_button" style="width:100px;">
												<span><input type="button" id="mail_check_button" class="btn" value="������ȣ ����" style="background-color:#88b3fa;"></span>
											</div>
											<div class="clearfix"></div>
											<span id="mail_check_input_box_warn"></span>
										</div>
									</div>
								</div>
					 			<div class="id_wrap">
					                <label for="inputNickname" class="col-lg-2 control-label">�г���</label>
					                <div class="col-lg-5">
										<div class="form-control">
											<input class="id_input"  name="nickname">
										</div>
										<span class="id_input_re_1">��� ������ �г����Դϴ�.</span>
										<span class="id_input_re_2">�г����� �̹� �����մϴ�.</span>	
										<span class="final_id_ck">�г��Ӹ� �Է����ּ���.</span>			
									</div>
								</div>
								<div class="pw_wrap">
							        <label for="inputPassword" class="col-lg-2 control-label">��й�ȣ</label>
					                <div class="col-lg-5">
										<div class="form-control">
											<input class="pw_input" type="password" name="password">
										</div>
										<span class="final_pw_ck">��й�ȣ�� �Է����ּ���.</span>
									</div>
								</div>
								<div class="pwck_wrap">
									<label for="inputPasswordCheck" class="col-lg-2 control-label">��й�ȣ Ȯ��</label>
					                <div class="col-lg-5">
										<div class="form-control">
											<input class="pwck_input" type="password">
										</div>
										<span class="final_pwck_ck">��й�ȣ Ȯ���� �Է����ּ���.</span>
										<span class="pwck_input_re_1">��й�ȣ�� ��ġ�մϴ�.</span>
										<span class="pwck_input_re_2">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>
									</div>
								</div>
								<br>
								<div class="form-group">
				                    <div class="col-lg-offset-2 col-lg-10 text-left">	
										<input type="button" id="addBtn" class="btn" value="�����ϱ�" style="background-color:#88b3fa;">
										<input type="button" id="cancelBtn" class="btn" value="���" data-dismiss="modal" style="background-color:#88b3fa;">
									</div>
								</div>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
		
		
		
	</div>
</body>

<script>

	var code = "";				//�̸������� ������ȣ �������� �ڵ�
	
	 /* ��ȿ�� �˻� ������� ���� */
	 var idCheck = false;			// ���̵�
	 var idckCheck = false;			// ���̵� �ߺ� �˻�
	 var pwCheck = false;			// ���
	 var pwckCheck = false;			// ��� Ȯ��
	 var pwckcorCheck = false;		// ��� Ȯ�� ��ġ Ȯ��
	 var mailCheck = false;			// �̸���
	 var mailnumCheck = false;		// �̸��� ������ȣ Ȯ��
	
	$(document).ready(function(){
		//ȸ������ ��ư(ȸ������ ��� �۵�)
		$("#addBtn").click(function(){
	
			/* �Է°� ���� */
			var id = $('.id_input').val(); 				// id �Է¶�
			var pw = $('.pw_input').val();				// ��й�ȣ �Է¶�
			var pwck = $('.pwck_input').val();			// ��й�ȣ Ȯ�� �Է¶�
			var mail = $('.mail_input').val();			// �̸��� �Է¶�
			
			/* ���̵� ��ȿ���˻� */
			if(id == ""){
				$('.final_id_ck').css('display','block');
				idCheck = false;
			}else{
				$('.final_id_ck').css('display', 'none');
				idCheck = true;
			}
			
			/* ��й�ȣ ��ȿ�� �˻� */
			if(pw == ""){
				$('.final_pw_ck').css('display','block');
				pwCheck = false;
			}else{
				$('.final_pw_ck').css('display', 'none');
				pwCheck = true;
			}
			
			/* ��й�ȣ Ȯ�� ��ȿ�� �˻� */
			if(pwck == ""){
				$('.final_pwck_ck').css('display','block');
				pwckCheck = false;
			}else{
				$('.final_pwck_ck').css('display', 'none');
				pwckCheck = true;
			}
	
			/* �̸��� ��ȿ�� �˻� */
			if(mail == ""){
				$('.final_mail_ck').css('display','block');
				mailCheck = false;
			}else{
				$('.final_mail_ck').css('display', 'none');
				mailCheck = true;
			}		
			
			/* ���� ��ȿ�� �˻� */
			if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&mailCheck&&mailnumCheck ){
	
				$("#join_form").attr("action", "/user/addUser");
				$("#join_form").submit();		
				
			}else{
				swal("�ʼ� ������ �Է����ּ���","","warning");
				return false;
			}	

		});
	});
	
	//�г��� �ߺ��˻�
	$('.id_input').on("propertychange change keyup paste input", function(){
	
		/* console.log("keyup �׽�Ʈ"); */
		
		var nickname = $('.id_input').val();			// .id_input�� �ԷµǴ� ��
		var data = {nickname : nickname}				// '��Ʈ�ѿ� �ѱ� ������ �̸�' : '������(.id_input�� �ԷµǴ� ��)'
		
		$.ajax({
			type : "post",
			url : "/user/idCheck",
			data : data,
			success : function(result){
				// console.log("���� ����" + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");	
					idckCheck = true;
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");
					idckCheck = false;
				}	
			}// success ����
		}); // ajax ����	
	
	});// function ����
	
	/* ������ȣ �̸��� ���� */
	$("#mail_check_button").click(function(){
		
		var email = $(".mail_input").val();			// �Է��� �̸���
		var cehckBox = $(".mail_check_input_box");		// ������ȣ �Է¶�
		var boxWrap = $(".mail_check_input_box");	// ������ȣ �Է¶� �ڽ�
		var warnMsg = $(".mail_input_box_warn");	// �̸��� �Է� ����
		
		/* �̸��� ���� ��ȿ�� �˻� */
		if(mailFormCheck(email)){
			warnMsg.html("�̸����� ���� �Ǿ����ϴ�. �̸����� Ȯ�����ּ���.");
			warnMsg.css("display", "inline-block");
		} else {
			warnMsg.html("�ùٸ��� ���� �̸��� �����Դϴ�.");
			warnMsg.css("display", "inline-block");
			return false;
		}	
		
		$.ajax({
			
			type:"GET",
			url:"mailCheck?email=" + email,
			success:function(data){
				
				//console.log("data : " + data);
				cehckBox.attr("disabled",false);
				boxWrap.attr("id", "mail_check_input_box_true");
				code = data;
				
			}
					
		});
		
	});
	
	/* ������ȣ �� */
	$(".mail_check_input_box").blur(function(){
		
		var inputCode = $(".mail_check_input_box").val();		// �Է��ڵ�	
		var checkResult = $("#mail_check_input_box_warn");	// �� ��� 	
		
		if(inputCode == code){							// ��ġ�� ���
			checkResult.html("������ȣ�� ��ġ�մϴ�.");
			checkResult.attr("class", "correct");		
			mailnumCheck = true;
		} else {											// ��ġ���� ���� ���
			checkResult.html("������ȣ�� �ٽ� Ȯ�����ּ���.");
			checkResult.attr("class", "incorrect");
			mailnumCheck = false;
		}	
		
	});
	
	
	/* ��й�ȣ Ȯ�� ��ġ ��ȿ�� �˻� */
	
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		$('.final_pwck_ck').css('display', 'none');
		
		if(pw == pwck){
			$('.pwck_input_re_1').css('display','block');
			$('.pwck_input_re_2').css('display','none');
			pwckcorCheck = true;
		}else{
			$('.pwck_input_re_1').css('display','none');
			$('.pwck_input_re_2').css('display','block');
			pwckcorCheck = false;
		}
		
		
	});
	
	 /* �Է� �̸��� ���� ��ȿ�� �˻� */
	 function mailFormCheck(email){
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(email);
	}

</script>

</html> 
