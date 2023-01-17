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
    height: 15vw;
    object-fit: cover;
}
</style>
<link type="text/css" href="resources/css/animalPicture.css" rel="stylesheet">
<!--부트스트랩 주소와 css, body안에 js-->
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<h2>동물 소개 게시판</h2>
	<c:choose>
		<c:when test="${empty animals}">
			<p>등록한 게시글이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<div class="container text-center">
  			<div class="row row-cols-4">
			<c:forEach items="${animals}" var="animal">
				<c:choose>
					<c:when test="${empty animal.animalUrl }">
						<div class="col">
						<div class="card" style="width: 18rem;">
						<a href="<c:url value='/animal/detail/${animal.animalNum }' />">
						<img src="/imageFolder/noImage.png" class="card-img-top img-fluid img-thumbnail" ${animal.animalNum }></a>
						<div class="card-body">
   						<p class="card-text">
						${animal.animalTitle }</p>
						</div>
						</div>
						</div>
					</c:when>
					<c:otherwise>
					<div class="col">
					<div class="card" style="width: 18rem;">
						<a href="<c:url value='/animal/detail/${animal.animalNum }' />"> 
						<img src="/imageFolder/animalInfoImage/${animal.animalUrl }" class="card-img-top img-fluid img-thumbnail"></a>
						<div class="card-body">
   						<p class="card-text">
						${animal.animalTitle}</p>
						</div>
						</div>
					</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
			</div>
		</c:otherwise>
	</c:choose>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>