<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" 
		href="resources/css/top_menu.css">  
<div id="nav">
	<ul>
		<li class="changing">
			<a id="home" href='<c:url value="/"/>'>
				<img alt="범이홈" height="20" 
					 src="<c:url value='/img/home-24.png'/>"/>
		</a></li>
		<li class="changing" ><a href="intro">범이 소개</a></li>
		<li class="changing" ><a href="">판매 상품</a></li>
		<li class="changing" ><a href="">질문 응답</a></li>
		<li class="changing" ><a href="">나의 구매</a></li>
		<li class="changing" ><a href="">나의 계정</a></li>
	</ul>
</div>
