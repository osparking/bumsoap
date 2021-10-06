<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags"%>
<%@ page import="com.bumsoap.store.types.Shapes" %>
<%@ page import="com.bumsoap.store.types.Shape_w" %>
<%@ taglib prefix="fmt" 
		uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="soaps.title"/></title>
<spring:url value="/resources/css/body.css" var="body" />
<link href="${body}" rel="stylesheet" /> 	
<spring:url value="/resources/css/soaps.css" var="soaps" />
<link href="${soaps}" rel="stylesheet" /> 
<spring:url value="/resources/css/top_menu.css" var="top_menu" />
<link href="${top_menu}" rel="stylesheet" /> 
</head>
<body>
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		
		<div id="heading1">
			<div id="pageTitle">
				<h1><spring:message code="soaps.h1"/></h1>
			</div>
		</div>
		
		<div class="container">
			<h4 id="info"><spring:message code="soaps.id_info"/>
			<c:set var="upAnchor"><spring:message code=
															'soaps.id_info.a'/></c:set>
			<c:if test="${userId == 'admin'}">
				(<a href="<c:url value= 
					'/soaps/update/soap?bssn=${soap.bssn}'/>">${
																					upAnchor}</a>)
			</c:if>
			</h4>				
		</div>
		<div class="container">
			<div class="soapImg" style="width: 35%; float: left;">
				<img src="<c:url value='/img/${soap.pics[0].FName}'/>"
					alt="<spring:message code="soaps.id_mainPic.alt"/>" 
					class="soapImg" id="mainPic" style="width:100%"/>
			</div>
			<div class="soapTxt">
				<div>
					<!-- 비누 속성 표 -->
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
				<h4><a id="price_stock" class="subsection">
					<spring:message code="soaps.pr_st.a"/></a></h4>	
				<div class="sbarHori">		
					<table id="stock_price">
						<tr class="header_cell">
							<th rowspan="2">
								<spring:message code="soaps.pr_st.unit"/></th>
							<th colspan="2" class="col">
								<spring:message code="soaps.pr_st.normal"/></th>
							<th colspan="2" class="col">
								<spring:message code="soaps.pr_st.maejoo"/></th>
							<th colspan="2" class="col">
								<spring:message code="soaps.pr_st.sWhite"/></th>
						</tr>
						<tr>
							<c:forEach var="shape" items="${Shapes.values()}">
								<th><spring:message code="soaps.pr_st.price"/></th>
								<th><spring:message code="soaps.pr_st.stock"/></th>
							</c:forEach>
						</tr>
						<tr>
							<th class="row">${Shape_w.NORMAL.descrp}</th>
							<c:forEach items="${normals}" var="normal">
								<td class="number">${normal.priceStr}</td>
								<td class="number">(${normal.stockStr}<
									spring:message code="soaps.pr_st.note"/>)</td>
							</c:forEach>
						</tr>
						<tr>
							<th class="row">${Shape_w.SMALL2.descrp}</th>
							<c:forEach items="${smalls}" var="small">
								<td class="number">${small.priceStr}</td>
								<td class="number">(${small.stockStr}<
									spring:message code="soaps.pr_st.note"/>)</td>
							</c:forEach>
						</tr>
					</table>
				</div>
				
				<h4><a id="ingredients" class="subsection">
					<spring:message code="soaps.ingre.h4.a"/></a></h4>
				<div class="sbarHori" style="overflow:auto">
					<table id="ingredients">
						<tr class="header_cell">
							<th><spring:message code="soaps.ingre.th.name"/></th>
							<th><spring:message code="soaps.ingre.th.weig"/></th>
							<th><spring:message code="soaps.ingre.th.perc"/></th>
							<th><spring:message code="soaps.ingre.th.effe"/></th>
						</tr>
						<c:forEach items="${ingredients}" var="ing">
							<tr class="ingre_row">
								<td class="mater_name">${ing.ing_Name}</td>
								<td class="number w130">${ing.weightStr}</td>
								<td class="number w130">${ing.percentStr}</td>
								<td class="effe_stmt">${ing.effects}</td>
							</tr>
						</c:forEach>
						<tr class="header_cell">
							<th style="text-align: center">
								<spring:message code="soaps.ingre.td.sum"/></th>
							<td class="total" 
									style="text-align:center">126.3(g)</td>
							<td class="total"
									style="text-align:center">100(%)</td>
							<td></td>
						</tr>
					</table>
				</div>
			
				<h4><a id="sell_price" class="subsection">
					<spring:message code="soaps.price.h4.a"/></a></h4>
				<table>
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