<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="<c:url value="/resources/js/sockjs.min.js"/>"></script>


<head>
	<style>
		.menu_bar{
			background-color: rgb(136, 154, 233); font-size: 25px;
		}
		.nav-link{
			color: white;
		}
		.nav-link:hover{
			font-weight:bolder;color: rgb(255, 224, 234);
		}
		.logo-box{
	        display: flex; justify-content: center; align-items: center;	
		}
		.logo{
			height: 150px;width: auto;
		}

	</style>
</head>


<header>
<!--메인으로 이동하는 로고-->
	
	<div class="logo-box">
		<a href='<c:url value="/main"/>'><img class="logo" src="/imageFolder/image/로고.png" alt="로고"></a>
	</div>
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
						<li class="nav-item"><a class="nav-link" href='<c:url value="/login"/>' onclick="afterLogin()">마이페이지</a></li>
					</ul>		
				</div>
			</c:if>
			
			<!-- 세션이 있으면 , 필요없는 클래스 없애거나 css 수정-->
			<c:if test="${!empty userInfo}">
				<ul class="nav justify-content-end">
					<li>${userInfo.name}님</li>  <!--페이지 위에 누구로 로그인 하고있는지 보기위해-->
						<c:if test="${userInfo.admin eq 1 }">
							<li class="nav-link active" aria-current="page"><a href='<c:url value="/manager/managerMain"/>'>관리자 페이지</a></li>
						</c:if>
					<li class="nav-link active" aria-current="page"><a href='<c:url value="/logout"/>' onclick="return test()">로그아웃</a></li>
				</ul>
				<div class="menu_bar">
					<ul class="nav justify-content-center">
																															
						<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/freeBoard/freeBoardList/main/1/1"/>'>자유게시판</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/animalInfo"/>'>동물 소개</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/hospitalInfo/main"/>'>동물 병원 정보</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/issue"/>'>이슈</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/myPage"/>'>마이페이지</a></li>
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
	
		function test(){
			if(confirm("로그아웃하시겠습니까?")){
				return true;	
			}
			return false;
			
		}
	
		function afterLogin(){
			alert("로그인 후 이용할수 있습니다");
		}
		
		
		
		let socket = null;
		let sock = new SockJS("/echo");
		socket =sock;
		$(document).ready(function(){
		    if(!isEmpty($("#sessionName").val()))
		            connectWS();
		});
		    $(".chat_start_main").click(function(){
		        $(this).css("display","none");
		        $(".chat_main").css("display","inline");
		    })
		    $(".chat_main .modal-header").click(function(){
		        $(".chat_start_main").css("display","inline");
		        $(".chat_main").css("display","none");
		    });
		 
		    function connectWS(){
		        sock.onopen = function() {
		               console.log('info: connection opened.');
		        };
		        sock.onmessage = function(e){
		            var splitdata =e.data.split(":");
		            if(splitdata[0].indexOf("recMs") > -1)
		                $("#recMs").append("["+splitdata[1]+"통의 쪽지가 왔습니다.]");
		            else
		                $("#chat").append(e.data + "<br/>");
		        }
		        sock.onclose = function(){
		            $("#chat").append("연결 종료");
//		              setTimeout(function(){conntectWs();} , 10000); 
		        }
		        sock.onerror = function (err) {console.log('Errors : ' , err);};
		 
		    }
		    
		    $("#board1").click(function(){
		        location.href="/board/main_board.do";
		    });
		 
		$("#chatForm").submit(function(event){
		        event.preventDefault();
		            sock.send($("#message").val());
		            $("#message").val('').focus();    
		    });    
		
	</script>
	



    