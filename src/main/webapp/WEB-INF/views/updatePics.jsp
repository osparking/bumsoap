<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bumsoap.store.types.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code='up_pic_order.title' /></title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/body.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/updatePics.css'/>">
</head>
<%
request.setCharacterEncoding("utf-8");
%>
<body onload="changeText('${soapBfr.descrip}');">
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		<div class="container">
			<h1>
				<spring:message code='up_pic_order.h1' />
			</h1>
			<h4 id="picOrder">
				<spring:message code='up_pic_order.h4' />
			</h4>
		</div>
		<div class="container">
			<div id="thumbs">
				<c:forEach items="${soapPics}" var="pic" varStatus="loop">
					<div class="thumb greyBox">
						<a><img class="thumb" id="thumb${loop.index}"
							src="<c:url value='/img/${pic.FName}'/>"> </a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
		function changeText(oText) {
			var desc = document.getElementById("descrip");
			desc.value = oText;
			return false;
		}
	</script>
</body>
</html>