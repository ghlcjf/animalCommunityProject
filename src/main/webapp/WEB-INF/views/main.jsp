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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<%-- 나중에 이미지 슬라이더 css여기다가 옮겨놓을것임 
<link href="${pageContext.request.contextPath}/resources/css/mainImage.css" rel="stylesheet" type="text/css"> --%>

	<style>

	</style>
	
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>메인페이지</h2>
	
<!--이미지 슬라이드(이미지배너:제이쿼리(aJax)사용해야함-->
	<div id="container">
		<div class="slide_wrap">
			<div class="slide_box"><!--이미지-->
			    <div class="slide_list clearfix">
					<img class="silde_content" src="./resources/image/사진1.PNG" alt="사진1">
					<img class="silde_content" src="./resources/image/사진2.PNG" alt="사진2">
					<img class="silde_content" src="./resources/image/사진3.PNG" alt="사진3">
				</div>
			</div>
			
				<!--버튼-->
            <ul class="slide_pagination"></ul>
	 	</div>
 	</div>
 	
 	
 	
	<script type="text/javascript">

	</script>



	
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






