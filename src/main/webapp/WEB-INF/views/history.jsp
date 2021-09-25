<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags"%>  
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>
<spring:message code='menu.intro.button'/>
범이비누</title>	
<link rel="stylesheet" type="text/css" href="resources/css/body.css">	
</head>
<body>
	<section>
		<div class="pull_right" style="padding-right: 50px">
			<a href="?language=ko">한글</a>|<a href="?language=en">English</a>
		</div>
	</section>

	<div id="body_div">
	<jsp:include page="top_menu.jsp"/>
		<div class="notice">
			<p>
				<spring:message code='menu.intro.button'/>
				홈-Icon: 
			<a href="https://www.iconsdb.com/white-icons/home-icon.html">
				iconsdb.com</a></p>
		</div>
		<div id="slogan_text">
			<p><spring:message code='welcome.tagline'/></p>
			<h1><spring:message code='welcome.greeting'/></h1>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js" 
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
		crossorigin="anonymous">
	</script>	
</body>
</html>
