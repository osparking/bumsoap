<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.js" 
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
	crossorigin="anonymous">
</script>
<link rel="stylesheet" type="text/css" href="resources/css/top_menu.css">
<div id="nav">
	<div class="dropdown" id="home">
		<button class="dropbtn" id="home">
			<img alt="범이홈" height=25px
				src="<c:url value='/img/home-24.png'/>"/>
		</button>
	</div>
	<div class="dropdown">
		<button class="dropbtn">범이 소개</button>
		<div class="dropdown-content">
			<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">판매 비누</button>
		<div class="dropdown-content">
			<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">질문 답변</button>
		<div class="dropdown-content">
			<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">나의 구매</button>
		<div class="dropdown-content">
			<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn">나의 계정</button>
		<div class="dropdown-content">
			<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
		</div>
	</div>
</div>

<script>
	$('button#home').on('click', function() {
		alert("clicked");
	});
</script>

