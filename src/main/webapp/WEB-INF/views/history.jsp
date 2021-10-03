<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags"%>  
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="history.title"/></title>	
<link rel="stylesheet" type="text/css" href="resources/css/body.css">	
</head>
<body>
	<section>
		<div class="pull_right" style="padding-right: 50px">
			<a href="?language=ko">한글</a>|<a href="?language=en">English</a>
			<c:choose>
				<c:when test="${userId == null}">
					<a href="<c:url value="/login" />">
						<spring:message code="login.a.login"/>
					</a>				
				</c:when>
				<c:otherwise>
					<a href="<c:url value="/logout" />">
						<spring:message code="login.a.logout"/>
					</a>				
				</c:otherwise>
			</c:choose>		
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
			<p>'${userId}' 
				<spring:message code='history.name_suffix'/></p>
			<h1><spring:message code='history.h1'/></h1>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js" 
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
		crossorigin="anonymous">
	</script>	
</body>
</html>
