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
<script
    src="https://code.jquery.com/jquery-3.6.1.js"
    integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
    crossorigin="anonymous">
</script>

<!--부트스트랩 주소-->
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

	<style>
        *{ margin: 0; padding: 0;}	
 		img{ height: 600px;/*사진높이 일정하게 맞춘것*/ } 
		#carouselExampleControls{ width: 1200px; }
	
		#container{
	        display: flex;
	        justify-content: center;
	        align-items: center;
		}
		#main-left{
	        display: inline-block;
		}		
		
		#main-right{
	        display: inline-block;
			margin-left: 10px; 
		}			
		.main-freeBoard{
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        padding-top: 30px;    
			padding-bottom: 30px;
		}
		table.main-freeBoardList{
			margin-right: 30px;
		
		}
		.main-issue{
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        padding-top: 30px;    
			padding-bottom: 30px;		
		
		}
		table.main-issuelist{
			margin-right: 30px;
		}
		table.col{
			border: 3px solid rgb(136, 154, 233);
		}
		
		.loginId{
			padding: 10px;
		}
		
		.loginPwd{
			padding-top: 0px;    padding-bottom: 10px; 
			padding-right: 10px; padding-left: 10px;
		}
		
		.loginBtn{
			padding-top: 0px;    padding-bottom: 0px; 
			padding-right: 10px; padding-left: 0px;
			 margin-top: 15px;
  			margin-bottom: 5px;
		}
		
		button[type="submit"]{
			padding: 5px;
			height: 50px; 	border-radius: 10px;
			
			color: white; font-weight:bolder;
			
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
		}
		
		button[type="submit"]:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
		}
		

	</style>
	
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<div id="container">
		<div id="main-left">
			<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		  		<div class="carousel-inner">
		  			
		  			<c:choose>
		  				<c:when test="${empty imageList}">
		  					<div class="carousel-item active">
				      			<img src="/imageFolder/image/사진1.PNG" class="d-block w-100" alt="사진1">
					    	</div>
					    	<div class="carousel-item active">
				      			<img src="/imageFolder/image/사진2.PNG" class="d-block w-100" alt="사진2">
					    	</div>
					    	<div class="carousel-item active">
				      			<img src="/imageFolder/image/사진3.PNG" class="d-block w-100" alt="사진3">
					    	</div>
		  				</c:when>
		  				<c:otherwise>
		  					<c:forEach items="${imageList}" var="image">
		  						<div class="carousel-item active">
					      			<img src="/imageFolder/image/${image.imageUrl }" class="d-block w-100" alt="${image.imageInfo }">
						    	</div>
		  					</c:forEach>
		  				</c:otherwise>
		  			</c:choose>
		  		</div>
		 		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    		<span class="visually-hidden">Previous</span>
		  		</button>
		  		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		    		<span class="visually-hidden">Next</span>
		  		</button>
			</div>
			
			
		<!--자유게시판(기본 이미지, 작성자, 제목, 추천수-->
		<div class="main-freeBoard">
			<c:if test="${empty freeBoardList}">
				<p>등록된 게시글이 없습니다.</p>
			</c:if>
			<c:if test="${!empty freeBoardList}">			
				<c:forEach items="${freeBoardList}" var="board" begin="0" end="3">
						<table class="main-freeBoardList" border="1">
							<tr>
								<td>
									<c:choose>
			
										<c:when test="${board.boardUrl=='null' || empty board.boardUrl}">
						<%-- 					<img src="<spring:url value='/imageFolder/noImage.png' />"><br> --%>
											<img src="/imageFolder/noImage.png"  width="200px" height="200px"><br>
										</c:when>
										
										<c:otherwise>
											<img src="/imageFolder/freeBoardImage/${board.boardUrl }" width="250px" height="250px"><br>
										</c:otherwise>
										
									</c:choose>
								</td>
							</tr>
							<tr>
								<td>${board.name}</td>
							</tr>
							<tr>
								<td>${board.boardTitle}</td>
							</tr>	
							<tr>
								<td> <!--추천수 하트 아이콘-->
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-heart-fill" viewBox="0 0 16 16" color="pink">
										<path d="M2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Zm6 3.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
									</svg>
									${board.good}
								</td>
							</tr>		
						</table>
				</c:forEach>
			</c:if>			
		</div>	
			
		<!--이슈게시판(기본이미지 또는 제목이 곧 이미지ㅡ 작성자, 제목-->
		<h3>이슈게시판</h3>
		<div class="main-issue">
			<c:if test="${empty issue}">
				<p>등록된 게시글이 없습니다.</p>
			</c:if>
			<c:if test="${!empty issue}">
				<c:forEach items="${issue}" var="board" begin="0" end="3">
					<table class="main-issuelist" border="1">
	
							<tr>
								<td>
									<c:choose>
										<c:when test="${!empty board.issueUrl }">
											<img src="/imageFolder/issueBoardImage/${board.issueUrl }" ><br>	
										</c:when>
										<c:otherwise>
											<img src="/imageFolder/noImage.png"><br>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td>${board.name}</td>
							</tr>
							<tr>
								<td> ${board.issueTitle}</td>
							</tr>
					</table>	
				</c:forEach>
			</c:if>			
		</div>
		
		</div><!--class: main-left-->
		
	
	
		<div id="main-right">	
			<!--작은 로그인폼, 세션이 없을때만 나타나게-->
			<div class="row g-3">
				<c:if test="${empty userInfo}">
					<form:form action="/animalCommunity/login" modelAttribute="loginCommand">
						<form:errors/> <!--path없을시 글로벌 에러-->
						<table class="col">
							<tr>
								<th class="loginId">
									<form:input  class="form-control" path="id" placeholder="id"/>
									<form:errors path="id"/>
								</th>
								<td class="loginBtn" rowspan="2" onclick="return loginCheck()">
									<button  type="submit">
										<spring:message code="login.btn"/>
									</button>								
								</td>									
							</tr>
							<tr>
								<th class="loginPwd">
									<form:input  class="form-control" path="password" type="password" placeholder="password"/>
									<form:errors path="password"/>
								</th>
								<td>
								</td>							
							</tr>
						</table>
					</form:form>
				</c:if>
			</div>
				
			<!--인기글 top10개: 조회수로 순위-->
			<h4>커뮤니티 인기 Top10</h4>
			<c:if test="${empty freeBoardTopTen}">
				<table border="1" width="300px">
					<tr>
						<td>등록된 게시글이 없습니다</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${!empty freeBoardTopTen}">
				<c:forEach items="${freeBoardTopTen}" var="board" begin="0" end="9">
						<table border="1" width="300px">
							<tr>
								<th style="padding: 5px; font-size: 15px;">
									<a href="<c:url value='/freeBoard/readFreeBoard/${board.boardNum}'/>">
										${board.boardTitle}  ${board.viewCount}
									</a>
								</th>
							</tr>
						</table>
				</c:forEach>
			</c:if>
			
			
		</div> <!--class: main-right-->
	</div>
	

	


		


</body>

<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
<script type="text/javascript">
	function loginCheck() {
		
		let id = $('#id').val();
		let password = $('#password').val();


		if($('#id').val()==''){
			alert('아이디를 입력해주세요');
			($('#id').focus());
			return false;
		}
		
		if($('#password').val()==''){
			alert('비밀번호를 입력해주세요');
			($('#password').focus());
			return false;
		}
		
		$.ajax({
			type: "POST",
			url: "${context}/loginCheck",
			data: {"id":id, "password":password},
			dateType: JSON,
			success: function(data){
				if (!data) {
					alert('아이디 또는 비밀번호가 틀렸습니다.')
				}
				return data;
			}
		});
	}
		
		/* 컨트롤러 받아온 아이디랑 비밀번호 서비스객체로 보내줘요
		서비스객체에서 아이디 비밀번호 DAO로 연결
		아이디를 먼저 찾아요
		(데이터베이스에서 가져온 아이디)아이디가 있다면
		(사용자가 입력한 비밀번호와 데이터베이스에서 가져온 비밀번호 맞는지 확인)
		아이디도 있고 비밀번호도 맞다면 true를 반환하는 메서드 
		아니라면 false */
		
</script>
</html>






