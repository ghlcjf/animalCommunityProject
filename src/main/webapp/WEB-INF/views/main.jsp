<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%-- 나중에 이미지 슬라이더 css여기다가 옮겨놓을것임 
<link href="${pageContext.request.contextPath}/resources/css/mainImage.css" rel="stylesheet" type="text/css"> --%>

	<style>
        *{
            margin: 0;
            padding: 0;
        }	


		img{
			height: 320px;
		
		}

	</style>
	
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>메인페이지</h2>
	
	
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  		<div class="carousel-inner">
    		<div class="carousel-item active">
      			<img src="./resources/image/사진1.PNG" class="d-block w-100" alt="사진1">
    	</div>
    	<div class="carousel-item">
      		<img src="./resources/image/사진2.PNG" class="d-block w-100" alt="사진2">
    	</div>
    	<div class="carousel-item">
      		<img src="./resources/image/사진3.PNG" class="d-block w-100" alt="사진3">
    	</div>
  	</div>
 	<button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    	<span class="sr-only">Previous</span>
  	</button>
  	<button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
    	<span class="sr-only">Next</span>
  	</button>
	</div>

	
<!--작은 로그인폼, 세션이 없을때만 나타나게-->
	<c:if test="${empty userInfo}">
		<form:form action="/animalCommunity/login" modelAttribute="loginCommand">
			<form:errors/> <!--path없을시 글로벌 에러-->
			<table>
				<tr>
					<th>
						<form:input path="id" placeholder="id"/>
						<form:errors path="id"/>
					</th>
				</tr>
				<tr>
					<th>
						<form:input path="password" type="password" placeholder="password"/>
						<form:errors path="password"/>
					</th>
				</tr>
			</table>
	

			<button  type="submit">
				<spring:message code="login.btn"/>
			</button>
			
		</form:form>
	</c:if>
		<!--로그인 실패하면 로그인 페이지로 넘어가기전에 경고창에:아이디 혹은 비밀번호가 맞지않습니다 출력-->



<!--자유게시판(기본 이미지, 작성자, 제목, 추천수-->
	<h3>자유게시판</h3>
	<c:if test="${empty freeBoardList}">
		<p>등록된 게시글이 없습니다.</p>
	</c:if>
	<c:if test="${!empty freeBoardList}">
		<c:forEach items="${freeBoardList}" var="board" begin="0" end="3">
			<table border="1">
				<tr>
					<td>
						<a href="<c:url value='/freeBoard/readFreeBoard/${board.boardNum}'/>">
						${board.boardTitle}이미지(기본이나 게시물이미지)</a>
					</td>
				</tr>
				<tr>
					<td>${board.name}</td>
				</tr>
				<tr>
					<td>${board.boardTitle}</td>
				</tr>	
				<tr>
					<td>${board.good}</td>
				</tr>		
			</table>
		</c:forEach>
	</c:if>
<!--이슈게시판(기본이미지 또는 제목이 곧 이미지ㅡ 작성자, 제목-->
	<h3>이슈게시판</h3>

	<c:if test="${empty issue}">
		<p>등록된 게시글이 없습니다.</p>
	</c:if>
	<c:if test="${!empty issue}">
		<table border="1">
			<c:forEach items="${issue}" var="board" varStatus="b">
				<tr>
					<td>
						<a href="<c:url value='/issue/detail/${board.issueNum}' />">
						${board.issueTitle} 이미지(기본이나 게시물이미지)</a>
					</td>
				</tr>
				<tr>
					<td>${board.name}</td>
				</tr>
				<tr>
					<td> ${board.issueTitle}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	
<!--인기글 top10개: 추천수+조회수 등으로 순위매김, 숫자같을때는 어떻게할지도-->
	<h4>커뮤니티 인기 Top10</h4>
	<c:if test="${empty freeBoardList}">
		<p>등록된 게시글이 없습니다.</p>
	</c:if>



</body>
</html>






