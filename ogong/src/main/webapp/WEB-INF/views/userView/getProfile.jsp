<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- ��� ���� -->
<div class="container">
	<div class="modal fade" id="getProfile" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">��</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container">

						<div class="page-header">
							<h1>${user.nickname} ���� ������</h1>
						</div>

						<input type="hidden" name="email" value="${user.email}" />
						<!--  ���簪 -->

						<div class='text-center'>
								<img id="userImage" src='/resources/upload_files/user_images/${user.userImage}' alt='User profile picture'>
						</div>	
						
						<hr />

						<div class="row">
							<div class="col-xs-4 col-md-2 ">
								<strong>�г���</strong>
							</div>
							<div class="col-xs-8 col-md-4">${user.nickname}</div>
						</div>

						<hr />

						<div class="row">
							<div class="col-xs-4 col-md-2 ">
								<strong>�̸�</strong>
							</div>
							<div class="col-xs-8 col-md-4">${user.name}</div>
						</div>

						<hr />

						<div class="row">
							<div class="col-xs-4 col-md-2 ">
								<strong>����</strong>
							</div>
							<div class="col-xs-8 col-md-4">${user.gender}</div>
						</div>

						<hr />

						<div class="row">
							<div class="col-xs-4 col-md-2">
								<strong>��ǥ�� ����</strong>
							</div>
							<div class="col-xs-8 col-md-4">${user.goal}</div>

						</div>
						<hr>
						<div class="row">
							<div class="col-xs-4 col-md-2" >
								<strong>���ɻ�1</strong>
							</div>
							<div class="col-xs-4 col-md-2" id="interest1">${user.studyInterest1}</div>
							<div class="col-xs-4 col-md-2" >
								<strong>���ɻ�2</strong>
							</div>							
							<div class="col-xs-4 col-md-2" id="interest2">${user.studyInterest2}</div>
							<div class="col-xs-4 col-md-2" >
								<strong>���ɻ�3</strong>
							</div>							
							<div class="col-xs-4 col-md-2" id="interest3">${user.studyInterest3}</div>


						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="updateBtn">����</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$("#updateBtn").on("click", function(){
		location.href="/user/updateProfile";
	})
</script>