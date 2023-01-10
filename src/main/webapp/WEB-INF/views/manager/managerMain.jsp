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
		<li><a href='<c:url value="/manager/writeForm"/>'>게시판 작성</a></li>
		<li><a href='<c:url value="/manager/writeForm/animalInfo"/>'>동물 소개 작성</a></li>
		<li><a href='<c:url value="/manager/writeForm/hospitalInfo"/>'>동물 병원 정보 작성</a></li>
		<li><a href='<c:url value="/manager/writeForm/issue"/>'>이슈 작성</a></li>
		<li><a href='<c:url value="/manager/writeForm/notice"/>'>공지사항 작성</a></li>

	</ul>

</body>
</html>