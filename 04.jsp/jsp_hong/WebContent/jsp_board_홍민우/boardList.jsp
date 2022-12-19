<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 <!-- 	1. myboard : 데이터베이스를 생성
 		2. myboard.board table생성
   	    -> bno, subject, writer, crtdate, readcnt, content;
  		3. board에
     	... list, insert, delete, update 기능을 구현하기 -->
     <div class="container" align="center">
     	
     	<table class="table table-boarded table-hover">
     		<tr>
     			<th>글번호</th>
     			<th>글제목</th>
     			<th>작성자</th>
     			<th>작성일자</th>
     			<th>글내용</th>
     			<th>삭제</th>
     		</tr>
     		<%
     			Class.forName("org.mariadb.jdbc.Driver");
     			Connection conn = null;
     			Statement stmt = null;
     			ResultSet rs = null;
     			
     			String url = "jdbc:mariadb://192.168.0.91:3306/myboard";
     			String usr = "root";
     			String pwd = "12345";
     			String sql = "select * from board order by bno";
     			
     			try{
     			    conn = DriverManager.getConnection(url, usr, pwd);
     			    stmt = conn.createStatement();
     			    rs = stmt.executeQuery(sql);
     			    
     			    while(rs.next()) {
     			        int bno = rs.getInt(1);
     			        String subject = rs.getString("subject");
     			        String writer = rs.getString("writer");
     			        Date crtdate = rs.getTimestamp("crtdate");
     			    	String content = rs.getString("content");
     		%>
     			<tr>
     				<td><a href="boardUpdate.jsp?bno=<%=bno%>" ><%= bno %></a></td>
     				<td><%= subject %></td>
     				<td><%= writer %></td>
     				<td><%= crtdate %></td>
     				<td><%= content %></td>
     				<td><a href="boardDelete.jsp?bno=<%=bno%>" class="btn btn-danger">삭제</a></td>
     			</tr>
     		<%
     			    }
     			} catch(Exception e) {
     			    out.write("<h3 class='bg-danger text-white'>DB접속실패!!!</h3><br>" + e.getMessage());
     			} finally {
     			    try {
     			        if(rs != null) rs.close();
     			        if(stmt != null) stmt.close();
     			        if(conn != null) conn.close();
     			    
     			    } catch(Exception e) {
     			        // dummy
     			    }
     			}
     		%>
     	</table>
     	<a href="boardInsert.jsp" class="btn btn-primary mt-sm-2">게시판등록</a>
     </div>
</body>
</html>