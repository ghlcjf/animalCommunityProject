<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/animalPicture.css" rel="stylesheet" type="text/css">
<!--부트스트랩 주소와 css, body안에 js-->
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

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