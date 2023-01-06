<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
<ul>
	<ul>
	<!-- 세션이 없으면 -->
	<c:if test="${empty userInfo}">
		<li><a href='<c:url value="/register/step1"/>'>회원가입</a></li>
		<li><a href='<c:url value="/login"/>'>로그인</a></li>
	</c:if>
	
	<!-- 세션이 있으면 -->
	<c:if test="${!empty userInfo}">
	<p>${userInfo.name}님</p>  <!--페이지 위에 누구로 로그인 하고있는지 보기위해-->
		<li><a href='<c:url value="/logout"/>'>로그아웃</a></li>
	</c:if>
</ul>
	
</ul>
<ul>
	<li><a href='<c:url value="/freeBoard/freeBoardList"/>'>자유게시판</a></li>
	<li><a href='<c:url value="/animalInfo"/>'>동물 소개</a></li>
	<li><a href='<c:url value="/hospitalInfo"/>'>동물 병원 정보</a></li>
	<li><a href='<c:url value="/issue"/>'>이슈</a></li>
	<li><a href='<c:url value=""/>'>마이페이지</a></li>

</ul>
<hr>
</header>
    