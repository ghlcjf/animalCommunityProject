<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<style>
		button[type="submit"]{
	 		width: 50px; height: 33px; border-radius: 10px;
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
	<h2>신고게시글 리스트</h2>
		<c:choose>
			<c:when test="${empty freeBoard}">
				<p>신고들어온 게시물이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<table class="table">
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>신고수</th>
							<th>글삭제</th>
						</tr>
					<c:forEach items="${freeBoard }" var="freeBoard">
						<tr>
							<td>${freeBoard.boardNum}</td>
							<td>${freeBoard.boardTitle}</td>
							<td>${freeBoard.name}</td>
							<td><fmt:formatDate value="${freeBoard.writeDate}" pattern="yyyy-MM-dd"/></td>
							<td style="color:red;"><strong>${freeBoard.report}</strong></td>
							<td>
								<form action="<c:url value='/reportBoardDelete/${freeBoard.boardNum}' />">
									<button type="submit" onclick="return boardDelete()">삭제</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<a href='<c:url value="/manager/managerMain" />'>이전으로 돌아가기</a>
	</div>	
	<script type="text/javascript">
		function boardDelete(){
			 return confirm('게시글을 삭제 하시겠습니까?');
		}
	</script>
</body>
</html>