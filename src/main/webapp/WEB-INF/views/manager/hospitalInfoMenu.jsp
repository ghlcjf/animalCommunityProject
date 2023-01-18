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
	/* button{ 
	 		border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
			
		}
		
	button:hover{
  			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	} */
	button{
		padding: 5px;   border: none;
		height: 30px; 	border-radius: 10px;
		color: white;   font-weight:bolder;
		background: rgb(136, 154, 233);
		background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
		line-height: 10px;
		
	}
	button:hover{
  			background: rgb(101, 121, 207);
		background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div class="container text-center">
        <div class="row">
        <div class="col-1">
            1 of 3
          </div>
          <div class="col-10">
<nav class="navbar mx-auto">
		<div class="container-fluid">
			<span class="navbar-brand-cs mb-0 h1">동물 병원 정보 관리자 페이지</span>
			<div class="d-flex justify-content-end">
			<button type="button" onclick="return insertConfirm()">글 작성</button>
			</div>
		</div>
	</nav>

<!-- <div class="d-grid gap-2 col-6 mx-auto"> -->
	<c:choose>
		<c:when test="${empty hospitalInfoList}">
			<p>게시글이 없습니다.</p>
			<!-- <button type="button" onclick="return insertConfirm()">글 작성</button> -->
		</c:when>
		<c:otherwise>
			<table class="table">
			  <thead>
			  	<!-- <tr>
					<td colspan="5" align="left">
						<button type="button" onclick="return insertConfirm()">글 작성</button>
					</td>
				</tr> -->
			    <tr>
			      <th scope="col">글 번호</th>
			      <th scope="col">병원 이름</th>
			      <th scope="col">병원 지역</th>
			      <th scope="col">작성자</th>
			      <th scope="col">수정/삭제</th>
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
						<button type="button" onclick="return updateConfirm(${hospitalInfo.boardNum})">수정</button>
						<button type="button" onclick="return deleteConfirm(${hospitalInfo.boardNum})">삭제</button>
					</td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
		</c:otherwise>
	</c:choose>
	<%-- <a href='<c:url value="/manager/managerMain" />'>관리자 메인페이지로 돌아가기</a> --%>
	<div class="d-flex justify-content-start">
		<button type="button" onclick="location.href='<c:url value="/manager/managerMain" />'">관리자 메뉴로 돌아가기</button>
		</div>
<!-- </div> -->
</div>
<div class="col-1">
            1 of 3
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