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
		h2{
			margin-bottom: 30px;
			font-weight:bolder;
		}
		.d-grid{
			margin-top: 70px;
		}
		#section{
			margin-bottom: 30px;
		}
		.smBtn{
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
		}
		button[type="submit"]:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
		}
		
	</style>

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="d-grid gap-2 col-6 mx-auto">
		<h2>${user.name}님 마이페이지</h2>
		<table class="table">
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>전화번호</th>
			</tr>
			<tr>
		
				<td>${user.name }</td>
				<td>${user.id }</td>
				<td>${user.email }</td>
				<td>${user.phone }</td>
			</tr>
		</table>
		<form id="section" action="<c:url value='/checkPassword' />">
			<button class="bigBtn" type="submit" onclick="newWindow()">개인정보 수정하기</button>
		</form>
		<h2>게시글 목록</h2>
		<c:choose>
			<c:when test="${empty board}">
				<p>게시글이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<table class="table">
					<tr>
						<th>글제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>글수정</th>
						<th>글삭제</th>
					</tr>
					<c:forEach items="${board}" var="board">
						<tr>
							<td>${board.boardTitle}</td>
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
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<a href='<c:url value="/main" />'>메인으로 돌아가기</a>
	</div>

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

	</script>
</body>
</html>