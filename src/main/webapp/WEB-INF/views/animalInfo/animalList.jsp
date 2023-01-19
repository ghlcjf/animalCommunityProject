<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">
.navbar {
	margin-top: 15px;
	background-color: #dfe6f7;
	border-top: 1px solid #96aeea;
	border-bottom: 1px solid #96aeea;
}

.navbar-brand-cs {
	padding-top: 0.3rem;
	padding-bottom: 0.3rem;
	margin-right: var(- -bs-navbar-brand-margin-end);
	font-size: 1.1rem;
	font-weight: bold;
	color: #808080;
	text-decoration: none;
	white-space: nowrap;
	margin-left: 10px;
}

.card {
	margin-top: 0.8rem;
	margin-bottom: 2rem;
}

.card-img-top {
	width: 100%;
	height: 15vw;
	object-fit: cover;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

<div class="container text-center">
        <div class="row">
        <div class="col-10 mx-auto">
	<nav class="navbar">
		<div class="container-fluid">
			<span class="navbar-brand-cs mb-0 h1">동물 소개</span>
		</div>
	</nav>
	</div>
	
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
										<a
											href="<c:url value='/animal/detail/${animal.animalNum }' />">
											<img src="/imageFolder/image/noImage.png"
											class="card-img-top img-fluid img-thumbnail"
											${animal.animalNum }>
										</a>
										<div class="card-body">
											<p class="card-text">${animal.animalTitle }</p>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col">
									<div class="card" style="width: 18rem;">
										<a
											href="<c:url value='/animal/detail/${animal.animalNum }' />">
											<img src="/imageFolder/animalInfoImage/${animal.animalUrl }"
											class="card-img-top img-fluid img-thumbnail">
										</a>
										<div class="card-body">
											<p class="card-text">${animal.animalTitle }</p>
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
	</div>
	</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>