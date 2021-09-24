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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/body.css'/>">	
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/top_menu.css'/>">
</head>
<body>
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		<div class="container">
			<h1>범이비누</h1>
			<h4 id="info">상세정보(
				<a href="<c:url 
					value='/soaps/update/soap?bssn=${soap.bssn}'/>">
				정보갱신</a>)</h4>
		</div>
		<div class="container">
			<div class="soapImg" style="width: 35%; float: left;">
				<img src="<c:url value='/img/${soap.pics[0].FName}'/>"
					alt="상품 사진" class="soapImg" id="mainPic"
					style="width:100%"/>
			</div>
			<div class="soapTxt">
				<div>
					<table class="bumsoap">
						<tr>
							<th>상품 번호</th><td>${soap.bssn}</td>
						</tr>
						<tr>
							<th>상품명</th><td>${soap.bsName}</td>
						</tr>
						<tr>
							<th>주재료</th><td>${soap.ingridi1}</td>
						</tr>
						<tr>
							<th>비누 향</th><td>${soap.fragrance}</td>
						</tr>
						<tr>
							<th>용도</th><td>${soap.target.descrp}</td>
						</tr>
						<tr>
							<th>효과</th><td>${soap.specFunc}</td>
						</tr>
						<tr>
							<th>설명문</th>
							<td><textarea>${soap.descrip}</textarea></td>
						</tr>
						<tr>
							<th>쇼핑몰</th>
							<td><a href="${soap.mallLink}" target="blank">
								네이버 쇼핑</a></td>
						</tr>
					</table>
				</div>
				<div class="thumbbox">
					<c:forEach items="${soap.pics}" var="pic">
						<div class="thumb">
							<a onclick="return changeMainPic('${pic.FName}')">
							  <img class="thumb" 
							  	   src="<c:url value='/img/${pic.FName}'/>"
							  	   onmouseover=
							  	   	"changeMainPic('${pic.FName}')">				  
							</a>
						</div>						
					</c:forEach>
				</div>
			</div>
			<div class="below" style="clear:both">
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
			
				<h4><a id="sell_price">판매 원가</a></h4>
				<table class="bumsoap">
					<tr>
						<td><img alt="판매 원가표"
							src="<c:url value='/img/soap/price_sell.png'/>"/></td>
					</tr>
					<tr>
						<td><img alt="전자상거래 비용"
							src="<c:url value='/img/soap/price_elec.png'/>"/></td>
					</tr>
					<tr>
						<td><img alt="투입 재료비"
							src="<c:url value='/img/soap/price_mete.png'/>"/></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<script>
		function changeMainPic(fileName) {
			var mainPic = document.getElementById("mainPic");
			mainPic.src = "<c:url value='/img/" + fileName + "'/>";
			return false;
		}
	</script>
</body>
</html>