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
		<div class="pull_right" style="padding-right: 50px">
			<a href="?language=ko">한글</a>|<a href="?language=en">English</a>
		</div>
	</section>
	
	<jsp:include page="top_menu.jsp"/>

	<div class="panel-heading" style="margin-top: 300px">
			<spring:message code="accnt.register.msg" />
			<div class="panel-body">
				<c:url var="register" value="/register" />
				<form action="${register}" method="post" modelAttribute="user" 
						class="form-horizontal">
					<div>
						<label for="userId">아이디 
						</label> 
						<form:input type="text" path="userId"
							id="userId" name="userId"
							placeholder="<spring:message code='login.form.userId'/>"
							required/>
					</div>
					<div>
						<label for="password">비밀번호
						</label> 
						<input type="password"
							id="password" name="password"
							placeholder="<spring:message code='login.form.password'/>"
							required>
					</div>
		
					<div>
						<input type="submit"
							value="<spring:message code='login.form.submit'/>">
					</div>
				</form>
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