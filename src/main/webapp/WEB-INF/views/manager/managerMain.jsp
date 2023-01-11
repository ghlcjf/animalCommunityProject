<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>관리자 페이지</h2>
	<a href="<c:url value='/main' />">메인 페이지</a>
	<ul>

		<li><a href='<c:url value="/memberManagement"/>'>회원관리</a></li>
		<li><a href='<c:url value="/boardManagement/animalInfo"/>'>동물 소개</a></li>
		<li><a href='<c:url value="/boardManagement/hospitalInfo"/>'>동물 병원 정보</a></li>
		<li><a href='<c:url value="/boardManagement/issue"/>'>이슈</a></li>
		<li><a href='<c:url value="/boardManagement/notice"/>'>공지사항</a></li>
		
		
	</ul>

</body>
</html>