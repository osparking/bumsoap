<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bumsoap.store.types.Shapes"%>
<%@ page import="com.bumsoap.store.types.Shape_w"%>
<%@ page import="com.bumsoap.store.types.IncType"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>범이비누 목록</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/body.css'/>">
</head>
<body>
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		<div class="container">
			<h1>범이비누</h1>
			<p>재고 수량(개)</p>
		</div>

		<table>
			<tr>
				<th>구분</th>
				<th>${Shapes.NORMAL.descrp}</th>
				<th>${Shapes.MEAJOO.descrp}</th>
				<th>${Shapes.WHITE.descrp}</th>
			</tr>
			<tr>
				<th>${Shape_w.NORMAL.descrp}</th>
				<c:forEach items="${normals}" var="normal">
					<td>${normal.stockStr}</td>
				</c:forEach>
			</tr>
			<tr>
				<th>${Shape_w.SMALL2.descrp}</th>
				<c:forEach items="${smalls}" var="small">
					<td>${small.stockStr}</td>
				</c:forEach>
			</tr>
		</table>
		<form:form method="POST" modelAttribute="soapStock"
			name="updateForm" onsubmit="return checkStockValue()">
			<fieldset>
				<legend>재고 갱신</legend>
				<form:select path="shape">
					<c:forEach items="${Shapes.values()}" var="shape">
						<form:option value="${shape}">
							${shape.descrp}</form:option>
					</c:forEach>
				</form:select>
				<form:select path="shape_w">
					<c:forEach items="${Shape_w.values()}" var="shape_w">
						<form:option value="${shape_w}">
							${shape_w.descrp}</form:option>
					</c:forEach>
				</form:select>
				
				<label for="incType0">${IncType.values()[0].descrp}</label>
				<form:radiobutton name="incType0" checked="checked" 
					path="incType" value="${IncType.values()[0]}"/>
					
				<label for="incType1">${IncType.values()[1].descrp}</label>
				<form:radiobutton name="incType1"  
					path="incType" value="${IncType.values()[1]}"/>
					
				<div>
					<label for="stock">재고</label>
					<form:input name="stock" id="stock" 
						path="stock" type="text" />
				</div>
				<input type="submit" id="btnAdd" value="갱신" />
			</fieldset>
		</form:form>
	</div>
	<script>
		function checkStockValue() {
 			var stockField = document.getElementById("stock");
			var stockStr = stockField.value;
			
			if (stockStr.trim().length === 0) {
				alert("증감량을 입력하세요.");
				return false;
			} 
			
			var value = Number(stockStr);
			
			if (Math.floor(value) == value) {
				return true;
			} else {
				alert("증감량은 정수만 가능합니다.");
				return false;
			} 
		}
	</script>
</body>
</html>