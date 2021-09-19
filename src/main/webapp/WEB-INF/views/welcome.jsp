<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>범이비누</title>
<link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/header.css">	
</head>
<body>
	<div id="nav">
		<ul>
			<li><a href="http://localhost:8080/store/" target="_blank">Home</a></li>
			<li><a href="">범이 소개</a></li>
			<li><a href="">판매 상품</a></li>
			<li><a href="">질문 응답</a></li>
			<li><a href="">나의 구매</a></li>
			<li><a href="">나의 계정</a></li>
		</ul>
	</div>	
	<div class="jumbotron">
		<p> ${tagline} </p>
		<h1> ${greeting} </h1>
	</div>
</body>
</html>
