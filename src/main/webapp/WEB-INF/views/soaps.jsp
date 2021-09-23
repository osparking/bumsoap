<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bumsoap.store.types.Shapes" %>
<%@ page import="com.bumsoap.store.types.Shape_w" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>범이비누 목록</title>
<link rel="stylesheet" type="text/css" href="resources/css/body.css">
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
						<th>상품 번호</th><td>${bumsoap.BSSN}</td>
					</tr>
					<tr>
						<th>상품명</th><td>${bumsoap.bs_Name}</td>
					</tr>
					<tr>
						<th>주재료</th><td>${bumsoap.ingridi_1}</td>
					</tr>
					<tr>
						<th>비누 향</th><td>${bumsoap.fragrance}</td>
					</tr>
					<tr>
						<th>용도</th><td>${bumsoap.target.descrp}</td>
					</tr>
					<tr>
						<th>효과</th><td>${bumsoap.spec_Func}</td>
					</tr>
					<tr>
						<th>설명문</th>
						<td><textarea>${bumsoap.descrip}</textarea></td>
					</tr>
					<tr>
						<th>쇼핑몰</th>
						<td><a href="${bumsoap.mall_Link}" target="blank">
							네이버 쇼핑</a></td>
					</tr>
				</table>
			</c:forEach>
			
			<h4><a id="price_stock">가격 및 재고</a></h4>			
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
						<td>${normal.priceStr}원(${normal.stockStr}개)</td>
					</c:forEach>
				</tr>
				<tr>
					<th>${Shape_w.SMALL2.descrp}</th>
					<c:forEach items="${smalls}" var="small">
						<td>${small.priceStr}원(${small.stockStr}개)</td>
					</c:forEach>
				</tr>
			</table>
		
			<h4><a id="ingredients">전 성분(All Ingredients)</a></h4>
			<table class="bumsoap">
				<tr>
					<th>재료명</th>
					<th>중량(g)</th>
					<th>함유비율(%)</th>
					<th>특징 혹은 효능</th>
				</tr>
				<c:forEach items="${ingredients}" var="ing">
					<tr>
						<td>${ing.ing_Name}</td>
						<td>${ing.weightStr}</td>
						<td>${ing.percentStr}</td>
						<td>${ing.effects}</td>
					</tr>
				</c:forEach>
				<tr>
					<td>합</td>
					<td>126.3(g)</td>
					<td>100(%)</td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>