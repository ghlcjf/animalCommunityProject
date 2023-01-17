<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<h2>관리자 페이지</h2>
	<a href="<c:url value='/main' />">메인 페이지</a>
	<ul>


		<li><a href='<c:url value="/memberManagement"/>'>회원관리</a></li>		
		<li><a href='<c:url value="/boardManagement/image"/>'>배너 관리</a></li>
		<li><a href='<c:url value="/reportBoard"/>'>신고 게시물 관리</a></li>
		<li><a href='<c:url value="/boardManagement/animalInfo"/>'>동물 소개</a></li>
		<li><a href='<c:url value="/boardManagement/hospitalInfo"/>'>동물 병원 정보</a></li>
		<li><a href='<c:url value="/boardManagement/issue"/>'>이슈</a></li>
		<li><a href='<c:url value="/boardManagement/notice"/>'>공지사항</a></li>
		
		
	</ul>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>