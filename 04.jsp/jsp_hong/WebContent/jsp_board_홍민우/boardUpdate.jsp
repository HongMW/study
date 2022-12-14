<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String bno = request.getParameter("bno");
	String sbj = "";
	String wrt = "";
	String ctnt = "";
	
    
	Class.forName("org.mariadb.jdbc.Driver");
    
	
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    String url = "jdbc:mariadb://192.168.0.91:3306/myboard";
	String usr = "root";
	String pwd = "12345";
	String sql = "select * from board where bno = "+ bno;
	
	try {
		conn = DriverManager.getConnection(url, usr, pwd);
		
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
        
		if(rs.next()) {			
		    sbj = rs.getString("subject");
		    wrt = rs.getString("writer");
		    ctnt = rs.getString("content");
		} else {
			out.write("<h3 class='bg-danger text-white'>" + bno + "를 찾지 못했습니다!!</h3>");			
		}
	} catch(Exception e) {
		out.write("<h3 class='bg-danger text-white'>DB접속실패!!!</h3><br>");			
	} finally {
		// 5. close() DB 연결 해제
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
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
		<h1>글 수정하기</h1>
		
		<form action="boardUpdateMember.jsp" method="post">
			
			<table class="table table-bordered table-dark table-hover">
				<tr>
					<td width="20%">글번호</td>
					<td><input type="text" name="bno" class="form-control" size="30" value="<%= bno %>" disabled/></td>
				</tr>
				<tr>
					<td width="20%">글제목</td>
					<td><input type="text" name="subject" class="form-control" size="30" value="<%= sbj %>" /></td>
				</tr>
				<tr>
					<td width="20%">작성자</td>
					<td><input type="text" name="writer" class="form-control" size="30" value="<%= wrt %>" /></td>
				</tr>
				<tr>
					<td width="20%">글내용</td>
					<td><input type="text" name="content" class="form-control" size="30" value="<%= ctnt %>" /></td>
				</tr>
			</table>
			<input type="hidden" name="bno" value="<%= bno %>"/>
			<input type="submit" class="btn btn-info mt-sm-2" value="글수정"/>
			<a href="boardList.jsp" class="btn btn-info mt-sm-2">게시판목록</a>
		</form>
	</div>
</body>
</html>