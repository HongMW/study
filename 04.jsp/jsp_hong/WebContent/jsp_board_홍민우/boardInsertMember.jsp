<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String bno = request.getParameter("bno");
	String sbj = request.getParameter("subject");
	String wrt = request.getParameter("writer");
	String ctnt = request.getParameter("content");
	String cdate = request.getParameter("crtdate");
	
	Class.forName("org.mariadb.jdbc.Driver");
	String url = "jdbc:mariadb://192.168.0.91:3306/myboard";
	String usr = "root";
	String pwd = "12345";
	String sql = " insert into board (subject, writer, crtdate, readcnt, content) values (?,?,now(),0,?)";

	Connection conn = null;
	PreparedStatement pstmt = null;
	int rs = 0;
	boolean isConn = true;
	
	try{
	    conn = DriverManager.getConnection(url, usr, pwd);
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, sbj);
	    pstmt.setString(2, wrt);
	    pstmt.setString(3, ctnt);
	    rs = pstmt.executeUpdate();
	} catch(Exception e) {
	    
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
		
		<h1>게시판등록하기</h1>
		
		<c:choose>
		
			<c:when test="<%= isConn %>">
				<h3>게시판이 성공적으로 등록되었습니다.</h3>
				글제목  : <%= sbj %>
				작성자  : <%= wrt %>
				글내용  : <%= ctnt %>
			</c:when>
			<c:otherwise>
				<h3 class="bg-danger text-white">게시판 등록이 실패했습니다!!</h3>
			</c:otherwise>
		</c:choose>
		
		<form action="boardInsert.jsp">
			<input type="submit" class="btn btn-info" value="돌아가기"/>
			<a href="boardList.jsp" class="btn btn-info">게시판목록</a>
		</form>
	</div>
</body>
</html>