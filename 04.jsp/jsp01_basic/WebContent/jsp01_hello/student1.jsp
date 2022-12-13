<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import= "java.util.*" %>
<%
class Student{
	int sno;
	String name;
	String gender;
	int age;
	
	public Student(int sno, String name, String gender, int age) {
		this.sno = sno;
		this.name = name;
		this.gender = gender;
		this.age = age;
	}
}

Student std = new Student(1000, "홍길동", "남자", 43);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= std.name %>의 번호는 <%= std.sno %>, 성별은 <%= std.gender %>, 나이는 <%= std.age %></h1>
</body>
</html>