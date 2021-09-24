<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form"%>
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
<body onload="changeText('${soapBfr.descrip}');">
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		<div class="container">
			<h1>범이비누</h1>
			<h4 id="info">상세정보</h4>
		</div>
		<div class="container">
			<div class="updateSoap">
				<form:form method="POST" modelAttribute="soap"
					name="updateForm" onsubmit="return checkStockValue()">
					<fieldset class="updateSoap">
						<legend>비누 갱신</legend>
						<table class="updateSoap">
							<tr>
								<th><label for="bssn">상품 번호</label></th>
								<td><form:input name="stock" path="bssn" 
										value="${soapBfr.bssn}" type="text"
										readonly="true" class="readonly"/>(변경 불가)
								</td>
							</tr>
							<tr>
								<th><label for="bsName">상품명</label></th>
								<td><form:input name="bsName" 
										value="${soapBfr.bsName}"
										path="bsName" type="text" />
								</td>
							</tr>
							<tr>
								<th><label for="ingridi1">주 재료</label></th>
								<td><form:input name="ingridi1" 
										value="${soapBfr.ingridi1}"
										path="ingridi1" type="text" />
								</td>
							</tr>
							<tr>
								<th><label for="fragrance">비누 향</label></th>
								<td><form:input name="fragrance" 
										value="${soapBfr.fragrance}"
										path="fragrance" type="text" />
								</td>
							</tr>
							<tr>
								<th><label for="target">용도</label></th>
								<td><form:input name="target" 
									value="${soapBfr.target.descrp}"
									path="target" type="text" />
								</td>
							</tr>
							<tr>
								<th><label for="specFunc">효과</label></th>
								<td><form:input name="specFunc" 
									value="${soapBfr.specFunc}" path="specFunc" 
									type="text" size="80" />
								</td>
							</tr>
							<tr>
								<th><label for="descrip">설명</label></th>
								<td><form:textarea name="descrip" id="descrip"
									path="descrip" cols="40" rows="5"/>
								</td>
							</tr>
							<tr>
								<th><label for="mallLink">쇼핑몰</label></th>
								<td><form:input name="mallLink" 
									value="${soapBfr.mallLink}"	path="mallLink" 
									type="text" size="80"/>
								</td>
							</tr>
						</table>
					</fieldset>
				</form:form>
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