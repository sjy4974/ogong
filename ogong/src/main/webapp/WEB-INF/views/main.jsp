<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/e3409dba93.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR:wght@600&family=Sunflower:wght@300&display=swap');
body, table, div, p, th, td {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}
div h5 {
	color: black;
	display: flex;
	justify-content: center;
}
div.content{
	
}
div.content-wrapper{
	padding: 60px;
	height: 600px;
	background-color: #f8fbff;
}
img.w-100 {
	-webkit-transform: scale(1, 1);
	-ms-transform: scale(1, 1);
	transform: scale(1, 1);
	transition-duration: 0.3s;
	width: 300px;
	height: 220px;
}

img.w-100:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1, 1.1);
	-ms-transform: scale(1.1, 1.1);
	transform: scale(1.1, 1.1);
	transition-duration: 0.3s;
	z-index: 1;
}
#setBtn {
	background-color: #88b3fa;
}
#setBtn:hover {
	color: white;
}
</style>
<script type="text/javascript">

	var email = "${user.email}";

	function setTargetTime() {
		$("#setText").remove();
		$("#setBtn").remove();
		
		var input = "";
		input += '<select class="col-sm-2" id="timeSelect">';
		input += '<option>1</option>'
		input += '<option>2</option>'
		input += '<option>3</option>'
		input += '<option>4</option>'
		input += '<option>5</option>'
		input += '<option>6</option>'
		input += '<option>7</option>'
		input += '<option>8</option>'
		input += '<option>9</option>'
		input += '<option>10</option>'
		input += '<option>11</option>'
		input += '<option>12</option>'
		input += '</select>&nbsp;�ð�&nbsp;&nbsp;'
		var btn = '<button class="btn" id="setBtn" onclick="settingTargetTime()">����</button>';
		
		$("#targetp").append(input);
		$("#targetp").append(btn);
	}
	
	function settingTargetTime() {
		$.ajax({
			type : 'post',
			url : "/integration/setTargetTime",
			data : JSON.stringify({userTargetTime: $("#timeSelect").val(),
									email: email }),
			dataType: "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(result) {	
				location.href = "/integration/mainPage";
			}
		});
	}
	
	function entranceStudy(studyNo){
		location.href = "/study/getStudy?studyNo=" + studyNo;
	};
	
	function entranceStudyRoom(studyNo){
		location.href = "/studyroom/getStudyRoom?studyNo=" + studyNo;
	};

</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/toolbar.jsp" />


		<!-- Main content -->
		<div class="content">
			<div class="content-wrapper">
			<div class="container">
			
				<div class="row">
				
					<div class="col-lg-4">
					
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">�����͵�</h3>

								</div>
							</div>
							<div class="card-body">
								<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">

								  <div class="carousel-inner">
								  	<c:if test="${mySelfStudyList.size() == 0 && myGroupStudyList.size() == 0}">
								  		<div class="carousel-item active">
									      &nbsp;&nbsp;&nbsp;&nbsp;
									      <i class="fas fa-exclamation-triangle"></i>�������� ���͵� �����ϴ�.
									    </div>
								  	</c:if>
								  	
								  	<c:forEach var="study" items="${mySelfStudyList}" varStatus="vs">
								  		<c:if test="${vs.first}">
								  			<div class="carousel-item active">
								  		</c:if>
								  		<c:if test="${!vs.first}">
								  			<div class="carousel-item">
								  		</c:if>
									      <img src="/resources/upload_files/study/${study.studyThumbnail}" height="260px" class="w-100" alt="..."
									      onclick="entranceStudy(${study.studyNo})">
									      <div class="carousel-caption d-none d-md-block"></div>
									      <br><br>
									      <h5>(�������͵�)</h5>
									      <h5>${study.studyName} &nbsp;&nbsp;${study.currentMember}/${study.maxMember}</h5>
									    </div>
								  	</c:forEach>
								    <c:forEach var="study" items="${myGroupStudyList}" varStatus="vs">
								    	<c:if test="${vs.first}">
								    		<c:if test="${mySelfStudyList.size() == 0}">
								    		<div class="carousel-item active">
								    		</c:if>
								  			<c:if test="${mySelfStudyList.size() != 0}">
								    		<div class="carousel-item">
								    		</c:if>
								  		</c:if>
								  		<c:if test="${!vs.first}">
								  			<div class="carousel-item">
								  		</c:if>
									      <img src="/resources/upload_files/study/${study.studyThumbnail}" height="260px" class="w-100" alt="..."
									      onclick="entranceStudyRoom(${study.studyNo})">
									      <div class="carousel-caption d-none d-md-block"></div>
									      <br><br>
									      <h5>(�׷콺�͵�)</h5>
									      <h5>"${study.studyName}"</h5>
									    </div>
								  	</c:forEach>
								  </div>
								  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </a>
								</div>
							</div>
						</div><!-- card -->
					</div><!-- col-lg-4 -->
					
						
					
					
					<div class="col-lg-8">
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">������ ���� �ð�</h3>
									<a href="/learningHistory/learningHistoryPage" style="color:black;">���α�� > </a>
								</div>
							</div>
							<div class="card-body">
								<div>
									<p class="d-flex flex-column">
										<span class="text-lg">���� ������ �ð� / ��ǥ�ð�&nbsp;
										<i class="fa fa-clock-o" aria-hidden="true"></i></span>
										
									</p>
									<div>
										<span class="text-bold text-lg">${todayHour}�ð�${todayMinute}�� /</span>
										<span class="text-bold text-lg">
										<c:if test="${targetTime < 10}">
										 0${targetTime}�ð�00��
										</c:if>
										<c:if test="${targetTime > 10}">
										 ${targetTime}�ð�00��
										</c:if>
										</span>
									</div>
								</div>
								<!-- /.d-flex -->

								<div class="position-relative mb-4">
									<div class="progress" style="height: 30px;">
									  <div class="progress-bar" role="progressbar" style="width: ${gage}%;background-color:#83bef8 !important;" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>

								<div class="d-flex flex-row justify-content-end">
									<span class="mr-2"> <i
										class="fas fa-square" style="color:#83bef8;"></i>
										${gage}% �޼�
									</span>
								</div>
							</div>
						</div>
						
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">��ǥ�ð� ����</h3>
								</div>
							</div>
							<div class="card-body">
								<div>
									<p id="targetp" class="d-flex">
										<c:if test="${user.userTargetTime == 0}">
											<span id="setText" class="text-lg">��ǥ�ð��� �����ϴ�...��ǥ�ð��� �������ּ���.</span>&nbsp;&nbsp;
											<button id="setBtn" class="btn" onclick="setTargetTime()">�����ϱ�</button>
										</c:if>
										<c:if test="${user.userTargetTime != 0}">
											<span>${user.nickname}���� ��ǥ�ð��� ${user.userTargetTime}�ð� �Դϴ�.</span>&nbsp;&nbsp;
											<button id="setBtn" class="btn" onclick="setTargetTime()">�����ϱ�</button>
										</c:if>
									</p>
								</div>
							</div>
						</div><!-- card -->
					</div><!-- col-lg-8 -->
					
					
				</div> <!-- row -->
				
			</div> <!-- container -->
			</div>
			
			<br/>
			<div class="container">
					<div class="card col-lg-12">
						<div class="card-header border-0">
							<h2 class="card-title">���� ��ŷ</h2>
						</div>
						<div class="row">
							<div class="card col-lg-4">
								<h3 class="card-title" style="padding-top:13px" align="center">�ٳ���</h3>
								<hr/>
								<div class="card-body table-responsive p-0">
									<table class="table table-hover table-valign-middle">
										<thead align="center">
											<tr>
												<th>�� ��</th>
												<th>�г���</th>
												<th>�ٳ��� ��</th>
											</tr>
										</thead>
										<tbody align="center">
											<c:set var="i" value="0" />
											<c:forEach var="user" items="${list2}">
												<c:set var="i" value="${i+1}" />
												<tr>
													<td>${i}��</td>
													<td>${user.nickname}</td>
													<td>${user.bananaCount}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="card col-lg-4">
								<h3 class="card-title" style="padding-top:13px" align="center">���νð�</h3>
								<hr/>
								<div class="card-body table-responsive p-0">
									<table class="table table-hover table-valign-middle">
										<thead align="center">
											<tr>
												<th>�� ��</th>
												<th>�г���</th>
												<th>���νð�</th>
											</tr>
										</thead>
										<tbody align="center">
											<c:set var="i" value="0" />
											<c:forEach var="learning" items="${list3}">
												<c:set var="i" value="${i+1}" />
												<tr>
													<td>${i}��</td>
													<td>${learning.email}</td>
													<td>${learning.learningTime}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="card col-lg-4">
								<h3 class="card-title" style="padding-top:13px" align="center">ä�ü�</h3>
								<hr/>
								<div class="card-body table-responsive p-0">
									<table class="table table-hover table-valign-middle">
										<thead align="center">
											<tr>
												<th>�� ��</th>
												<th>�г���</th>
												<th>ä�ü�</th>
											</tr>
										</thead>
										<tbody align="center">
											<c:set var="i" value="0" />
											<c:forEach var="answer" items="${list}">
												<c:set var="i" value="${i+1}" />
												<tr>
													<td>${i}��</td>
													<td>${answer.nickname}</td>
													<td>${answer.adoptionCount}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							
						</div> <!-- row -->
	
					</div>
			</div> <!-- container -->
			
			
			
		</div>
</body>