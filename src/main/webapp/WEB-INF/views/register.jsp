<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="login.title" /></title>
<link rel="stylesheet" type="text/css" href="resources/css/body.css">	
</head>
<body>
	<section>
		<div style="padding-right: 50px">
			<a href="?language=ko">한글</a>|<a href="?language=en">English</a>
		</div>
	</section>
	
	<jsp:include page="top_menu.jsp"/>

	<div class="panel-heading" style="margin-top: 300px">
			<spring:message code="accnt.register.msg" />
			<div class="panel-body">
				<c:url var="register" value="/register" />
				<form:form method="POST" modelAttribute="bumUser"
						name="registerForm">
					<div>
						<label for="userId">아이디 
						</label> 
						<spring:message 
									code="login.form.userId" var="idHolder"/>
						<form:input type="text" path="userId"
							id="userId" name="userId" value="${idHolder}"
							required="true"/>
					</div>
					<div>
						<label for="password">비밀번호
						</label> 
						<form:input type="password" path="password"
							id="password" name="password" required="true"/>
					</div>
		
					<input type="submit"
						value="<spring:message code='login.form.submit'/>"/>
				</form:form>
			</div>			
			
			<div>아니면</div>
			<spring:message code="login.h3.top"/>
			<c:choose>
			<c:when test="${userId == null}">
				<a href="<c:url value="/login" />">
					<spring:message code="login.h3.top"/>
				</a>				
			</c:when>
			<c:otherwise>
				<div>여기 계정 정보 표시됨...
				</div>
			</c:otherwise>	
			</c:choose>
	</div>
</body>
</html>