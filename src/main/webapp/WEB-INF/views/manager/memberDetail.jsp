<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h2>사용자 정보</h2>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
		</tr>
		<tr>
	
			<td>${member.name }</td>
			<td>${member.id }</td>
			<td>${member.email }</td>
			<td>${member.phone }</td>
		</tr>
	</table>
	<h2>게시글 목록</h2>
	<c:choose>
		<c:when test="${empty board}">
			<p>게시글이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>글제목</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>글삭제</th>
				</tr>
				<c:forEach items="${board}" var="board">
					<tr>
						<td>${board.boardTitle}</td>
						<td><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/></td>
						<td>${board.viewCount }</td>
						<td>
							<form action="<c:url value='/board/delete/${board.boardNum}' />">
								<button type="submit" onclick="return boardDelete()">삭제</button>
								<input type="hidden" name="name" value="${member.name }">
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<a href='<c:url value="/memberManagement" />'>목록으로 돌아가기</a>
	<script type="text/javascript">
		/* $(document).ready(()=>{
			$("#btnDelete").on("click",()=>{
				if(confirm('게시글을 삭제 하시겠습니까?')){
					location.replace("${context}/board/delete/");
				}
			})
		});
		 */
		function boardDelete(){
			 return confirm('게시글을 삭제 하시겠습니까?');
		}
		
	</script>
</body>
</html>