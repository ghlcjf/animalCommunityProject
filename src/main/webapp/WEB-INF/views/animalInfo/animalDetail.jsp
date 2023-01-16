<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.card-img-top {
    width: 100%;
    height: 40vw;
    object-fit: cover;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	
	게시글 번호: ${animal.animalNum}
	카테고리: ${animal.animalCategory}
	작성자: ${animal.name}
	조회수: ${animal.viewCount}

	<c:choose>
		<c:when test="${empty animal.animalUrl }">
			<img src="/imageFolder/noImage.png">
	    	<h5 class="card-title">${animal.animalTitle}</h5>
	        <p class="card-text">${animal.animalContent}</p>
		</c:when>
		<c:otherwise>
			<%-- <img src="<c:url value='/resources/animalInfoImage/${animal.animalUrl }' />" ><br> --%>
			<img src="/imageFolder/animalInfoImage/${animal.animalUrl }">
    		<h5 class="card-title">${animal.animalTitle}</h5>
	        <p class="card-text">${animal.animalContent}</p>
		</c:otherwise>
	</c:choose>
	
	${animal.animalTitle}
	${animal.animalContent}
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>