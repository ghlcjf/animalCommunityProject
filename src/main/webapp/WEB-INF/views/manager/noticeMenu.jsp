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
	*{
		text-align:center;
	}
	button{ 
	 		border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
			
		}
		
	button:hover{
  			background: rgb(101, 121, 207);
		background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="d-grid gap-2 col-6 mx-auto">
<h2>공지사항 관리자 페이지</h2>

<c:choose>
	<c:when test="${empty noticeList}">
		<p>게시글이 없습니다.</p>
		<button class="btn btn-primary" type="button" onclick="return insertConfirm()">글 작성</button>
	</c:when>
	<c:otherwise>
		<table class="table">
			<tr>
				<td colspan="5">
					<button class="btn btn-primary" type="button" onclick="return insertConfirm()">글 작성</button>	
				</td>
			</tr>
			<tr>
				<th scope="col">글 번호</th>
		        <th scope="col">글 제목</th>
		        <th scope="col">카테고리</th>
		        <th scope="col">작성자</th>
		        <th scope="col">수정/삭제</th>
			</tr>
			<c:forEach items="${noticeList}" var="notice">
				<tr>
					<th scope="row">${notice.boardNum}</th>
					<td>${notice.boardTitle}</td>
					<td>${notice.boardCategory}</td>
					<td>${notice.name}</td>
					<td>
						<button class="btn btn-primary btn-sm" type="button" onclick="return updateConfirm(${notice.boardNum})">수정</button>
						<button class="btn btn-primary btn-sm" type="button" onclick="return deleteConfirm(${notice.boardNum})">삭제</button>

					</td>
				</tr>
			</c:forEach>
		</table>
	</c:otherwise>

</c:choose>
<a href='<c:url value="/manager/managerMain" />'>관리자 메인페이지로 돌아가기</a>
	
</div>

</body>
<script type="text/javascript">
	function deleteConfirm(deleteNum){
		let boardNum = deleteNum;
		let cc = confirm('게시물을 삭제하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			alert('삭제가 완료되었습니다.');
			location.href="/animalCommunity/manager/delete/notice/"+boardNum;
		} 
	}
	
	function updateConfirm(updateNum){
		let boardNum = updateNum;
		let cc = confirm('게시물을 수정하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/updateForm/notice/"+boardNum;
		} 
	}
	function insertConfirm(){
		let cc = confirm('게시물을 작성하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/writeForm/notice";
		} 
	}
</script>
</html>