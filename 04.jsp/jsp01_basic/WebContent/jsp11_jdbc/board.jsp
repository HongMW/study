<%@page import="com.lec.board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.board.BoardList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardList bl = new BoardList();
	ArrayList<Board> board_list = bl.getBoardList();
	String bd_tbl = "<table border='1'>";
	
	for(Board board:board_list) {
	    bd_tbl += "<tr><td>" + board.getBno() + "</td>"
	            + "<td>" + board.getSubject() +"</td>"
	            + "<td>" + board.getWriter() +"</td>"
	            + "<td>" + board.getContent() +"</td>";            
	}

	bd_tbl += "</table>";
	
	// 실습. board list를 c:forEach를 이용해서 출력해 보세요
	// th태그 글번호, 제목, 작성자, 글내용

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
	<%= bd_tbl %>
	<th/>
	<table border='1'>
	<c:forEach var="i" items="<%= board_list %>">
	<tr>	
		<td>${i.getBno()}</td>
		<td>${i.getSubject()}</td>
		<td>${i.getWriter()}</td>
		<td>${i.getContent()}</td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>