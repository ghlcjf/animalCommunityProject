<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/animalPicture.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	
	<c:choose>
		<c:when test="${empty animal.animalUrl }">
			<img src="<c:url value='/resources/image/noImage.png' />"${animal.animalUrl }><br>
		</c:when>
		<c:otherwise>
			<img src="<c:url value='/resources/image/${animal.animalUrl }' />" ><br>
		</c:otherwise>
	</c:choose>
	
	게시글 번호: ${animal.animalNum}<br>
	이름: ${animal.animalTitle}<br>
	내용: ${animal.animalContent}<br>
	카테고리: ${animal.animalCategory}<br>
	작성자: ${animal.name}<br>
	조회수: ${animal.viewCount}<br>
</body>
</html>