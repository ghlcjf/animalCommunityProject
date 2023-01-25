<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
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
	margin-top: 10px;
}

.table-group-divider-cs {
    border-bottom: 1px solid #96aeea;
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
button {
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

.smBtn {
	padding: 5px;   border: none;
	height: 24px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
}
.pagination{
	margin-top: 15px;
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
							<span class="navbar-brand-cs mb-0 h1">동물 병원 정보 관리자 페이지</span>
							<span class="navbar-brand-cs mb-0 h1">${((sectionPage.section-1)*10)+sectionPage.pageNum }page</span>
						</div>
							<button type="button" onclick="return insertConfirm()">글 작성</button>
						</div>
					</nav>

				<c:choose>
					<c:when test="${empty hospitalInfoList}">
						<p>게시글이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<table class="table table-sm">
							<thead class="table-group-divider-cs">
								<tr>
							   		<th scope="col" width="70px;">글 번호</th>
									<th scope="col" width="200px;">병원</th>
									<th scope="col" width="100px;">위치</th>
									<th scope="col" width="70px;">작성자</th>
									<th scope="col" width="70px;">수정/삭제</th>
							 	</tr>
				  			</thead>
			  				<tbody>
							  	<c:forEach items="${hospitalInfoList}" var="hospitalInfo">
							    	<tr>
										<th scope="row">${hospitalInfo.boardNum}</th>
										<td>${hospitalInfo.hospitalName}</td>
										<td>${hospitalInfo.hospitalLoc}</td>
										<td>${hospitalInfo.name}</td>
										<td>
											<button class="smBtn" type="button" onclick="return updateConfirm(${hospitalInfo.boardNum})">수정</button>
											<button class="smBtn" type="button" onclick="return deleteConfirm(${hospitalInfo.boardNum})">삭제</button>
										</td>
			    					</tr>
			    				</c:forEach>
		  					</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			
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
												      <a class="page-link" aria-label="Previous" href="/animalCommunity/boardManagement/hospitalInfo/${sectionPage.section-1}/${10}">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
												</c:if>
												<li class="page-item">
													<a class="page-link" href="/animalCommunity/boardManagement/hospitalInfo/${sectionPage.section}/${page}">
														${(sectionPage.section-1)*10+page}
													</a>
												</li>
												<!-- 번호를 눌렀을 때 해당 섹션과 해당 페이지 번호를 서버에 전달 -->
												<c:if test="${page==10}">
													<li class="page-item">
												      <a class="page-link" href="/animalCommunity/boardManagement/hospitalInfo/${sectionPage.section+1}/${1}" aria-label="Next">
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
												      <a class="page-link" aria-label="Previous" href="/animalCommunity/boardManagement/hospitalInfo/${sectionPage.section-1}/${10}">
												        <span aria-hidden="true">&laquo;</span>
												      </a>
												    </li>
												</c:if>
												<li class="page-item">
													<a class="page-link" href="/animalCommunity/boardManagement/hospitalInfo/${sectionPage.section}/${page}">
														${(sectionPage.section-1)*10+page}
													</a>
												</li>
											</c:forEach>
										</c:if>
										
									</c:when>
									
									
									<c:when test="${totalCnt==100}"> <!-- 전체 개수가 100개 -->
										<c:forEach var="page" begin="1" end="10" step="1">
											<li class="page-item">
												<a class="page-link" href="/animalCommunity/boardManagement/hospitalInfo/${sectionPage.section}/${page}">
													${(sectionPage.section-1)*10+page}
												</a>
											</li>
										</c:forEach>
									</c:when>
									
									
									<c:when test="${totalCnt<100}"> <!-- 전체 개수가 100개 미만 -->
										<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">
											<li class="page-item">
												<a class="page-link" href="/animalCommunity/boardManagement/hospitalInfo/${location}/${sectionPage.section}/${page}">
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
					<button type="button" onclick="location.href='<c:url value="/manager/managerMain" />'">관리자 메뉴로 돌아가기</button>
				</div>
				
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function deleteConfirm(deleteNum){
		let boardNum = deleteNum;
		let cc = confirm('게시물을 삭제하시겠습니까?');
		alert('삭제가 완료되었습니다.');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/delete/hospitalInfo/"+boardNum;
		} 
	}
	
	function updateConfirm(updateNum){
		let boardNum = updateNum;
		let cc = confirm('게시물을 수정하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/updateForm/hospitalInfo/"+boardNum;
		} 
	}
	function insertConfirm(){
		let cc = confirm('게시물을 작성하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/writeForm/hospitalInfo";
		} 
	}
</script>
</html>