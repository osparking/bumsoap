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
		<h1 class="panel-title">
			<spring:message code="login.h3.top" />
		</h1>
	</div>
	<div class="panel-body">
		<c:url var="loginUrl" value="/login" />
		<form action="${loginUrl}" method="post" class="form-horizontal">

			<c:if test="${param.error != null}">
				<div class="alert alert-danger">
					<p>
						<spring:message code="login.form.error" />
					</p>
				</div>
			</c:if>

			<c:if test="${param.logout != null}">
				<div class="alert alert-success">
					<p>
						<spring:message code="login.form.logout" />
					</p>
				</div>
			</c:if>

			<c:if test="${param.accessDenied != null}">
				<div class="alert alert-danger">
					<p>
						<spring:message code="login.form.denied" />
					</p>
				</div>
			</c:if>

			<div class="input-group input-sm">
				<label class="input-group-addon" for="userId"> 
				<i class="fa fa-user"></i></label> 
				<input type="text"
					class="form-control" id="userId" name="userId"
					placeholder="<spring:message code='login.form.userId'/>"
					required>
			</div>
			<div class="input-group input-sm">
				<label class="input-group-addon" for="password"> <i
					class="fa fa-lock"></i></label> <input type="password"
					class="form-control" id="password" name="password"
					placeholder="<spring:message code='login.form.password'/>"
					required>
			</div>

			<div class="form-actions">
				<input type="submit"
					class="btn btn-block btn-primary btn-default"
					value="<spring:message code='login.form.submit'/>">
			</div>
		</form>
	</div>
</body>
</html>