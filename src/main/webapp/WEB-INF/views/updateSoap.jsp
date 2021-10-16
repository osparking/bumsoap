<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags"%>	
<%@ page import="com.bumsoap.store.types.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code='updateSoap.title'/></title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/body.css'/>">
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/updateSoap.css'/>">
</head>
<%
    request.setCharacterEncoding("utf-8");
%>
<body onload="changeText('${soapBfr.descrip}');">
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		<div class="container">
			<h1><spring:message code='soaps.title'/></h1>
			<h4 id="info">
				<spring:message code='menu.soaps.detail'/>
			</h4>
		</div>
		<div class="container">
			<div class="updateSoap">
				<form:form method="POST" modelAttribute="soap"
					name="updateForm" onsubmit="return checkStockValue()">
					<fieldset class="updateSoap">
						<legend>
						<spring:message code='up_soap.form.legend'/>
						</legend>
						<table class="updateSoap">
							<tr>
								<th><label for="bsName">
									<spring:message code='soaps.detail.name'/>
									</label></th>
								<td><form:input name="bsName" 
										value="${soapBfr.bsName}"
										path="bsName" type="text" />
								</td>
							</tr>
							<tr>
								<th><label for="ingridi1">
									<spring:message code='soaps.detail.mater'/>
									</label></th>
								<td><form:input name="ingridi1" 
										value="${soapBfr.ingridi1}"
										path="ingridi1" type="text" size="65" />
								</td>
							</tr>
							<tr>
								<th><label for="fragrance">
									<spring:message code='soaps.detail.frag'/>
									</label></th>
								<td><form:input name="fragrance" 
										value="${soapBfr.fragrance}"
										path="fragrance" type="text" />
								</td>
							</tr>
							<tr>
								<th><label for="target">
									<spring:message code='soaps.detail.use'/>
									</label></th>
								<td>
									<form:select path="target">
										<c:forEach items="${Target.values()}" 
																var="target">
											<c:choose>
												<c:when test=
														"${target eq soapBfr.target}">
													<form:option value="${target}"
															selected="true">
														${target.descrp}
													</form:option>
												</c:when>
												<c:otherwise>
														<form:option value="${target}">
															${target.descrp}
														</form:option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select>
								</td>
							</tr>
							<tr>
								<th><label for="specFunc">
								<spring:message code='soaps.title'/>
								효과</label></th>
								<td><form:input name="specFunc" 
									value="${soapBfr.specFunc}" path="specFunc" 
									type="text" size="65" />
								</td>
							</tr>
							<tr>
								<th><label for="descrip">
									<spring:message code='soaps.detail.effe'/>
									</label></th>
								<td><form:textarea name="descrip" id="descrip"
									path="descrip" cols="35" rows="7"/>
								</td>
							</tr>
							<tr>
								<th><label for="mallLink">
									<spring:message code='soaps.detail.mall'/>
									</label></th>
								<td><form:input name="mallLink" 
									value="${soapBfr.mallLink}"	path="mallLink" 
									type="text" size="65"/>
								</td>
							</tr>
							<tr>
								<th colspan="2" class="submitBtn">
									<input type="submit" id="btnAdd" value=
									"<spring:message code='up_stk.input.btnAdd'/>" />
								</th>
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