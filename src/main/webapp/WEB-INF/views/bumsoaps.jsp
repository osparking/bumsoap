<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>범이비누 목록</title>
<link rel="stylesheet" type="text/css" 
	href="resources/css/body.css">
</head>
<body>
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		<div class="container">
			<h1>범이비누</h1>
			<p>상세정보</p>
		</div>
		<div class="container">
			<c:forEach items="${bumsoaps}" var="bumsoap">
				<table class="bumsoap">
					<tr>
						<th>상품 번호</th>
						<td>${bumsoap.BSSN}</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${bumsoap.bs_Name}</td>
					</tr>
					<tr>
						<th>주요 재료</th>
						<td>${bumsoap.ingridi_1}</td>
					</tr>
					<tr>
						<th>비누 향</th>
						<td>${bumsoap.fragrance}</td>
					</tr>
					<tr>
						<th>비누 용도</th>
						<td>${bumsoap.target.descrp}</td>
					</tr>
					<tr>
						<th>특징 및 효과</th>
						<td>${bumsoap.spec_Func}</td>
					</tr>
					<tr>
						<th>설명문</th>
						<td><textarea>${bumsoap.descrip}</textarea></td>
					</tr>
					<tr>
						<th>쇼핑몰 링크</th>
						<td><a href="${bumsoap.mall_Link}" target="blank">
							네이버 쇼핑</a></td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>