<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- Spring Security에서 제공하는 태그라이브러리 -->
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- Spring Security에서 제공하는 계정정보 (SecurityContext 안에 계정정보 가져오기) -->
<!-- 로그인한 계정정보 -->
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	  <jsp:include page="../common/header.jsp"></jsp:include>
	  <h2>Spring MVC06</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">Board</div>
	    <div class="panel-body">

		<form action="${contextPath}/login.do" method="post">
			<input type ="hidden" name="${_csrf.parameterName}" value ="${_csrf.token}">
			
			<table style="text-align: center; border : 1px solid #dddddd" class="table table-bordered">
				<tr>
					<td style="width: 110px; vertical-align: middle;">아이디</td>
					<td><input type="text" name="username" id="memID" class="form-control" maxlength="20" placeholder="아이디를 입력하세요."></td>
				</tr>
				
				<tr>
					<td style="width: 110px; vertical-align: middle;">비밀번호</td>
					<td><input required="required" type="password" name="password" id="memPassword1" class="form-control" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<span id="passMessage" style="color:red;"></span>
						<input type="submit" class="btn btn-primary btn-sm pull-right" value="로그인">
						<input type="reset" class="btn btn-warning btn-sm pull-right" value="취소">
					</td>
				</tr>
			</table>		
		</form>
		</div>
	    <div class="panel-footer">스프링게시판 - 김경민</div>
	  </div>
	</div>
	
	
	 <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div id="checkType" class="modal-content">
	        <div class="modal-header panel-heading">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">메세지 확인</h4>
	        </div>
	        <div class="modal-body">
	          <p id="checkMessage"></p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
  
	
		<!-- 회원가입 실패시 띄워줄 모달 -->
	  <div class="modal fade" id="myMessage" role="dialog">
	    <div class="modal-dialog">
	      <!-- Modal content-->
	      <div id="messageType" class="modal-content">
	        <div class="modal-header panel-heading">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">${msgType}</h4>
	        </div>
	        <div class="modal-body">
	          <p id="">${msg}</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
	
	
	
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			if(${param.error != null}){
				if(${msgType eq "실패메세지"}){
					$("#messageType").attr("class","modal-content panel-warning");
					$(".modal-body").text("아이디와 비밀번호를 확인해 주세요");
					$(".modal-title").text("실패 메시지");
					$("#myMessage").modal("show");
				}
				
			if(${not empty msgType}){
				if(${msgType eq "실패메세지"}){
					$("#messageType").attr("class","modal-content panel-warning");
			}
				if(${msgType eq "성공메시지"}){
					$("#messageType").attr("class","modal-content panel-success");
			}
				$("#myMessage").modal("show");
			}
		});
	</script>
	
</body>
</html>



