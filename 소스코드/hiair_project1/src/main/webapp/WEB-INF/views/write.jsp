<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의글 작성</title>
    
    <link rel="stylesheet" type="text/css" href="css/write.css"> <!-- 기본 스타일 시트 연결 -->
</head>
<body>
    <header>
        <div class="container">
            <h1 onclick="window.location.href='home'">HiAir</h1>
            <nav>
                <ul>
                    <li><a href="home.jsp">항공편 검색</a></li>
                    <li><a href="reservation.jsp">예약 확인</a></li>
                    <li><a href="board.jsp">고객센터</a></li>
                    <li><a href="signup.html">회원가입</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <section class="write">
        <div class="container">
            <h2>문의글 작성</h2>
            <form action="insertWrite" method="post">
                <div class="input-group">
                    <label for="username">이름:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="input-group">
                    <label for="email">제목:</label>
                    <input type="text" id="subject" name="subject" required>
                </div>
                <div class="input-group">
                    <label for="content">문의 내용:</label>
                    <textarea id="content" name="content" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn">작성 완료</button>
            </form>
        </div>
    </section>
    
    <footer>
        <div class="container">
            <p>&copy; 2024 Hi_Air 문의 페이지. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
