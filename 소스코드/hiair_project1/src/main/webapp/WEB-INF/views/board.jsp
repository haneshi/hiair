<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 내용</title>
    <link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body>
    <header>
    
        <div class="container">
            <h1 onclick="window.location.href='home'">HiAir</h1>
            <nav>
                <ul>
                    <li><a href="home">항공편 검색</a></li>
                    <li><a href="reservation">예약 확인</a></li>
                    <li><a href="board">고객센터</a></li>
                    <li><a href="signup.html">회원가입</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <section class="board">
        <div class="container">
            <h2>게시판 내용</h2>
            <table class="table table-condensed table-hover table-striped" text-align="center" border="1" >
			<thead>
			<tr>
				<th class="col-xs-6 col-sm-5 col-md-6 col-lg-3">제목</th>
				<th class="col-xs-2 col-sm-2 col-md-2 col-lg-3">작성자</th>
				<th class="col-xs-1 col-sm-1 col-md-1 col-lg-3">작성일</th>
			</tr>		
		</thead>
		<tbody>
           
                <!-- 게시글 출력 -->
                <c:forEach var="item" items="${boardItems}">
                <tr>
                   <td><a href="article?id=${item.id}">${item.subject}</a></td>
                   <td><a href="article?id=${item.id}">${item.name}</a></td>
                   <td><a href="article?id=${item.id}">${item.regDate}</a></td>
                </tr>
                </c:forEach>
         </tbody>
        </table>
            <!-- 문의글 작성 버튼 -->
            <div style="text-align: right; margin-bottom: auto;">
                <a href="write" class="btn">문의글 작성</a>
            </div>
        </div>
    </section>
    
    <footer>
        <div class="container">
            <p>&copy; 2024 Hi_Air 게시판 페이지. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
