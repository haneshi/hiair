<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시물 상세 내용</title>
<link rel="stylesheet" type="text/css" href="css/article.css">
</head>
<body>
	<header>
		<div class="container">
			<h1 onclick="window.location.href='board'">고객센터</h1>
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

	<section class="article">
		<div class="container">
			<h2>게시물 상세 내용</h2>
			<div id="article-content">
				<p>제목 : ${article.subject}</p>
				<p>작성자 : ${article.name} </p>
				<p>작성일 : ${article.regDate}</p>
				<p>내용 : ${article.content}</p>
			</div>
			<div>
				<a href="editArticle?id=${article.id }">수정</a> <!-- 수정 링크 추가 -->
				<a href="deleteArticle?id=${article.id }">삭제</a>
			</div>
		</div>
	</section>

	<footer>
		<div class="container">
			<p>&copy; 2024 HiAir. All rights reserved.</p>
		</div>
	</footer>
</body>
</html>
