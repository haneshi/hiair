<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="hiair_project1.model.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HiAir - 항공 예약 서비스</title>
    <link rel="stylesheet" href="css/menu.css">
    <base href="${pageContext.request.contextPath}/">
</head>
<body>
    <header>
        <h1 onclick="window.location.href='home'">HiAir</h1>
    </header>
    <main>
        <div class="container">
            <div class="menu">
                <a href="flights">항공편 조회</a>
                <a href="reservation">예약 확인</a>
                <a href="board">고객센터</a>
                <!-- 세션에 사용자 정보가 없으면 로그인, 있으면 로그아웃으로 표시 -->
                <% User user = (User) session.getAttribute("user");
                   if (user == null) { %>
                     <a href="login">로그인</a>
                <% } else { %>
                     <a href="logout">로그아웃</a>
                <% } %>
                <a href="signup">회원가입</a>
            </div>
        </div>
    </main>
</body>
</html>
