<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공 조회 - HiAir</title>
    <link rel="stylesheet" href="css/ar.css">
</head>
<body>
    <header>
        <div class="container">
            <h1 onclick="window.location.href='home.jsp'">항공 조회</h1>
            <nav>
                <ul>          
                    <li><a href="reservation.jsp">예약 확인</a></li>
                    <li><a href="board.jsp">고객센터</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section class="flight-search">
        <div class="container">
            <h2>항공편 검색</h2>
            <form action="#" method="GET">
                <div class="input-group">
                    <label for="departure">출발지:</label>
                    <input type="text" id="departure" name="departure" placeholder="출발지를 입력하세요" required>
                </div>
                <div class="input-group">
                    <label for="destination">도착지:</label>
                    <input type="text" id="destination" name="destination" placeholder="도착지를 입력하세요" required>
                </div>
                <div class="input-group">
                    <label for="date">출발일:</label>
                    <input type="date" id="date" name="date" required>
                </div>
                <button type="submit">검색</button>
            </form>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>&copy; <%= new java.util.Date().getYear() + 1900 %> 2024 항공 조회 페이지. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
