<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Spring Framework</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
		integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
</head>
<body>
	<div class="container" align="center">
		<div class="mt-4 p-5 bg-primary text-white rounded">
			<h3>Board Select</h3>
			<p>상세설명......................</p>
			
		</div>
		<br>
			<form>
			
				<div class="input-group mb-3">
					<div class="input-group-text"><i class="fas fa-user"></i></div>
					<input type="text" name="seq" class="form-control" id="seq" disabled value="${ board.getSeq() }">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-text"><i class="fa-thin fa-heading"></i></div>
					<input type="text" name="title" class="form-control" id="title" disabled value="${ board.getTitle() }">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-text"><i class="fas fa-address-book"></i></div>
					<input type="text" name="writer" class="form-control" id="writer" disabled value="${ board.getWriter() }">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-comment-dots"></i></span></div>
					<textarea class="form-control" name="content" id="content" rows="15" cols="40" disabled>${ board.getContent() }</textarea>
				</div>
				
			</form>
			<button type="button" class="btn btn-primary"><a href="getBoardList.do" ><i class="text-white">게시판목록</i></a></button>
	</div>		
</body>
</html>			