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
<link href="${pageContext.request.contextPath}/resources/css/animalPicture.css" rel="stylesheet" type="text/css">
<!--부트스트랩 주소와 css, body안에 js-->
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
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
			<div class="card mb-3" style="max-width: 1000px;">
				<div class="row g-0">
			    	<div class="col-md-4">
						<img src="/imageFolder/noImage.png">
					</div>
					<div class="col-md-4">
				    	<div class="card-body">
					    	<h5 class="card-title">${animal.animalTitle}</h5>
					        <p class="card-text">${animal.animalContent}</p>
				        </div>
				    </div>
		        </div>
		     </div>
		</c:when>
		
		<c:otherwise>

			<%-- <img src="<c:url value='/resources/animalInfoImage/${animal.animalUrl }' />" ><br> --%>

			<div class="card mb-3" style="max-width: 1000px;">
				<div class="row g-0">
			    	<div class="col-md-4">
						<img src="/imageFolder/animalInfoImage/${animal.animalUrl }">
					</div>
					<div class="col-md-4">
				    	<div class="card-body">
					    	<h5 class="card-title">${animal.animalTitle}</h5>
					        <p class="card-text">${animal.animalContent}</p>
				        </div>
			        </div>
		        </div>
	        </div>			

		</c:otherwise>
	</c:choose>
	
	${animal.animalTitle}
	${animal.animalContent}
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>