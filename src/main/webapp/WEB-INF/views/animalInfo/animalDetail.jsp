<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">

</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	
	<c:choose>
		<c:when test="${empty animal.animalUrl }">
			<img src="<c:url value='/resources/image/noImage.png' />" ${animal.animalUrl }>
		</c:when>
		<c:otherwise>
			<img src="<c:url value='/resources/image/${animal.animalUrl }' />">
		</c:otherwise>
	</c:choose>
	
	${animal.animalTitle}
	${animal.animalContent}
	게시글 번호: ${animal.animalNum}
	카테고리: ${animal.animalCategory}
	작성자: ${animal.name}
	조회수: ${animal.viewCount}
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>