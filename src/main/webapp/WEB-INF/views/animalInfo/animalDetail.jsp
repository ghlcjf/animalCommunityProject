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
.card{
           margin-top: 50px;
        }
        .img-fluid{
            height: 500px;
        }
        .list-group-item-custom {
        position: relative;
        display: block;
        padding: var(--bs-list-group-item-padding-y) var(--bs-list-group-item-padding-x);
        color: var(--bs-list-group-color);
        text-decoration: none;
        background-color: var(--bs-list-group-bg);
        border: none;
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<c:choose>
		<c:when test="${empty animal.animalUrl }">
			<div class="card mx-auto" style="width: 50rem;">
				<ul class="list-group list-group-flush">
					<li class="list-group-item py-0">
						<div class="d-flex mb-3">
							<div class="me-auto p-2">${animal.animalNum}</div>
							<div class="p-2">${animal.name}</div>
						</div>
					</li>
					<li class="list-group-item py-0">
						<div class="d-flex mb-3">
							<div class="me-auto p-2">${animal.animalCategory}</div>
							<div class="p-2">${animal.viewCount}</div>
						</div>
					</li>
				</ul>
				<img src="/imageFolder/image/noImage.png">
				<div class="card-body">
					<h5 class="card-title">제목</h5>
					<p class="card-text">${animal.animalContent}</p>
				</div>
			</div>

		</c:when>
		<c:otherwise>
			<div class="card mx-auto" style="width: 50rem;">
				<ul class="list-group list-group-flush">
					<li class="list-group-item py-0">
						<div class="d-flex mb-3">
							<div class="me-auto p-2">${animal.animalNum}</div>
							<div class="p-2">${animal.name}</div>
						</div>
					</li>
					<li class="list-group-item py-0">
						<div class="d-flex mb-3">
							<div class="me-auto p-2">${animal.animalCategory}</div>
							<div class="p-2">${animal.viewCount}</div>
						</div>
					</li>
				</ul>
				<img src="/imageFolder/animalInfoImage/${animal.animalUrl }">
				<div class="card-body">
					<h5 class="card-title">제목</h5>
					<p class="card-text">${animal.animalContent}</p>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>