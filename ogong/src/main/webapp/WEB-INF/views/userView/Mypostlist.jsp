<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 50px;
        }
   	</style>
   
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	function fncGetList(currentPage) {
		
		if(${listType == 1}){
			$("#currentPage").val(currentPage)
			$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/admin/listTotalUser?listType=1").submit();
		}
		else if(${listType == 2}){
			$("#currentPage").val(currentPage)
			$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/admin/listTotalUser?listType=2").submit();
		}
		else if(${listType == 3}){
			$("#currentPage").val(currentPage)
			$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/admin/listTotalUser?listType=3").submit();
		}
		else if(${listType == 4}){
			$("#currentPage").val(currentPage)
			$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/admin/listTotalUser?listType=4").submit();
		}
	}
	
	function fncupdateRestoreUser(){
		$('form').attr("method", "POST").attr("action", "admin/updateRestoreUser").submit();
	}
	
	$(function(){
		// �˻�
		$("button[name='search']").on("click", function(){
			fncGetList(1);
		});	
		
		//������ ȸ�� ��Ͽ����� ������ ȸ�� ���� ���
		$( "td:contains('����')").on("click",function(){
				var email = $(this).find('input').val()
				/* alert(email); */
				//fncupdateRestoreUser();
				$.ajax({
				
					url : "/admin/json/updateUserRestore/"+email,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status){
					
					}
				})
				$("#trRemove").remove();
			
			
		})
		
	 	$( "a:contains('��� ȸ�� ���')" ).on("click" , function() {
	 		location.href = "/admin/listTotalUser?listType=1";
		});
		
	 	$( "a:contains('Ż���� ȸ�� ���')" ).on("click" , function() {
	 		location.href = "/admin/listTotalUser?listType=2";
		});
	 	
	 	$( "a:contains('������ ȸ�� ���')" ).on("click" , function() {
	 		location.href = "/admin/listTotalUser?listType=3";
		});
	 	
	 	$( "a:contains('������ ȸ�� ���')" ).on("click" , function() {
	 		location.href = "/admin/listTotalUser?listType=4";
		});	 
	 	
	})
	
	function updateUserRestore(){
		
		$.ajax({
			
			url : "/admin/json/updateUserRestore/"+email,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status){
				
			}
		});
		
		
	}
	
	</script>   	
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../common/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	<div class="contatiner">
	
	<!-- �� ��Ͽ� Ÿ���� �����Ͽ� �ش��ϴ� ����� ��� -->
		<div class="page-header text-info">
				<c:if test="${listType == 1}">
	       				<h3>��� ȸ�� ���</h3>
	       		</c:if>						
	       		<c:if test="${listType == 2}">
	       				<h3>Ż���� ȸ�� ���</h3>
	       		</c:if>
	       		<c:if test="${listType == 3}">
	       				<h3>������ ȸ�� ���</h3>
	       		</c:if>
	       		<c:if test="${listType == 4}">
	       				<h3>������ ȸ�� ���</h3>
	       		</c:if>
	    </div>

	    <ul class="nav nav-tabs">
  			<li role="presentation"><a href="#">��� ȸ�� ���</a></li>
  			<li role="presentation"><a href="#">Ż���� ȸ�� ���</a></li>
  			<li role="presentation"><a href="#">������ ȸ�� ���</a></li>
  			<li role="presentation"><a href="#">������ ȸ�� ���</a></li>
		</ul>

	    
	    <div class="row">
	    
	    	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
								<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>�г���</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" name="search" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>		    
	    	
	    </div>

		<table class="table table-hover table-striped">
			<form>
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="center">�̸���</th>
					<th align="center">�г���</th>
					<c:if test="${listType == 1}">
						<th align="left">���� ����</th>
					</c:if>
					<c:if test="${listType == 2}">
						<th align="left">���� ����</th>
						<th align="left">Ż�� ����</th>
						<th align="left">Ż�� ����</th>
					</c:if>
					<c:if test="${listType == 3}">
						<th align="left">���� ����</th>
						<th align="left">���� ����</th>
						<th align="left">���� ����</th>
					</c:if>
					<c:if test="${listType == 4}">
						<th align="left">������������</th>
						<th align="left">������������</th>
						<th align="left">����</th>
					</c:if>
				</tr>
			</thead>

			<tbody>
				<c:set var="i" value="0" />
				<c:forEach var="user" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr id="trRemove">
						<td align="center">${ i }</td>
						<td align="left">
							<div class="user">${user.email}</div>
						</td>
						<td align="left">
							<div class="user">${user.nickname}</div>
						</td>
						<c:if test="${listType == 1}">
							<td align="left">${user.regDate}</td>
						</c:if>
						<c:if test="${listType == 2}">
							<td align="left">${user.regDate}</td>
							<td align="left">${user.withdrawDate}</td>
							<td align="left">${user.withdrawReason}</td>
						</c:if>
						<c:if test="${listType == 3}">
							<td align="left">${user.regDate}</td>
							<td align="left">${user.restoreDate}</td>
						</c:if>
						<c:if test="${listType == 4}">
							<td align="left">${user.suspendStartDate}</td>
							<td align="left">${user.suspendEndDate}</td>
							<td align="left">���� 
								<input type="hidden" name="email" value="${user.email}" />
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
			</form>
		</table>

	</div>
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>
