<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="resources/css/animalPicture.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<h2>동물 소개 게시판</h2>
	<c:choose>
		<c:when test="${empty animals}">
			<p>등록한 게시글이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach items="${animals}" var="animal">
				<c:choose>
					<c:when test="${empty animal.animalUrl }">
						<a href="<c:url value='/animal/detail/${animal.animalNum }' />">
						<img src="<c:url value='/resources/image/noImage.png' />"${animal.animalNum }><br></a>
						${animal.animalTitle }<br>
					</c:when>
					<c:otherwise>
						<a href="<c:url value='/animal/detail/${animal.animalNum }' />"> 
						<img src="<c:url value='/resources/animalInfoImage/${animal.animalUrl }' />"><br></a>
						${animal.animalTitle}<br>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>