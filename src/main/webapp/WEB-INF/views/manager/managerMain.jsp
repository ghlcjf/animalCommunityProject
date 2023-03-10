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
	h2{
		text-align: center;
		margin-top: 70px;
		font-weight:bolder;
	}
	.container{
		margin-top: 100px;
	}
	.col{
		font-size: 30px;
	}
    .btn{
    	width: 100%;
      	height: 150px;
    }
    .animation-1{
    	position: relative;
    	animation: fadeInUp 1s;
    }
    .animation-2{
    	position: relative;
    	animation: fadeInUp 1.3s;
    }
    .animation-3{
    	position: relative;
    	animation: fadeInUp 1.6s;
    }
    .animation-4{
    	position: relative;
    	animation: fadeInUp 1.9s;
    }
    .animation-5{
    	position: relative;
    	animation: fadeInUp 2.3s;
    }
    .animation-6{
    	position: relative;
    	animation: fadeInUp 2.6s;
    }        
    .animation-7{
    	position: relative;
    	animation: fadeInUp 2.9s;
    }
    .animation-8{
    	position: relative;
    	animation: fadeInUp 3.3s;
    }        
@keyframes fadeInUp {
     0%{ opacity: 0; transform: translate3d(0, 100%, 0);}
     to{ opacity: 1; transform: translateZ(0);
     }           
}    
    
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<h2>관리자 메뉴</h2>

	
	<div class="container text-center">
	    <div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">
   			<a class="animation-1" href="<c:url value='/main' />">
			    <button type="button" class="btn btn-light">
			      <div class="col">
			        메인 페이지
			      </div>
		      	</button>
			</a>
			<a class="animation-2" href='<c:url value="/memberManagement/1/1"/>'>
			    <button type="button" class="btn btn-light">
			      <div class="col">
			        회원 관리
			      </div>
		      	</button>
			</a>
			<a class="animation-3" href='<c:url value="/boardManagement/image"/>'>
			    <button type="button" class="btn btn-light">
			      <div class="col">
			        배너 관리
			      </div>
		      	</button>
			</a>
			<a class="animation-4" href='<c:url value="/reportBoard"/>'>
			    <button type="button" class="btn btn-light">
			      <div class="col">
			        신고 게시물 관리
			      </div>
		      	</button>
			</a>
			<a class="animation-5" href='<c:url value="/boardManagement/animalInfo/1/1"/>'>
			    <button type="button" class="btn btn-light">
			      <div class="col">
			        동물 소개
			      </div>
		      	</button>
			</a>
			<a class="animation-6" href='<c:url value="/boardManagement/hospitalInfo/1/1"/>'>
			    <button type="button" class="btn btn-light">
			      <div class="col">
			        동물 병원 정보
			      </div>
		      	</button>
			</a>
			<a class="animation-7" href='<c:url value="/boardManagement/issue/1/1"/>'>
			    <button type="button" class="btn btn-light">
			      <div class="col">
			        이슈
			      </div>
		      	</button>
			</a>
	      	<a class="animation-8" href='<c:url value="/boardManagement/notice/1/1"/>'>
			    <button type="button" class="btn btn-light">
			      <div class="col">
			        공지사항
			      </div>
		      	</button>
			</a>
	    </div>
	  </div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>