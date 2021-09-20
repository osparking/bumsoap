<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>범이비누</title>	
<link rel="stylesheet" type="text/css" href="resources/css/body.css">	
</head>
<body>
	<div id="slogan_div">
	<jsp:include page="top_menu.jsp"/>
		<div class="notice">
			<p>홈-Icon: <a href="https://www.iconsdb.com/white-icons/home-icon.html">
				iconsdb.com</a></p>
		</div>
		<div id="slogan_text">
			<p>${tagline}</p>
			<h1>${greeting}</h1>
		</div>
	</div>
</body>
</html>
