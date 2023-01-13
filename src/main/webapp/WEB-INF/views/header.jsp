<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
	<style>

		.menu_bar{
			background-color: rgb(136, 154, 233);
			font-size: 25px;
		}
		.nav-link{
			color: white;
		}
		
		.nav-link:hover{
			font-weight:bolder;
			color: rgb(255, 224, 234);
		}

	</style>
</head>


<header>
<!--메인으로 이동하는 로고-->
	<a href='<c:url value="/main"/>'>메인으로이동(나중에 이미지로 로고 넣어주기)</a>
	
			<!-- 세션이 없으면 -->
			<c:if test="${empty userInfo}">
				<ul class="nav justify-content-end">
					<li class="nav-link active" aria-current="page"><a href='<c:url value="/register/step1"/>'>회원가입</a></li>
					<li class="nav-link active" aria-current="page"><a href='<c:url value="/login"/>'>로그인</a></li>
				</ul>
				<div class="menu_bar">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/login"/>' onclick="afterLogin()">자유게시판</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/login"/>' onclick="afterLogin()">동물 소개</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/login"/>' onclick="afterLogin()">동물 병원 정보</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/login"/>' onclick="afterLogin()">이슈</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value=""/>' onclick="afterLogin()">마이페이지</a></li>
					</ul>		
				</div>
			</c:if>
			
			<!-- 세션이 있으면 -->
			<c:if test="${!empty userInfo}">
				<ul class="nav justify-content-end">
					<li class="nav-link active" aria-current="page">${userInfo.name}님</li>  <!--페이지 위에 누구로 로그인 하고있는지 보기위해-->
						<c:if test="${userInfo.admin eq 1 }">
							<li class="nav-link active" aria-current="page"><a href='<c:url value="/manager/managerMain"/>'>관리자 페이지</a></li>
						</c:if>
					<li class="nav-link active" aria-current="page"><a href='<c:url value="/logout"/>' onclick="test()">로그아웃</a></li>
				</ul>
				<div class="menu_bar">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/freeBoard/freeBoardList/main/1/1"/>' style="color:white;">자유게시판</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/animalInfo"/>' style="color:white;">동물 소개</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/hospitalInfo/main"/>' style="color:white;">동물 병원 정보</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/issue"/>' style="color:white;">이슈</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/myPage"/>' style="color:white;">마이페이지</a></li>
					</ul>			
				</div>
			</c:if>			


</header>
	<script
	    src="https://code.jquery.com/jquery-3.6.1.js"
	    integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	    crossorigin="anonymous">
	</script>
	
	<script type="text/javascript">
	//로그아웃시 경고창 띄움
		function test(){
			alert("로그아웃하시겠습니까?");
		}
	
		function afterLogin(){
			alert("로그인 후 이용할수 있습니다");
		}
	</script>
	



    