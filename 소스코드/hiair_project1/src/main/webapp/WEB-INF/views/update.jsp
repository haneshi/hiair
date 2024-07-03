<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 수정</title>
    <link rel="stylesheet" type="text/css" href="css/update.css">
    <script>
        function validateForm() {
            var idValue = document.getElementById("id").value;
            var subjectValue = document.getElementById("subject").value;
            var contentValue = document.getElementById("content").value;
            if (idValue.trim() === "" || subjectValue.trim() === "" || contentValue.trim() === "") {
                alert("ID, 제목, 내용을 모두 입력해주세요.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <header>
        <div class="container">
            <h1 onclick="window.location.href='board'">HiAir</h1>
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
    
    <section class="update">
        <div class="container">
            <h2>게시물 수정</h2>
            <form action="editArticle" method="post" onsubmit="return validateForm()">
                <div>
                    <label for="id">ID:</label><br>
                    <input type="text" id="id" name="id" value="${article.id}" required readonly><br>
                </div>
                <div>
                    <label for="subject">제목:</label><br>
                    <input type="text" id="subject" name="subject" value="${article.subject}" required><br>
                </div>
                <div>
                    <label for="content">내용:</label><br>
                    <textarea id="content" name="content" rows="4" cols="50" required>${article.content}</textarea><br>
                </div>
                <button type="submit">수정 완료</button>
            </form>
        </div>
    </section>
    
    <footer>
        <div class="container">
            <p>&copy; 2024 HiAir. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
