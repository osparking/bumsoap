<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags"%>
<%@ page import="com.bumsoap.store.types.Shapes" %>
<%@ page import="com.bumsoap.store.types.Shape_w" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="soaps.title"/></title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/body.css'/>">	
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/top_menu.css'/>">
</head>
<body>
	<jsp:include page="top_menu.jsp" />
	<div id="body_div">
		<div class="container">
			<h1><spring:message code="soaps.h1"/></h1>
			<h4 id="info"><spring:message code="soaps.id_info"/>(
				<a href="<c:url 
					value='/soaps/update/soap?bssn=${soap.bssn}'/>">
				<spring:message code="soaps.id_info.a"/></a>)</h4>				
		</div>
		<div class="container">
			<div class="soapImg" style="width: 35%; float: left;">
				<img src="<c:url value='/img/${soap.pics[0].FName}'/>"
					alt="<spring:message code="soaps.id_mainPic.alt"/>" 
					class="soapImg" id="mainPic" style="width:100%"/>
			</div>
			<div class="soapTxt">
				<div>
					<table class="bumsoap">
						<tr>
							<th><spring:message code="soaps.detail.name"/></th>
							<td>${soap.bsName}</td>
						</tr>
						<tr>
							<th><spring:message code="soaps.detail.mater"/></th>
							<td>${soap.ingridi1}</td>
						</tr>
						<tr>
							<th><spring:message code="soaps.detail.frag"/></th>
							<td>${soap.fragrance}</td>
						</tr>
						<tr>
							<th><spring:message code="soaps.detail.use"/></th>
							<td>${soap.target.descrp}</td>
						</tr>
						<tr>
							<th><spring:message code="soaps.detail.effe"/></th>
							<td>${soap.specFunc}</td>
						</tr>
						<tr>
							<th><spring:message code="soaps.detail.expl"/></th>
							<td><textarea>${soap.descrip}</textarea></td>
						</tr>
						<tr>
							<th><spring:message code="soaps.detail.mall"/></th>
							<td><a href="${soap.mallLink}" target="blank">
									<spring:message code="soaps.detail.mall.a"/>
									</a></td>
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
				<h4><a id="price_stock">
					<spring:message code="soaps.pr_st.a"/></a></h4>			
				<table>
					<tr>
						<th><spring:message code="soaps.pr_st.unit"/></th>
						<th>${Shapes.NORMAL.descrp}</th>
						<th>${Shapes.MEAJOO.descrp}</th>
						<th>${Shapes.WHITE.descrp}</th>
					</tr>
					<tr>
						<th>${Shape_w.NORMAL.descrp}</th>
						<c:forEach items="${normals}" var="normal">
							<td>${normal.priceStr}원(${normal.stockStr}
								<spring:message code="soaps.pr_st.note"/>)</td>
						</c:forEach>
					</tr>
					<tr>
						<th>${Shape_w.SMALL2.descrp}</th>
						<c:forEach items="${smalls}" var="small">
							<td>${small.priceStr}원(${small.stockStr}
								<spring:message code="soaps.pr_st.note"/>)</td>
						</c:forEach>
					</tr>
				</table>
			
				<h4><a id="ingredients">
					<spring:message code="soaps.ingre.h4.a"/></a></h4>
				<table class="bumsoap">
					<tr>
						<th><spring:message code="soaps.ingre.th.name"/></th>
						<th><spring:message code="soaps.ingre.th.weig"/></th>
						<th><spring:message code="soaps.ingre.th.perc"/></th>
						<th><spring:message code="soaps.ingre.th.effe"/></th>
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
						<td><spring:message code="soaps.ingre.td.sum"/></td>
						<td>126.3(g)</td>
						<td>100(%)</td>
						<td></td>
					</tr>
				</table>
			
				<h4><a id="sell_price">
					<spring:message code="soaps.price.h4.a"/></a></h4>
				<table class="bumsoap">
					<tr>
						<td><img alt=
							"<spring:message code="soaps.price.alt.all"/>"
							src="<c:url value='/img/soap/price_sell.png'/>"/>
						</td>
					</tr>
					<tr>
						<td><img alt=
							"<spring:message code="soaps.price.alt.ele"/>"
							src="<c:url value='/img/soap/price_elec.png'/>"/>
						</td>
					</tr>
					<tr>
						<td><img alt=
							"<spring:message code="soaps.price.alt.mate"/>"
							src="<c:url value='/img/soap/price_mete.png'/>"/>
						</td>
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