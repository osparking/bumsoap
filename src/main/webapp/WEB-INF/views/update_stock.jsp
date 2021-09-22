<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" 
	uri="http://www.springframework.org/tags"%>	
<%@ page import="com.bumsoap.store.types.Shapes" %>
<%@ page import="com.bumsoap.store.types.Shape_w" %>
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
			<p>상세정보</p>
		</div>

		<table>
			<tr>
				<th>가격(재고)</th>
				<th>${Shapes.NORMAL.descrp}</th>
				<th>${Shapes.MEAJOO.descrp}</th>
				<th>${Shapes.WHITE.descrp}</th>
			</tr>
			<tr>
				<th>${Shape_w.NORMAL.descrp}</th>
				<c:forEach items="${normals}" var="normal">
					<td>${normal.stock}</td>
				</c:forEach>
			</tr>
			<tr>
				<th>${Shape_w.NORMAL.descrp}</th>
				<c:forEach items="${smalls}" var="small">
					<td>${small.stock}</td>
				</c:forEach>
			</tr>
		</table>
		<form:form method="POST" modelAttribute="soapStock">
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
				<div>
					<label for="stock">증감량(음수:감소, 양수: 증가)</label>
					<form:input name="stock" path="stock" type="text"/>
				</div>
				<input type="submit" id="btnAdd" value="갱신" />
			</fieldset>			
		</form:form>
	</div>
</body>
</html>