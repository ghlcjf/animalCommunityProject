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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!--부트스트랩 주소-->
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

	<style>
        *{ margin: 0; padding: 0;}	
 		img{height:580px; /*이미지 배너부분 사진높이 일정하게 맞춘것, 높이 650에 맞췄었음*/ } 
 		a{text-decoration: none;/*모든 a태그 밑줄 없애기*/}
		#carouselExampleControls{width: 1150px; margin-left:10px;}
		#container1{display: flex; justify-content: center; align-items: center; margin-left: 320px; top: 0;}
		#conrainer2{display: flex; justify-content: center; align-items: center;}
		#main-top{display: inline-block;}
		#right-wing{
			margin-left: 20px; margin-bottom: 470px;
			display: inline-block;
		}
		#main-bottom{
            display: grid;
            -ms-flex-pack: center;
            justify-content: center;
            -ms-flex-align: center;
            align-items: center;
		}	
		.main-freeBoard{
	        display: flex;  justify-content: center;	       
	        align-items: center; padding-top: 30px;    	        
			padding-bottom: 5px;background: rgb(238, 241, 255);
			border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; 
		}
		table.main-freeBoardList{
			margin-right:10px; margin-left: 10px; width: 260px;
		}
		.free-board-more{
			background: rgb(136, 154, 233); margin-top: 40px; 
			border-top-left-radius: 20px; border-top-right-radius: 20px; 
			height: 50px;
		}
		.big-font{
			margin-left: 20px; font-size: 30px; color: white;
			font-weight: bolder;
		}
		.small-font{
			font-size: 20px; color: rgb(224, 230, 255); font-weight: bolder;
		}
		.show-more{
			margin-left: 650px;
			text-align: right; color: white; font-weight: bolder;
		}
		.show-more-issue{
			margin-left: 670px;
			text-align: right; color: white; font-weight: bolder;
		}
		.board-name{
		    font-size:20px; font-weight: bolder; color: rgb(90, 99, 133);
		}	
		.board-title{
			font-size:20px; font-weight: bolder; color: rgb(73, 80, 107);
		}
		.main-issue{
	        display: flex;  justify-content: center;	       
	        align-items: center; padding-top: 30px;    	        
			padding-bottom: 30px;
			background: rgb(238, 241, 255);
			border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; 			
			margin-bottom: 100px;
		}			
		.issue-board-more{
			background: rgb(136, 154, 233); margin-top: 40px;
			border-top-left-radius: 20px; border-top-right-radius: 20px; 
			height: 50px; 		
		}
		table.main-issuelist{
			margin-right: 10px; width: 260px; margin-left: 10px; 
		}
		table.col{
			border: 3px solid rgb(136, 154, 233);
			margin-top: 20px;
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
			margin-top: 15px;	 margin-bottom: 5px;
		}
		button[type="submit"]{
			padding: 5px;   border: none;
			height: 50px; 	border-radius: 10px;
			color: white;   font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			
		}
		button[type="submit"]:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
		}
		.img-size{
			height: 250px; width: 250px; margin: 10px;
			border-radius: 20px;
		}
		.scroll{
			bottom: 70px;  right:40px; position: fixed;
		}
/* 		.scroll-right{ 따라다니는 메뉴 
			position:absolute; width:90px; top:50%; right:270px; background:#fff;
			bottom: 400px;
		} */
		.top-ten{
			 border: 1px solid rgb(129, 139, 180);width: 300px;
		}
		.top-ten:hover{
			background: rgb(238, 241, 255); 
		}
		.top-ten-box{
			background: rgb(136, 154, 233); width: 300px; padding-top: 5px; text-align: center;
			height: 45px; margin-top: 20px; border-top-left-radius: 15px; border-top-right-radius: 15px; 
		}
		.top-ten-box-text{
			color: white; font-size: 25px; padding: 5px;
		}
		.top-ten-text{
			color: rgb(90, 99, 133);
		}
		.top-number{
			background: rgb(129, 139, 180); padding-left: 5px; padding-right: 5px;
			color: white; font-size: 20px;
		}
		.profile{
			height: 130px; width: 300px; margin-top: 30px; border-radius: 15px;
			background: linear-gradient(0deg, rgb(213, 207, 241) 0%, rgb(223, 178, 236) 100%);
			border: 3px solid rgb(223, 178, 236);
		}
		.profile-ul{
			width: 250px; height:110px;  text-align: left;
			margin-left: 10px; margin-top: 5px; list-style: none;
			font-size:20px; font-weight: bolder; color:white;
		}
		.profile-li{
			padding-top: 5px;
		}

	</style>
	
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
	<div id="container1">
		<div id="main-top">
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
		</div>

		<div id="right-wing">
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
							</tr>
						</table>
					</form:form>
				</c:if>
			</div>
			
			<!--세션이 있을때만 나타나게 하는 회원정보-->
			<c:if test="${!empty userInfo}">
				<div class="profile">
					<ul class="profile-ul">
						<li class="profile-li">${userInfo.name}님</li>
						<c:if test="${userInfo.admin==0}">
							<li class="profile-li">
								<svg  style="color:white;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
								  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
								</svg>
							등급:일반</li>
						</c:if>

						<c:if test="${userInfo.admin==1}">
							<li class="profile-li">
								<svg style="color:white;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-gear-wide" viewBox="0 0 16 16">
								  <path d="M8.932.727c-.243-.97-1.62-.97-1.864 0l-.071.286a.96.96 0 0 1-1.622.434l-.205-.211c-.695-.719-1.888-.03-1.613.931l.08.284a.96.96 0 0 1-1.186 1.187l-.284-.081c-.96-.275-1.65.918-.931 1.613l.211.205a.96.96 0 0 1-.434 1.622l-.286.071c-.97.243-.97 1.62 0 1.864l.286.071a.96.96 0 0 1 .434 1.622l-.211.205c-.719.695-.03 1.888.931 1.613l.284-.08a.96.96 0 0 1 1.187 1.187l-.081.283c-.275.96.918 1.65 1.613.931l.205-.211a.96.96 0 0 1 1.622.434l.071.286c.243.97 1.62.97 1.864 0l.071-.286a.96.96 0 0 1 1.622-.434l.205.211c.695.719 1.888.03 1.613-.931l-.08-.284a.96.96 0 0 1 1.187-1.187l.283.081c.96.275 1.65-.918.931-1.613l-.211-.205a.96.96 0 0 1 .434-1.622l.286-.071c.97-.243.97-1.62 0-1.864l-.286-.071a.96.96 0 0 1-.434-1.622l.211-.205c.719-.695.03-1.888-.931-1.613l-.284.08a.96.96 0 0 1-1.187-1.186l.081-.284c.275-.96-.918-1.65-1.613-.931l-.205.211a.96.96 0 0 1-1.622-.434L8.932.727zM8 12.997a4.998 4.998 0 1 1 0-9.995 4.998 4.998 0 0 1 0 9.996z"/>
								</svg>
							등급:관리자</li>
						</c:if>
						
						
						
						<li><svg style="color:white;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right-dots" viewBox="0 0 16 16">
							  	<path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
							  	<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
							</svg>
						 안읽은 쪽지:${unReadCheck}개</li>
					</ul>
				</div>
			</c:if>				
			
				
				
				<!--인기글 top10개: 조회수로 순위
				<div class="top-ten-box">
					<span class="top-ten-box-text">커뮤니티 인기글 Top10</span>
				</div>
				<c:if test="${empty freeBoardTopTen}">
					<table class="top-ten" border="1" width="300px">
						<tr>
							<td>등록된 게시글이 없습니다</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${!empty freeBoardTopTen}">
					<c:forEach items="${freeBoardTopTen}" var="board" begin="0" end="9" varStatus="i">
						<table class="top-ten" border="1" width="300px">
							<tr>
								<th style="padding: 5px; font-size: 15px;">
									<span class="top-number">${i.count}</span> 
									<a class="top-ten-text" href="<c:url value='/freeBoard/readFreeBoard/${board.boardNum}'/>">
										 
										${board.boardTitle}  (${board.viewCount})
									</a>
								</th>
							</tr>
						</table>
					</c:forEach>
				</c:if>	-->	
				
			</div>
		</div>

	
	<div id="container2">
		<div id="main-bottom">	
				<!--자유게시판(기본 이미지, 작성자, 제목, 추천수-->
			<div class="free-board-more">
				<p><span class="big-font">자유게시판</span>
				   <span class="small-font">나의 반려동물과의 일상들</span>
				   <c:if test="${empty userInfo}"><!--세션이 없으면-->
					   <a href='<c:url value="/login"/>' onclick="afterLogin()">
					 	  <span class="show-more">더보기></span>
					 	</a>
				 	</c:if>
				 	<c:if test="${!empty userInfo}"><!--세션이 있으면-->
				 		<a href='<c:url value="/freeBoard/freeBoardList/main/1/1"/>'>
				 			<span class="show-more">더보기></span>
				 		</a>
				 	</c:if>
				 </p>
			</div>
			<div class="main-freeBoard">
				<c:if test="${empty freeBoardList}">
					<p>등록된 게시글이 없습니다.</p>
				</c:if>
				<c:if test="${!empty freeBoardList}">			
					<c:forEach items="${freeBoardList}" var="board" begin="0" end="3">
							<table class="main-freeBoardList">
								<tr>
									<td>
										<c:choose>
										
											<c:when test="${board.boardUrl=='null' || empty board.boardUrl}">
												<a href="<c:url value='/freeBoard/readFreeBoard/${board.boardNum}'/>" >	
													<img class="img-size" src="/imageFolder/noImage.png"><br>
												</a>								
											</c:when>
											
											<c:otherwise>
												<a href="<c:url value='/freeBoard/readFreeBoard/${board.boardNum}'/>">
													<img class="img-size" src="/imageFolder/freeBoardImage/${board.boardUrl }"><br>
												</a>
											</c:otherwise>
											
										</c:choose>
									</td>
								</tr>
								<tr>
									<td class="board-name">${board.name}</td>
								</tr>
								<tr>
									<td class="board-title">${board.boardTitle}</td>
								</tr>	
								<tr>
									<td> <!--추천수 하트 아이콘-->
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-heart-fill" viewBox="0 0 16 16" style="color: rgb(255, 119, 137);">
											<path d="M2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Zm6 3.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
										</svg>
										${board.good}
									</td>
								</tr>		
							</table>
					</c:forEach>
				</c:if>			
			</div>	<!--main-freeBoard-->
			
			<!--이슈게시판(기본이미지 또는 제목이 곧 이미지ㅡ 작성자, 제목-->
			<div class="issue-board-more">
				<p><span class="big-font">이슈게시판</span>
				   <span class="small-font">동물들의 특별한 이야기</span>
				   <c:if test="${empty userInfo}"><!--세션이 없으면-->
					   <a href='<c:url value="/login"/>' onclick="afterLogin()">
					 	  <span class="show-more-issue">더보기></span>
					 	</a>
				 	</c:if>
				 	<c:if test="${!empty userInfo}"><!--세션이 있으면-->
				 		<a href='<c:url value="/issue"/>'>
				 			<span class="show-more-issue">더보기></span>
				 		</a>
				 	</c:if>
				 </p>
			</div>
			<div class="main-issue">
				<c:if test="${empty issue}">
					<p>등록된 게시글이 없습니다.</p>
				</c:if>
				<c:if test="${!empty issue}">
					<c:forEach items="${issue}" var="board" begin="0" end="3">
						<table class="main-issuelist">	
								<tr>
									<td>
										<c:choose>
											<c:when test="${board.issueUrl=='null' || !empty board.issueUrl }">
												<a href="<c:url value='/issue/detail/${board.issueNum}' />">
													<img class="img-size" src="/imageFolder/noImage.png"><br>
												</a>
											</c:when>
											<c:otherwise>
												<a href="<c:url value='/issue/detail/${board.issueNum}' />">
													<img class="img-size" src="/imageFolder/issueBoardImage/${board.issueUrl }" ><br>	
												</a>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td class="board-name">${board.name}</td>
								</tr>
								<tr>
									<td class="board-title"> ${board.issueTitle}</td>
								</tr>
						</table>	
					</c:forEach>
				</c:if>			
			</div>	
		</div> <!--class: main bottom-left-->		
	</div>
	
	
	<div class="scroll">
		<div class="scroll-right">
			<!--인기글 top10개: 조회수로 순위-->
			<div class="top-ten-box">
				<span class="top-ten-box-text">커뮤니티 인기글 Top10</span>
			</div>
			<c:if test="${empty freeBoardTopTen}">
				<table class="top-ten" border="1" width="300px">
					<tr>
						<td>등록된 게시글이 없습니다</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${!empty freeBoardTopTen}">
				<c:forEach items="${freeBoardTopTen}" var="board" begin="0" end="9" varStatus="i">
					<table class="top-ten" border="1" width="300px">
						<tr>
							<th style="padding: 5px; font-size: 15px;">
								<span class="top-number">${i.count}</span> 
								<a class="top-ten-text" href="<c:url value='/freeBoard/readFreeBoard/${board.boardNum}'/>">
									 
									${board.boardTitle}  (${board.viewCount})
								</a>
							</th>
						</tr>
					</table>
				</c:forEach>
			</c:if>		
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

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
	$(document).ready(function(){
		  var currentPosition = parseInt($(".scroll-right").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $(".scroll-right").stop().animate({"top":position+currentPosition+"px"},1000);
		  });
	});
	
		
		

		
		
</script>
</html>






