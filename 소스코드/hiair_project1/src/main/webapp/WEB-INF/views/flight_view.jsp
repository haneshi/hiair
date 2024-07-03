<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="hiair_project1.model.User"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/flight_view.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>항공 상세 내역</title>
<style type="text/css">
footer {
	background-color: #1e272e;
	color: #fff;
	text-align: center;
	padding: 20px 0;
}

.bs-example {
	margin: 20px;
}

h2 {
	margin-top: 67px; /* 위쪽 여백 설정 */
	margin-bottom: 33px; /* 아래쪽 여백 설정 */
}
</style>
</head>
<body>

	<%@ include file="menu.jsp"%>

	<section class="schedule">
		<div class="container">
			<h2 align="center">항공일정 리스트</h2>
			<div id="flight-schedule"></div>
		</div>
	</section>

	<div class="bs-example">
		<table class="table table-condensed table-hover table-striped"
			text-align="center">
			<thead>
				<tr>
					<th class="col-xs-1 col-sm-1 col-md-1 col-lg-2">티켓ID</th>
					<th class="col-xs-6 col-sm-5 col-md-6 col-lg-3">출발지</th>
					<th class="col-xs-2 col-sm-2 col-md-2 col-lg-3">도착지</th>
					<th class="col-xs-2 col-sm-2 col-md-2 col-lg-3">출발일정</th>
					<th class="col-xs-1 col-sm-1 col-md-1 col-lg-3">도착일정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${flight.flightID}</td>
					<td>${flight.departure}</td>
					<td>${flight.destination}</td>
					<td>${flight.departureTime}</td>
					<td>${flight.arrivalTime}</td>
					<td>
						<form action="${pageContext.request.contextPath}/flights/view/${flight.flightID}/reservation" method="post">
							<input type="hidden" name="flightID" value="${flight.flightID}">
							<input type="hidden" name="departure" value="${flight.departure}">
							<input type="hidden" name="destination"
								value="${flight.destination}"> <input type="hidden"
								name="departureTime" value="${flight.departureTime}"> <input
								type="hidden" name="arrivalTime" value="${flight.arrivalTime}">
							<button type="submit" class="btn btn-primary">예약하기</button>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>