<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>

<!--메인으로 이동하는 로고-->
<a href='<c:url value="/main"/>'>메인으로이동(나중에 이미지로 로고 넣어주기)</a>

<ul>
	<!-- 세션이 없으면 -->
	<c:if test="${empty userInfo}">
		<li><a href='<c:url value="/register/step1"/>'>회원가입</a></li>
		<li><a href='<c:url value="/login"/>'>로그인</a></li>
	</c:if>
	
	<!-- 세션이 있으면 -->
	<c:if test="${!empty userInfo}">
		<p>${userInfo.name}님</p>  <!--페이지 위에 누구로 로그인 하고있는지 보기위해-->
		<c:if test="${userInfo.admin eq 1 }">
			<li><a href='<c:url value="/manager/managerMain"/>'>관리자 페이지</a></li>
		</c:if>
		<li><a href='<c:url value="/logout"/>'>로그아웃</a></li>
	</c:if>
</ul>
	
	 
<ul>
	<li><a href='<c:url value="/freeBoard/freeBoardList/main/1/1"/>'>자유게시판</a></li>
	<li><a href='<c:url value="/animalInfo"/>'>동물 소개</a></li>
	<li><a href='<c:url value="/hospitalInfo/main"/>'>동물 병원 정보</a></li>
	<li><a href='<c:url value="/issue"/>'>이슈</a></li>
	<li><a href='<c:url value=""/>'>마이페이지</a></li>

</ul>
<hr>
</header>
    