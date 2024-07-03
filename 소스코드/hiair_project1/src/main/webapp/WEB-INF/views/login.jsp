<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공사 로그인</title>
    <link rel="stylesheet" href="css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- 로그인 유효성 검사 modal -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    .label-danger {
        color: red;
    }
</style>
</head>
<body>
	<div class="background-container"></div>

    <div class="login-container">
        <h2>HiAir에 오신것을 환영합니다!</h2>
        <form class="login-form" action="<c:url value='/login'/>" method="post">
            <input type="text" id="username" name="userID" placeholder="아이디" required>
            <input type="password" id="password" name="password" placeholder="비밀번호" required>
            <button type="submit">로그인</button>
            <p class="message">ID가 없다면 회원가입 하세요! <a href="signup">★회원가입★</a></p>
        </form>
        
    <!-- 오류 메시지 표시-->
	<span class="label label-danger" id="result">${error }</span>
		<!-- 모달 창 -->
		<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel">
 	 		<div class="modal-dialog" role="document">
    			<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        			<span aria-hidden="true">&times;</span>
        			</button>
        				<h4 class="modal-title" id="alertModalLabel">알림</h4>
      			</div>
      				
      				<div class="modal-body">
        
        			<!-- 알림 메시지를 여기에 표시 -->
       				<p id="alertMessage"></p>
      				</div>
      					<div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      					</div>
    			</div>
  			</div>
		</div>
    </div>
	<script>
	<%-- 로그인 페이지에 필요한 JavaScript 파일을 로드 --%>
    <src="<%= request.getContextPath() %>/scripts/login.js">
  	$(document).ready(function() {
    // 에러 메시지가 있는 경우 모달 창을 표시
    var error = "${error}";
    if (error) {
      $('#alertMessage').text(error); // 알림 메시지 설정
      $('#alertModal').modal('show'); // 모달 창 표시
    }
  	});
	</script>
	
</body>
</html>
