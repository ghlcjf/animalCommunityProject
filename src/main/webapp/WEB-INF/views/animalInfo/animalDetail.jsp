<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%-- <c:choose>
	<c:when test="${empty animl.animalUrl }">
	</c:when>
	<c:otherwise> --%>
		<img src="/display?name=${animal.animalUrl }"/>
		<img src='<c:url value="/resources/img/noImage.png" />'${animal.animalUrl }>
	<%-- </c:otherwise>
	</c:choose> --%>
	게시글 번호: ${animal.animalNum}<br>
	제목: ${animal.animalTitle}<br>
	내용: ${animal.animalContent}<br>
	카테고리: ${animal.animalCategory}<br>
	작성자: ${animal.name}<br>
	조회수: ${animal.viewCount}<br>
</body>
</html>