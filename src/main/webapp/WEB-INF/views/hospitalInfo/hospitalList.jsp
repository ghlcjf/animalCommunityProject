<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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

table {
	table-layout: fixed
}

.table {
	margin-top: 30px;
}

thead {
	background-color: #dfe6f7;
}

th {
     font-weight: normal;
}

td {
overflow:hidden; white-space:nowrap; text-overflow:ellipsis;
}

a {
	text-decoration: none;
	color: black;
}
     
.btn-primary-cs {
	--bs-btn-color: #808080;
	--bs-btn-bg: #fff;
	--bs-btn-border-color: #dfe6f7;
	--bs-btn-hover-color: #808080;
	--bs-btn-hover-bg: #dfe6f7;
	--bs-btn-hover-border-color: #fff;
	--bs-btn-focus-shadow-rgb: 49,132,253;
	--bs-btn-active-color: #fff;
	--bs-btn-active-bg: #dfe6f7;
	--bs-btn-active-border-color: #dfe6f7;
	--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	--bs-btn-disabled-color: #fff;
	--bs-btn-disabled-bg: #0d6efd;
	--bs-btn-disabled-border-color: #0d6efd;
	height: 30px;
	line-height: 15px;
 }
 button{
		padding: 5px;   border: none;
		height: 30px; 	border-radius: 10px;
		color: white;   font-weight:bolder;
		background: rgb(136, 154, 233);
		background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
		line-height: 10px;
		
	}
	button:hover{
  			background: rgb(101, 121, 207);
		background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-10 mx-auto">
				<nav class="navbar">
					<div class="container-fluid">
						<span class="navbar-brand-cs mb-0 h1">동물 병원 정보</span>
							<div class="d-flex justify-content-end">
								<p style="margin-right:20px;">${((sectionPage.section-1)*10)+sectionPage.pageNum }page </p>
								<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
									<a class="btn btn-primary-cs" href="<c:url value="/hospitalInfo/main/1/1" />" role="button">전체</a>
									<a class="btn btn-primary-cs" href="<c:url value="/hospitalInfo/seoul/1/1" />" role="button">서울</a>
									<a class="btn btn-primary-cs" href="<c:url value="/hospitalInfo/gyeonggi/1/1" />" role="button">경기도</a>
									<a class="btn btn-primary-cs" href="<c:url value="/hospitalInfo/gangwon/1/1" />" role="button">강원도</a>
									<a class="btn btn-primary-cs" href="<c:url value="/hospitalInfo/chungcheong/1/1" />" role="button">충청도</a>
									<a class="btn btn-primary-cs" href="<c:url value="/hospitalInfo/gyeongsang/1/1" />" role="button">경상도</a>
									<a class="btn btn-primary-cs" href="<c:url value="/hospitalInfo/jeolla/1/1" />" role="button">전라도</a>
									<a class="btn btn-primary-cs" href="<c:url value="/hospitalInfo/jeju/1/1" />" role="button">제주도</a>
								</div>
							</div>
						</div>
					</nav>

	<c:choose>
		<c:when test="${empty hospitals}">
		<p>등록된 병원정보가 없습니다.</p>
		</c:when>
		<c:otherwise>
			<table class="table table-hover table-sm">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">병원</th>
						<th scope="col">위치</th>
						<th scope="col">전화 번호</th>
					</tr>
				</thead>
			<c:forEach items="${hospitals }" var="hospital">
				<tbody>
					<tr>
						<th scope="row">${hospital.boardNum }</th>
							<td style="cursor: pointer;" onclick="location.href='<c:url value='/hospital/detail/${hospital.boardNum }' />'"> ${hospital.hospitalName }</td>
							<td>${hospital.hospitalLoc }</td>
							<td>${hospital.hospitalTel }</td>
						</tr>
					</tbody>
			</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	
	<div class="container text-center">
					<c:if test="${totalCnt != null}">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:choose>
									<c:when test="${totalCnt>100}"> <!-- 전체 개수가 100개 초과 -->
										<c:if test="${(sectionPage.section*100)<totalCnt }"> <!-- 다음 섹션이 존재하는가 => '>>' O -->
											<c:forEach var="page" begin="1" end="10" step="1"> <!-- 번호 매기기 -->
												<c:if test="${sectionPage.section>1 && page==1}">
													<li class="page-item">
												      <a class="page-link" aria-label="Previous" href="/animalCommunity/hospitalInfo/${location}/${sectionPage.section-1}/${10}">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
												</c:if>
												<li class="page-item">
													<a class="page-link" href="/animalCommunity/hospitalInfo/${location}/${sectionPage.section}/${page}">
														${(sectionPage.section-1)*10+page}
													</a>
												</li>
												<!-- 번호를 눌렀을 때 해당 섹션과 해당 페이지 번호를 서버에 전달 -->
												<c:if test="${page==10}">
													<li class="page-item">
												      <a class="page-link" href="/animalCommunity/hospitalInfo/${location}/${sectionPage.section+1}/${1}" aria-label="Next">
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
												      <a class="page-link" aria-label="Previous" href="/animalCommunity/hospitalInfo/${location}/${sectionPage.section-1}/${10}">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
												</c:if>
												<li class="page-item">
													<a class="page-link" href="/animalCommunity/hospitalInfo/${location}/${sectionPage.section}/${page}">
														${(sectionPage.section-1)*10+page}
													</a>
												</li>
											</c:forEach>
										</c:if>
										
									</c:when>
									
									
									<c:when test="${totalCnt==100}"> <!-- 전체 개수가 100개 -->
										<c:forEach var="page" begin="1" end="10" step="1">
											<li class="page-item">
												<a class="page-link" href="/animalCommunity/hospitalInfo/${location}/${sectionPage.section}/${page}">
													${(sectionPage.section-1)*10+page}
												</a>
											</li>
										</c:forEach>
									</c:when>
									
									
									<c:when test="${totalCnt<100}"> <!-- 전체 개수가 100개 미만 -->
										<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">
											<li class="page-item">
												<a class="page-link" href="/animalCommunity/hospitalInfo/${location}/${sectionPage.section}/${page}">
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


	
	
	
	
	

	<div class="d-flex justify-content-start">
		<button type="button" onclick="location.href='<c:url value="/main" />'">메인으로 돌아가기</button>
		</div>

	</div>
</div>
</div>
	
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>	
</body>
</html>