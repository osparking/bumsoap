<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>범이비누</title>
<link rel="stylesheet" type="text/css" href="resources/css/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/body.css">
</head>
<body>
	<section>
		<div class="pull_right" style="padding-right: 50px">
			<a href="?language=ko">한글</a>|<a href="?language=en">English</a>
			<a href="<c:url value="/logout" />">
				<spring:message code="login.a.logout"/>
			</a>			
		</div>
	</section>
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		<div>
			<p>범이는 이런 사람입니다.</p>
			<p>범이 비누를 만들게 된 동기입니다.</p>
			<p>범이 비누를 만드는 과정입니다.</p>
			<p>비누에 들어가는 모든 재료입니다.</p>
			<p>비누에 들어가는 모든 재료입니다.</p>
			<p>비누에 제조 및 판매 원가입니다.</p>
		</div>
	</div>
</body>
</html>
