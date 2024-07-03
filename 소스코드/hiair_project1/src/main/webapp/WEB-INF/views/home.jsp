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
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<style>
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    width: 80%;
    margin: 0 auto;
    overflow: hidden;
}

nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

nav ul li {
    display: inline;
    margin-right: 20px;
}

nav ul li a {
    color: #fff;
    text-decoration: none;
}

section.search {
    text-align: center;
    padding: 50px 0;
}

.search h2 {
    margin-bottom: 30px;
}

.input-group {
    margin-bottom: 20px;
}

.input-group input,
.input-group select {
    width: 250px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.input-group input[type="date"] {
    width: 252px; /* Adjust for border */
}

.btn {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
</style>
<body>
  <%@ include file="menu.jsp" %>



<%
 	//로그인한 사용자의 출발지와 도착지 정보 가져오기
    HttpSession sessionObj = request.getSession(false);
    String departure = "";
    String destination = "";
    if (sessionObj != null) {
        User sessionUser = (User) sessionObj.getAttribute("user");
        if (sessionUser != null) {
            departure = sessionUser.getDeparture();
            destination = sessionUser.getDestination();
        }
    }
%>

    <section class="search">
    <div class="container">
        <h2>Hi Air 에서 여행하세요.</h2>
        <form action="search" method="get" id="searchForm" onsubmit="return checkLogin()">
            <div class="input-group">
                <input type="date" id="departureTime" name="departureTime" placeholder="날짜 선택">
                <select id="departure" name="departure">
                    <option value="" disabled <%= (departure == null || departure.isEmpty()) ? "selected" : "" %>>출발지</option>
                    <option value="김포" <%= (departure != null && departure.equals("김포")) ? "selected" : "" %>>김포</option>
                    <option value="부산" <%= (departure != null && departure.equals("부산")) ? "selected" : "" %>>부산</option>
                    <option value="청주" <%= (departure != null && departure.equals("청주")) ? "selected" : "" %>>청주</option>
                    <option value="양양" <%= (departure != null && departure.equals("양양")) ? "selected" : "" %>>양양</option>
                    <option value="KIM" <%= (departure != null && departure.equals("KIM")) ? "selected" : "" %>>KIM</option>
                </select>
                <select id="destination" name="destination">
                    <option value="" disabled <%= (destination == null || destination.isEmpty()) ? "selected" : "" %>>도착지</option>
                    <option value="뉴욕" <%= (destination != null && destination.equals("뉴욕")) ? "selected" : "" %>>뉴욕</option>
                    <option value="런던" <%= (destination != null && destination.equals("런던")) ? "selected" : "" %>>런던</option>
                    <option value="파리" <%= (destination != null && destination.equals("파리")) ? "selected" : "" %>>파리</option>
                    <option value="도쿄" <%= (destination != null && destination.equals("도쿄")) ? "selected" : "" %>>도쿄</option>
                    <option value="NY" <%= (destination != null && destination.equals("NY")) ? "selected" : "" %>>NY</option>
                </select>
            </div>
            <button type="submit" class="btn" onclick="checkLogin()">항공편 조회하기</button>
        </form>
        </div>
    </section> 
	<script>
    function checkLogin() {
    	// JavaScript를 사용하여 로그인 상태를 확인
        var isLoggedIn = <%= (sessionObj != null && sessionObj.getAttribute("user") != null) %>;
        if (!isLoggedIn) {
            // 로그인되지 않은 경우 로그인 페이지로 이동
            window.location.href = "login";
            return false; // 폼 제출을 중지
        }
        return true; // 폼 제출 계속
    }
	</script>

	
<%@ include file="footer.jsp" %>   
</body>
</html>
