<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
	<style>
		*{
			font-family: 'Poor Story', cursive;
		}
		.nav-cs {
	    --bs-nav-link-padding-x: 1rem;
	    --bs-nav-link-padding-y: 0.5rem;
	    --bs-nav-link-font-weight: ;
	    --bs-nav-link-color: var(--bs-link-color);
	    --bs-nav-link-hover-color: #fff;
	    --bs-nav-link-disabled-color: #6c757d;
	    display: flex;
	    flex-wrap: wrap;
	    padding-left: 0;
	    margin-bottom: 0;
	    list-style: none;
		}
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
		.go-top{
			color:rgb(223, 178, 236);text-align: right;position: fixed;  bottom: 0px; right: 0px; 
		}
		.go-top:hover{
			color: rgb(187, 212, 240);
		}
		ul .justify-content-end{
			width: 1900px; height: auto;
			display: flex; justify-content: center; align-items: center;
			text-align: right;
		}
		.top-menu{
			
		}
		.top{
			text-decoration: none;
			color: black;
			cursor: cursor;
		}
		.top-name{
			padding: 8px;
		}

        .center-outer {
        margin-top: 40px;
        display: table;
        width: 100%;
        height: 100%;
        }

        .center-inner {
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        }

        /* Essential CSS - Makes the effect work */

        .bubbles {
        display: inline-block;
        font-family: arial;
        position: relative;
        }
        h5{
            color: rgb(187, 182, 255);
        }
        .bubbles h1{
        position: relative;
        margin: 1em 0 0;
        font-family: 'Luckiest Guy', cursive;
        color: rgb(187, 182, 255);
        z-index: 2;
        }

        .individual-bubble {
        position: absolute;
        border-radius: 100%;
        bottom: 10px;
        background-color: rgb(225, 198, 255);
        z-index: 1;
        }
		a{
			text-decoration: none;
		}
		.text-bg-primary-header-cs {
	    background: rgb(136, 154, 233);
		background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
		color: white;
		}
	</style>

</head>


<header>
<!--???????????? ???????????? ?????? ????????????????????? ?????????????????? ????????? ?????? ??????????????? ??????-->
	<!--??????1-->
<%-- 	<div class="logo-box">
		<a href='<c:url value="/main"/>'><img class="logo" src="/imageFolder/image/??????.png" alt="??????"></a>
	</div> --%>
	<!--??????2-->
	

<div class="center-outer">
    <div class="center-inner">
        <div class="bubbles">
	        <a href='<c:url value="/main"/>'>
	            <h5>???????????? ????????????</h5>
	            <h1>Animal Community</h1>
	        </a>
        </div>
    </div>
 </div>	
	

	
			<!-- ????????? ????????? -->
			<c:if test="${empty userInfo}">
				<ul class="nav justify-content-end">
					<li class="nav-link active" aria-current="page"><a class="top" href='<c:url value="/register/step1"/>'>????????????</a></li>
					<li class="nav-link active" aria-current="page"><a class="top" href='<c:url value="/login"/>'>?????????</a></li>
					
				</ul>
				<div class="menu_bar">
					<ul class="nav-cs justify-content-center">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/login"/>' onclick="afterLogin()">???????????????</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/login"/>' onclick="afterLogin()">?????? ??????</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/login"/>' onclick="afterLogin()">?????? ?????? ??????</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/login"/>' onclick="afterLogin()">??????</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/login"/>' onclick="afterLogin()">???????????????</a></li>
					</ul>		
				</div>
			</c:if>
			
			<!-- ????????? ????????? , ???????????? ????????? ???????????? css ??????-->
			<c:if test="${!empty userInfo}">
				<ul class="nav justify-content-end">
					<li class="top-name">${userInfo.name}???</li>  <!--????????? ?????? ????????? ????????? ??????????????? ????????????-->
						<c:if test="${userInfo.admin eq 1 }">
							<li class="nav-link active" aria-current="page"><a class="top" href='<c:url value="/manager/managerMain"/>'>????????? ?????????</a></li>
						</c:if>
					<li class="nav-link active" aria-current="page"><a class="top" href='<c:url value="/message/list"/>' >?????????&nbsp;<span class="badge text-bg-primary-header-cs">${unReadCheck}</span></a></li>
					<li class="nav-link active" aria-current="page"><a class="top" href='<c:url value="/logout"/>' onclick="return test()">????????????</a></li>
				</ul>

				<div class="menu_bar">
					<ul class="nav-cs justify-content-center">
																															
						<li class="nav-item"><a class="nav-link active" aria-current="page" href='<c:url value="/freeBoard/freeBoardList/main/1/1"/>'>???????????????</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/animalInfo/1/1?category=main"/>'>?????? ??????</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/hospitalInfo/main/1/1"/>'>?????? ?????? ??????</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/issue/1/1"/>'>??????</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/myPage/1/1"/>'>???????????????</a></li>
					</ul>			
				</div>
			</c:if>		
			
	<div class="go-top" onclick="javascript:window.scrollTo(0,0)">
		<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 20 20">
  			<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"
  			 alt="??????" />
		</svg>
	</div>	
</header>


	<script
	    src="https://code.jquery.com/jquery-3.6.1.js"
	    integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	    crossorigin="anonymous">
	</script>
	
	<script type="text/javascript">
	
		function test(){
			if(confirm("???????????????????????????????")){
				return true;	
			}
			return false;
			
		}
	
		function afterLogin(){
			alert("????????? ??? ???????????? ????????????");
		}
		
	 	jQuery(document).ready(function($){
			  var bArray = [];
			 var sArray = [4,6,8,10];
			 for (var i = 0; i < $('.bubbles').width(); i++) {
			     bArray.push(i);
			 }
			 function randomValue(arr) {
			     return arr[Math.floor(Math.random() * arr.length)];
			 }
			setInterval(function(){
			var size = randomValue(sArray);
			$('.bubbles').append('<div class="individual-bubble" style="left: ' + randomValue(bArray) + 'px; width: ' + size + 'px; height:' + size + 'px;"></div>');
			$('.individual-bubble').animate({
			            'bottom': '100%',
			            'opacity' : '-=0.7'
			        }, 3000, function(){
			            $(this).remove()
			        }
			        );
			    }, 350);
			 
			});
		

		
		
		
		
	</script>
	



    