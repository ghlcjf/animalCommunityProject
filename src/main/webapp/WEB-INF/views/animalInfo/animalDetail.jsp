<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %> 
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
.container {
	margin-top: 25px;
}
.card-header {
	background-color: #dfe6f7
}
.text-muted-cs {
    --bs-text-opacity: 1;
    color: #black!important;
}
.img-fluid {
	width: 500px;
    height: 500px;
    
    margin-right:10px;
    margin-bottom:10px;
    float:left;
 }
 .smallBtn {
	padding: 5px;   border: none;
	height: 30px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	width: 145px;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
}

.smallBtn:hover {
	background: rgb(101, 121, 207);
	background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
}
.info{
	
	margin:auto;
	
}
.card-text{
	margin:10px;
}
.card-body-cs {
    flex: 1 1 auto;
    color: var(--bs-card-color);
}

</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>


	<div class="container">
        <div class="row">
			<div class="col-12 mx-auto">

				<c:choose>
					<c:when test="${animal.animalUrl=='null'}">
						<div class="card mb-3" style="max-width: 100%;">
		        			<div class="card-header">
		            			<div class="d-flex">
		            				<div class="me-auto p-2">${animal.animalTitle}</div>
               							<div class="p-2"><p class="card-text"><small class="text-muted">카테고리</small> <small class="text-muted-cs">${animal.animalCategory}</small></p></div>
						                <div class="p-2"><p class="card-text"><small class="text-muted">글 번호</small> <small class="text-muted-cs">${animal.animalNum}</small></p></div>
						                <div class="p-2"><p class="card-text"><small class="text-muted">작성자</small> <small class="text-muted-cs">${animal.name}</small></p></div>
               							<div class="p-2"><p class="card-text"><small class="text-muted">조회수</small> <small class="text-muted-cs">${animal.viewCount}</small></p></div>
									</div>
								</div>
								<div class="row g-0">
								<div class="info">
            						<div class="card-body-cs">
            							<img src="/imageFolder/noImage.png" class="img-fluid">
										<p class="card-text">${fn:replace(animal.animalContent, replaceChar, "<br/>")}</p>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card mb-3" style="max-width: 100%;">
		        			<div class="card-header">
		            			<div class="d-flex">
		            				<div class="me-auto p-2">${animal.animalTitle}</div>
               							<div class="p-2"><p class="card-text"><small class="text-muted">카테고리</small> <small class="text-muted-cs">${animal.animalCategory}</small></p></div>
						                <div class="p-2"><p class="card-text"><small class="text-muted">글 번호</small> <small class="text-muted-cs">${animal.animalNum}</small></p></div>
               							<div class="p-2"><p class="card-text"><small class="text-muted">작성자</small> <small class="text-muted-cs">${animal.name}</small></p></div>
               							<div class="p-2"><p class="card-text"><small class="text-muted">조회수</small> <small class="text-muted-cs">${animal.viewCount}</small></p></div>
           							</div>
       							</div>
       							<div class="row g-0">
       							
								
								<div class="info">
            						<div class="card-body-cs">
            							<img src="/imageFolder/animalInfoImage/${animal.animalUrl }" class="img-fluid">
										<p class="card-text">${fn:replace(animal.animalContent, replaceChar, "<br/>")}</p>
									</div>
								</div>
							</div>
						</div>
									
					</c:otherwise>
				</c:choose>
				<div class="d-flex justify-content-start">
					<button type="button" class="smallBtn" onclick="location.href='<c:url value="/animalInfo/${sectionPage.section }/${sectionPage.pageNum }" />'">목록으로 돌아가기</button>
				</div>
			</div>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>