<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.6.0.js" 
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
	crossorigin="anonymous">
</script>
<link rel="stylesheet" type="text/css" 
		href="<c:url value='/resources/css/top_menu.css'/>">
<div id="navDiv">
	<table id="navTab">
		<tr>
			<td>
				<div class="dropdown sides">
					<a href="?language=ko">
						<spring:message code="login.a.lang_ko"/></a>|<a
						 href="?language=en"><spring:message 
						 code="login.a.lang_en"/>
				 	</a>
				</div>
			</td>
			
			<td>
				<div class="dropdown" id="home">
					<a href="<c:url value='/'/>">
						<button class="dropbtn">
							<img class="put-mid" 
								alt="<spring:message code='menu.home.img'/>"
								src="<c:url value='/img/home-21.png'/>"
								width="21" height="21" />
						</button>		
					</a> 
				</div>
			</td>
			
			<td>
				<div class="dropdown">
					<a href="<c:url value='/intro'/>">
						<button class="dropbtn" id="intro">
							<spring:message code='menu.intro.button'/>
						</button>
					</a>
					<div class="dropdown-content">
						<a href="#">
							<spring:message code='menu.intro.openDT'/></a> 
						<a href="#">
							<spring:message code='menu.intro.hmSoap'/></a>
						<a href="<c:url value='/intro#devInt'/>">
							<spring:message code='menu.intro.devInt'/></a>
						<a href="<c:url value='/intro#ethics'/>">
							<spring:message code='menu.intro.ethics'/></a> 
					</div>
				</div>
			</td>
			
			<td>
				<div class="dropdown">
					<a href="<c:url value='/soaps'/>">
						<button class="dropbtn">
							<spring:message code='menu.soaps.button'/>
						</button>
					</a>
					<div class="dropdown-content">
						<a href="<c:url value='/soaps#info'/>">
							<spring:message code='menu.soaps.detail'/></a> 
						<a href="<c:url value='/soaps#price_stock'/>">
							<spring:message code='menu.soaps.priSto'/></a> 
						<a href="<c:url value='/soaps#ingredients'/>">
							<spring:message code='menu.soaps.all_ing'/></a> 
						<a href="<c:url value='/soaps#sell_price'/>">
							<spring:message code='menu.soaps.selPrc'/></a>
						<a href="#">
							<spring:message code='menu.soaps.prdPro'/></a>
						<c:if test="${userId == 'admin'}">				
							<a href="<c:url value='/soaps/update/stock'/>">
								<spring:message code='menu.soaps.updSto'/></a>
						</c:if>
					</div>
				</div>
			</td>
			
			<td>
				<div class="dropdown">
					<button class="dropbtn">
						<spring:message code='menu.q_a.button'/>
					</button>
					<div class="dropdown-content">
						<a href="#">Link 1</a> 
						<a href="#">Link 2</a> 
						<a href="#">Link 3</a>
					</div>
				</div>
			</td>
			
			<td>
				<div class="dropdown">
					<a href="<c:url value='/history'/>">
						<button class="dropbtn">
							<spring:message code='menu.purHis.button'/>
						</button>
					</a>
					<div class="dropdown-content">
						<a href="#">Link 1</a> 
						<a href="#">Link 2</a> 
						<a href="#">Link 3</a>
					</div>
				</div>
			</td>
			
			<td>
				<div class="dropdown">
					<a href="<c:url value='/account'/>">
						<button class="dropbtn">
							<spring:message code='menu.accnt.button'/>
						</button>
					</a>
					<div class="dropdown-content">
						<a href="#">Link 1</a> 
						<a href="#">Link 2</a> 
						<a href="#">Link 3</a>
					</div>
				</div>
			</td>

			<td>
				<div class="dropdown sides">
					<c:choose>
						<c:when test="${userId == null}">
							<a href="<c:url value="/login" />">
								<spring:message code="login.a.login"/>
							</a>				
						</c:when>
						<c:otherwise>
							<%-- ${userId}: --%>
							<a href="<c:url value="/logout" />">
								<spring:message code="login.a.logout"/>
							</a>				
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr class="notice">
			<td class="notice">
				<div class="dropdown sides">
				</div>
			</td>			
			<td colspan="7" class="notice">
				<div class="notice">
					<p><spring:message code='menu.home.icon'/>: 
					<a href="https://www.iconsdb.com/white-icons/home-icon.html">
						iconsdb.com</a></p>
				</div>
			</td>
		</tr>
	</table>
</div>