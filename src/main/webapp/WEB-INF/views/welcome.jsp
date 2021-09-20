<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>범이비누</title>
<!-- <link rel="stylesheet" 
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="resources/css/header.css">	
<link rel="stylesheet" type="text/css" href="resources/css/body.css">	
</head>
<body>
	<div id="slogan_div">
	<jsp:include page="top_menu.jsp"/>
		<div id="slogan_text">
			<p>${tagline}</p>
			<h1>${greeting}</h1>
		</div>
		<div class="notice">
			<p>
				<a href="http://www.rawshorts.com">Designed by Raw Shorts</a>
			</p>
		</div>
	</div>
</body>
</html>
