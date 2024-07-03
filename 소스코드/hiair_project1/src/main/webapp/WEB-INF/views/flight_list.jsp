<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>항공 조회</title>
<style type="text/css">
.bs-example {margin: 20px;}
.pagination {margin: 0px !important;}
</style>
</head>
<body>

<%@ include file="menu.jsp" %>

<section class="schedule">
	<div class="container">
		<h2>항공일정 리스트</h2>
		<div id="flight-schedule">
			<!-- 항공 일정이 여기에 동적으로 추가될 것입니다. -->
		</div>
	</div>
</section>

<div class="bs-example">
	<table class="table table-condensed table-hover table-striped" text-align="center">
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
			<c:forEach var="flight" items="${flights }"> <!-- 항공편 리스트 뿌려주기 -->
				<tr>
					<td>${flight.flightID }</td>
					<td><a href="<c:url value='/flights/view/${flight.flightID }' />">${flight.departure }</a></td>
					<td>${flight.destination }</td>
					<td>${flight.departureTime }</td>					
					<td>${flight.arrivalTime }</td>
				</tr>
			</c:forEach>
		</tbody>	
	</table>
	<div class="row">
			<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
				<ul class="pagination">
					<c:set var="target" value="flights" />
					<!-- 게시물이 없는 경우 -->
					<c:if test="${pager.rows==0 }">
						<li class="active"><a href="#">1</a></li>
					</c:if>
					
					<!-- 게시물이 있는 경우 -->
					<c:if test="${pager.rows > 0 }">
					    <!-- common 변수에 한페이지당 레코드건수&블럭당 페이지수 저장 -->
						<c:set var="common" 
						       value="size=${pager.size }&bsize=${pager.bsize }" />
						
						<!-- 블럭시작페이지가 블럭당 페이지수 보다 큰 경우  
						         예를들면 6번째 페이지를 보는 경우
						     Home 및 이전 << 셋팅. -->
						<c:if test="${pager.bspage > pager.bsize }">
							<c:set var="home" value="page=1&${common }" />
							<c:set var="prev" value="page=${pager.bspage-1 }&${common }" />
							<li><a href="${target }?${home }">Home</a></li>
							<li><a href='<c:url value="${target }?${prev }"/>'>&laquo;</a></li>
						</c:if>
						<!-- 5개의 페이지 번호를 표시 -->
						<c:forEach var="pno" 
						           begin="${pager.bspage }" 
						           end="${pager.bepage }">
							<c:if test="${pno==pager.page }">
								<li class="active"><a href="#">${pno }</a></li>
							</c:if>
							<c:if test="${pno!=pager.page }">
								<c:if test="${pno <= pager.pages }">
									<c:set var="page" value="page=${pno }&${common }" />
									<li><a href='<c:url value="${target }?${page }"/>'>${pno }</a></li>
								</c:if>
							</c:if>
						</c:forEach>
						<!-- 블럭시작페이지가 전체 페이지수 보다 작은 경우  
						         예를들면 전체 페이지수가 6인데 1~5번째 페이지를 보는 경우
						     Last 및 이후 >> 셋팅. -->
						<c:if test="${pager.bepage < pager.pages }">
						<c:set var="next" value="page=${pager.bepage+1 }&${common }" />
						<c:set var="last" value="page=${pager.pages }&${common }" />
						<li><a href='<c:url value="${target }?${next }"/>'>&raquo;</a></li>
						<li><a href="${target }?${last }">Last</a></li>
					</c:if>
				</c:if>
			</ul>
		</div>
	</div>
</div>	
	
<footer>
	<div class="container">
		<p>&copy; 2024 항공 조회 페이지. All rights reserved.</p>
	</div>
</footer>

</body>
</html>