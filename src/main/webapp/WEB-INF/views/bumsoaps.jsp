<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>범이비누 목록</title>
</head>
<body>
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		<div class="container">
			<h1>범이비누</h1>
			<p>범이비누 상세정보</p>
		</div>
		<div class="row">
			<c:forEach items="${bumsoaps}" var="bumsoap">
				<table class="bumsoap">
					<tr>
						<th>상품명</th>
						<td>${bumsoap.bs_Name}</td>
					</tr>
					<tr>
						<th>설명문</th>
						<td>${bumsoap.descrip}</td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>