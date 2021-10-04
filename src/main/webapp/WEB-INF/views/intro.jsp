<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" 
		uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="welcome.title" /></title>
<link rel="stylesheet" type="text/css" href="resources/css/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/body.css">
</head>
<body>
	<section>
		<div class="pull_right" style="padding-right: 50px">
			<a href="?language=ko">한글</a>|<a href="?language=en">English</a>
			<c:choose>
				<c:when test="${userId == null}">
					<a href="<c:url value="/login" />">
						<spring:message code="login.a.login"/>
					</a>				
				</c:when>
				<c:otherwise>
					<a href="<c:url value="/logout" />">
						<spring:message code="login.a.logout"/>
					</a>				
				</c:otherwise>
			</c:choose>		
		</div>
	</section>
	<div id="body_div">
		<jsp:include page="top_menu.jsp" />
		<div>
			<p>범이는 이런 사람입니다.</p>
			<p>범이 비누를 만들게 된 동기입니다.</p>
			<p>범이 비누를 만드는 과정입니다.</p>
			<p>비누에 들어가는 모든 재료입니다.</p>
			<p>비누에 들어가는 모든 재료입니다.</p>
			<p>비누에 제조 및 판매 원가입니다.</p>
		</div>
		<div> <!-- 비누 제조 취지 -->
			<h4><a id="devInt">
				<spring:message code="menu.intro.devInt"/></a></h4>
			<div class="para">
				<p>범이는 약 20년 동안 가을만 되면 피부에 뭐가 났고, 가려워 긁고, 
				피부과 병원에 가서 약 받아 발랐습니다. 그러다가 이듬해 3월경이 되서야 피부가
				좀 괜찮아지곤 했습니다.
				</p>
				<p>그러던 중 2019년 봄 채석강 근처에서 한 과일 식초 비누를 접했습니다. 
				그리고 그해 가을 범이 다리 피부는 아무 일 없었습니다. 문제는 그 후, 
				그 비누 가격이 급등하면서 가계에 부담이 된 것입니다. 급기야 범이는 유투브 
				동영상을 보고 "올리브오일 엑스트라 버진" 수제비누를 만들어 사용하였고 품질은 
				만족스러웠습니다 -
				<a href="https://kin.naver.com/qna/detail.nhn?
				d1id=7&dirId=70111&docId=384413535&page=1#answer_2">
				관련 내용을 담은 네이버 지식iN 답글</a>
				</p>
				<p>원래, 컴퓨터 SW 전공자인 범이는 2020년 후반기 한 공단에 전산 교사직 
				인턴으로 입사하는데, 비누 (잠재)고객들께는 다행으로, 정규직 채용에서 
				배제되었습니다. 인턴 종료 직후, 범이는 자기의 재능과 노력으로
				다음 두 부류의 사람들에게 기회를 드리자고 마음 먹었습니다 -  
				(먼저) 저질 피부 세정제가 원인으로 추정되는
				<span class="brown">피부 질환으로 고통</span>받고 계신 분, 
				(다음) <span class="brown">최저임금 일자리</span> 
				조차 못 구해서 생활고를 겪고 계신 분.
				</p>
				<p>그래서 범이는 2020년 12월 24일 밤부터 비누를 만들기 시작했습니다.
				</p>
			</div>
		</div>
	</div>
</body>
</html>
