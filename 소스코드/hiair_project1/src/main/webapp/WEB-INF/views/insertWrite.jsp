<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 작성 결과</title>
</head>
<body>
    <%
    	String subject = request.getParameter("subject");
    	String content = request.getParameter("content");
        String name = request.getParameter("name");
        
        // 현재 날짜를 가져옵니다
        java.sql.Date regdate = new java.sql.Date(System.currentTimeMillis());

        // write.jsp에서 받은 데이터를 데이터베이스에 저장합니다
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // 데이터베이스 연결 설정
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "scott", "tiger");
            
            // SQL 쿼리 작성
            String sql = "INSERT INTO BOARD (SUBJECT, CONTENT, NAME, REGDATE) VALUES (?, ?, ?, ?)";
            
            // PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);
            
            // 파라미터 설정
            pstmt.setString(1, subject);
            pstmt.setString(2, content);
            pstmt.setString(3, name);
            pstmt.setDate(4, regdate);
            
            // SQL 실행
            pstmt.executeUpdate();
            
            // 작성 완료 후 게시판 페이지로 이동
            response.sendRedirect("board.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 정리
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
