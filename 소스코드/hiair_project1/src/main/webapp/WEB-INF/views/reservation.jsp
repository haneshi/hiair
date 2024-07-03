<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 확인 및 변경</title>
<link rel="stylesheet" href="css/reservation.css">
<style type="text/css">
.bs-example {
	margin: 20px;
}

.pagination {
	margin: 0px !important;
}
</style>
</head>
<body>
	<header>
		<h1 onclick="window.location.href='home'">HIAIR</h1>
	</header>
	<nav>
		<ul>
			<li><a href="reservation">예약 확인</a></li>
			<li><a href="reservation">항공권 조회/예약</a></li>
			<li><a href="reservation">마이 HiAir</a></li>
		</ul>
	</nav>
	<section>
		<!-- 예약 정보 테이블 -->
		<table>
			<thead>
				<tr>
					<th class="col-xs-1 col-sm-1 col-md-1 col-lg-2">항공편</th>
					<th class="col-xs-1 col-sm-1 col-md-1 col-lg-2">아이디</th>
					<th class="col-xs-1 col-sm-1 col-md-1 col-lg-2">이름</th>
					<th class="col-xs-6 col-sm-5 col-md-6 col-lg-3">출발지</th>
					<th class="col-xs-2 col-sm-2 col-md-2 col-lg-3">도착지</th>
					<th class="col-xs-2 col-sm-2 col-md-2 col-lg-3">출발일정</th>
					<th class="col-xs-1 col-sm-1 col-md-1 col-lg-3">도착일</th>
					<th class="col-xs-1 col-sm-1 col-md-1 col-lg-3">예약취소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reservation" items="${reservations}">
					<tr>
						<td>${reservation.flightID}</td>
						<td>${reservation.userID}</td>
						<td>${reservation.name}</td>
						<td>${reservation.departure}</td>
						<td>${reservation.destination}</td>
						<td>${reservation.departureTime}</td>
						<td>${reservation.arrivalTime}</td>
						<td>
							<form action="${pageContext.request.contextPath}/reservationDelete/${reservation.flightID}" method="post">
								<input type="hidden" name="_method" value="DELETE">
								<button type="submit">예약 취소</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>
	<footer>
		<p>
			©
			<%=new java.util.Date().getYear() + 1900%>
			Hi_Air. All Rights Reserved.
		</p>
	</footer>
</body>
</html>
