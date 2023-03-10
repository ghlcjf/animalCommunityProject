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
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
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
.col{
	-webkit-transform: scale(1);
	transform: scale(1);
	-webkit-transition: .3s ease-in-out;
	transition: .3s ease-in-out;
}
.col:hover{
	-webkit-transform: scale(1.1);
  	transform: scale(1.1);
}
.card {
	width: 200px;
	height: 250px;
	margin-top: 30px;
	font-family: 'Nanum Gothic Coding', monospace;
}
.fade-animation{
	/*동물소개 올라오는 애니메이션 효과*/
   	position: relative;
    animation: fadeInUp 1s;
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
button.go-main{
	padding: 5px;   border: none;
	height: 30px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
	}
		
button:hover {
	background: rgb(101, 121, 207);
	background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	}
.list-group-item {
	border:none;
	font-size: 13px;
	margin-top: 13px;
	
}

@keyframes fadeInUp {
     0%{ opacity: 0; transform: translate3d(0, 100%, 0);}
     to{ opacity: 1; transform: translateZ(0);
     }           
}
 
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<!-- 동물 소개 게시판 카테고리 기능 추가 -->
	<div class="container text-center">
    	<div class="row">
    		<div class="col-1">
            	<div class="box1 list-group">
					<a href="<c:url value='/animalInfo/1/1?category=main' />" class="list-group-item list-group-item-action">
					  전체보기
					</a>
					<a href="<c:url value='/animalInfo/1/1?category=dog' />" class="list-group-item list-group-item-action">강아지</a>
					<a href="<c:url value='/animalInfo/1/1?category=cat' />" class="list-group-item list-group-item-action">고양이</a>
					<a href="<c:url value='/animalInfo/1/1?category=reptile' />" class="list-group-item list-group-item-action">파충류</a>
					<a href="<c:url value='/animalInfo/1/1?category=birds' />" class="list-group-item list-group-item-action">조류</a>
					<a href="<c:url value='/animalInfo/1/1?category=fish' />" class="list-group-item list-group-item-action">어류</a>
					<a href="<c:url value='/animalInfo/1/1?category=other' />" class="list-group-item list-group-item-action">기타</a>
				</div>
   			</div>
			<div class="col-10">
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
									<div class="col">
										<div class="fade-animation">	
											<div class="card">
												<c:choose>
													<c:when test="${empty animal.animalUrl || animal.animalUrl=='null' }">
														<a href="<c:url value='/animal/detail/${animal.animalNum }' />">
															<img src="/imageFolder/noImage.png" class="card-img-top">
														</a>
													</c:when>
													<c:otherwise>
														<a href="<c:url value='/animal/detail/${animal.animalNum }' />">
															<img src="/imageFolder/animalInfoImage/${animal.animalUrl }" class="card-img-top">
														</a>
													</c:otherwise>
												</c:choose>
												<div class="card-footer-cs">
													<small class="text-muted">${animal.animalTitle }</small>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

			<div class="fade-animation">
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
												      <a class="page-link" aria-label="Previous" href="/animalCommunity/animalInfo/${sectionPage.section-1}/${10}?category=${category}">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
												</c:if>
												<li class="page-item">
													<a class="page-link" href="/animalCommunity/animalInfo/${sectionPage.section}/${page}?category=${category}">
														${(sectionPage.section-1)*10+page}
													</a>
												</li>
												<!-- 번호를 눌렀을 때 해당 섹션과 해당 페이지 번호를 서버에 전달 -->
												<c:if test="${page==10}">
													<li class="page-item">
												      <a class="page-link" href="/animalCommunity/animalInfo/${sectionPage.section+1}/${1}?category=${category}" aria-label="Next">
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
												      <a class="page-link" aria-label="Previous" href="/animalCommunity/animalInfo/${sectionPage.section-1}/${10}?category=${category}">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
												</c:if>
												<li class="page-item">
													<a class="page-link" href="/animalCommunity/animalInfo/${sectionPage.section}/${page}?category=${category}">
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
												<a class="page-link" href="/animalCommunity/animalInfo/${sectionPage.section}/${page}?category=${category}">
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
			</div>
		</c:otherwise>
	</c:choose>
		<div class="fade-animation">
			<div class="d-flex justify-content-start">
				<button class="go-main" type="button" onclick="location.href='<c:url value="/main" />'">메인으로 돌아가기</button>
			</div>
		</div>	
			</div>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>