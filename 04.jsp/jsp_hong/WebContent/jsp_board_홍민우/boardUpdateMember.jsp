<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String bno = request.getParameter("bno");
	String sbj = request.getParameter("subject");
	String ctnt = request.getParameter("content");
	String wrt = request.getParameter("writer");
	
   Class.forName("org.mariadb.jdbc.Driver");
   String URL = "jdbc:mariadb://192.168.0.91:3306/myboard";
   String USER = "root";
   String PWD = "12345";
   String sql="update board set subject=?, content=?, writer=?, crtdate=now() where bno=?";
   
   
   Connection conn= null;
   PreparedStatement pstmt = null;
   int rs=0;
   
   try{
   conn = DriverManager.getConnection(URL,USER,PWD);
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, sbj);
   pstmt.setString(2, ctnt);
   pstmt.setString(3, wrt);
   pstmt.setString(4, bno);
   rs = pstmt.executeUpdate();
	}catch(Exception e){
		out.write("<h3 class='bg-danger text-white'>" + bno + "를 찾지 못했습니다!!</h3>");			
	}finally{
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			// dummy
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center">

		<h1>글수정</h1>
		
		<%
			if(rs > 0) {
		%>
				<h3 class="bg-info text-white"><%= bno %>번글의 정보가 성공적으로 수정되었습니다!!</h3>
		<%
			} else {
		%>
				<h3 class="bg-danger text-white">글정보 찾기실패!!! <%= bno %>를 찾지 못했습니다!!</h3>
		<%
			}
		%>
		
		<a href="boardList.jsp" class="btn btn-primary">게시판목록</a>
	</div>
</body>
</html>