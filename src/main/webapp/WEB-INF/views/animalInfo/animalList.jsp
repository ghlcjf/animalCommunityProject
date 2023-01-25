<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="../jquery.twbsPagination.js" type="text/javascript"></script>
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
	width: 200px;
	height: 250px;
	margin-top: 30px;
}
.card-img-top {
    width: 100%;
    height: 205px;
    object-fit: cover;
}
.card-footer-cs {
padding: var(--bs-card-cap-padding-y) var(--bs-card-cap-padding-x);
color: var(--bs-card-cap-color);
background-color: var(--bs-card-cap-bg);
}
.pagination{
	margin-top: 25px;
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
						<div class="d-flex justify-content-start">
							<span class="navbar-brand-cs mb-0 h1">동물 소개</span>
							<span class="navbar-brand-cs mb-0 h1">${((sectionPage.section-1)*10)+sectionPage.pageNum }page</span>
						</div>
					</div>
				</nav>
	

				<c:choose>
					<c:when test="${empty animals}">
						<p>등록한 게시글이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<div class="container text-center">
							<div class="row row-cols-5">
								<c:forEach items="${animals}" var="animal">
									<c:choose>
										<c:when test="${empty animal.animalUrl || animal.animalUrl=='null' }">
											<div class="col">
												<div class="card">
													<a href="<c:url value='/animal/detail/${animal.animalNum }' />">
														<img src="/imageFolder/noImage.png" class="card-img-top">
													</a>
													<div class="card-footer-cs">
														<small class="text-muted">${animal.animalTitle }</small>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col">
												<div class="card">
													<a href="<c:url value='/animal/detail/${animal.animalNum }' />">
														<img src="/imageFolder/animalInfoImage/${animal.animalUrl }" class="card-img-top">
													</a>
													<div class="card-footer-cs">
														<small class="text-muted">${animal.animalTitle }</small>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>

				
				<div class="d-flex justify-content-center">
					<c:if test="${totalCnt != null}">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:choose>
									<c:when test="${totalCnt>100}"> <!-- 전체 개수가 100개 초과 -->
										<c:if test="${(sectionPage.section*100)<totalCnt }"> <!-- 다음 섹션이 존재하는가 => '>>' O -->
											<c:forEach var="page" begin="1" end="10" step="1"> <!-- 번호 매기기 -->
												<c:if test="${sectionPage.section>1 && page==1}">
													<li class="page-item">
												      <a class="page-link" aria-label="Previous" href="/animalCommunity/animalInfo/${sectionPage.section-1}/${10}">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
												</c:if>
												<li class="page-item">
													<a class="page-link" href="/animalCommunity/animalInfo/${sectionPage.section}/${page}">
														${(sectionPage.section-1)*10+page}
													</a>
												</li>
												<!-- 번호를 눌렀을 때 해당 섹션과 해당 페이지 번호를 서버에 전달 -->
												<c:if test="${page==10}">
													<li class="page-item">
												      <a class="page-link" href="/animalCommunity/animalInfo/${sectionPage.section+1}/${1}" aria-label="Next">
												        <span aria-hidden="true">&raquo;</span>
												      </a>
												    </li>
												</c:if>
											</c:forEach>
											
											
										</c:if>
										<c:if test="${(sectionPage.section*100)>=totalCnt }"> <!-- 다음 섹션이 존재하지 않는가=> '>>' X  -->
											<c:forEach var="page" begin="1" end="${((totalCnt+9)-(sectionPage.section-1)*100)/10}" step="1">
												<c:if test="${sectionPage.section>1 && page==1}">
													<li class="page-item">
												      <a class="page-link" aria-label="Previous" href="/animalCommunity/animalInfo/${sectionPage.section-1}/${10}">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
												</c:if>
												<li class="page-item">
													<a class="page-link" href="/animalCommunity/animalInfo/${sectionPage.section}/${page}">
														${(sectionPage.section-1)*10+page}
													</a>
												</li>
											</c:forEach>
										</c:if>
										
									</c:when>
									
									
									<c:when test="${totalCnt==100}"> <!-- 전체 개수가 100개 -->
										<c:forEach var="page" begin="1" end="10" step="1">
											<li class="page-item">
												<a class="page-link" href="/animalCommunity/animalInfo/${sectionPage.section}/${page}">
													${(sectionPage.section-1)*10+page}
												</a>
											</li>
										</c:forEach>
									</c:when>
									
									
									<c:when test="${totalCnt<100}"> <!-- 전체 개수가 100개 미만 -->
										<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">
											<li class="page-item">
												<a class="page-link" href="/animalCommunity/animalInfo/${sectionPage.section}/${page}">
													${(sectionPage.section-1)*10+page}
												</a>
											</li>
										</c:forEach>
									</c:when>
								
								</c:choose>
							</ul>
						</nav>
					</c:if>
				</div>
		</c:otherwise>
	</c:choose>
			</div>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>