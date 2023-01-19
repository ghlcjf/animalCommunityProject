<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<style>
	.navbar {
	margin-top: 15px;
	width: 100%;
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
/* .table{
	width: 1150px;
} */
 table {
	table-layout: fixed
}

.table {
	margin-top: 30px;
}

thead {
	background-color: #dfe6f7;
}

.td-button {
	line-height: 35px;
}

th {
     font-weight: normal;
}

td {
overflow:hidden; white-space:nowrap; text-overflow:ellipsis;
}

a {
	text-decoration: none;
	color: black;
}
.text-end{
	margin-right: 100px
}
		h2{
			margin-bottom: 30px;
			font-weight:bolder;
		}
		.d-grid{
			margin-top: 70px;
		}
		
		/* .smBtn{
			width: 50px; height: 33px; border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
		}
		.bigBtn{
			width: 190px; height: 33px; border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
		} */
		/* button[type="submit"]:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
		} */
		/* #section{
			margin-bottom: 30px;
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
        <div class="col-10 mx-auto">
	<nav class="navbar">
		<div class="container-fluid">
			<span class="navbar-brand-cs mb-0 h1">마이페이지</span>
			<form id="section" action="<c:url value='/checkPassword' />">
			<div class="d-flex justify-content-end">
			<button class="bigBtn" type="submit" onclick="newWindow()">개인정보 수정하기</button>
			</div>
		</form>
		</div>
	</nav>
	
	<!-- <div class="d-grid gap-2 col-6 mx-auto"> -->
	
            
          
		
		<table class="table table-sm">
		<thead>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>전화번호</th>
			</tr>
			</thead>
			<tr>
		
				<td>${user.name }</td>
				<td>${user.id }</td>
				<td>${user.email }</td>
				<td>${user.phone }</td>
			</tr>
		</table>

		</div>
		</div>
		</div>
		
          <div class="container text-center">
        <div class="row">
		 <div class="col-10 mx-auto">
		<nav class="navbar">
		<div class="container-fluid">
			<span class="navbar-brand-cs mb-0 h1">게시글 목록</span>
		</div>
	</nav>
	
		<c:choose>
			<c:when test="${empty board}">
				<p>게시글이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<table class="table table-sm">
				<thead>
					<tr>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>글 수정</th>
						<th>글 삭제</th>
					</tr>
					</thead>
					<c:forEach items="${board}" var="board">

					<tbody>
						<tr class="td-button">

							<td><a href="<c:url value='/freeBoard/readFreeBoard/${board.boardNum}' />">
								${board.boardTitle}</a>
							</td>
							<td><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/></td>
							<td>${board.viewCount }</td>
							<td>
								<form action="<c:url value='/myPage/updeteForm/${board.boardNum}' />">
									<button class="smBtn" type="submit" onclick="return boardUpdate()">수정</button>
								</form>
							</td>
							<td>
								<form action="<c:url value='/myPage/delete/${board.boardNum}' />">
									<button class="smBtn" type="submit" onclick="return boardDelete()">삭제</button>
									<%-- <input type="hidden" name="boardNum" value="${board.boardNum}"> --%>
								</form>
							</td>
						</tr>
						</tbody>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>

		</div>
		</div>
		</div>
		<a href='<c:url value="/main" />'>메인으로 돌아가기</a>
		
		<form action='<c:url value="/mypage/${user.id}" />'>
			<button class="bigBtn" type="submit" onclick="return out('${user.id}')">탈퇴</button>
		</form>

		


	<jsp:include page="../footer.jsp"></jsp:include>

	<script type="text/javascript">
		function boardDelete(){
			 return confirm('게시글을 삭제 하시겠습니까?');
		}

		function boardUpdate(){
			 return confirm('게시글을 수정하시겠습니까?');
		}
		
		/* function newWindow(){
			
			let url = "${context}/checkPassword";
			
			window.open(url,'_blank_1',
			'toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200');
		} */

		function out(name){
			console.log(name);
			if(confirm('정말 탈퇴하시겠습니까?')){
				return alert('탈퇴가 정상 처리되었습니다.');
			}else{
				return false;
			}
		
		}
	</script>
</body>
</html>