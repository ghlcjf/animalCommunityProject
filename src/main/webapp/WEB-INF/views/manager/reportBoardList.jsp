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
</head>
<body>
	<h2>신고게시글 리스트</h2>
	<c:choose>
		<c:when test="${empty freeBoard}">
			<p>신고들어온 게시물이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<table border="1">
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
						<td>${freeBoard.report}</td>
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
	<script type="text/javascript">
		function boardDelete(){
			 return confirm('게시글을 삭제 하시겠습니까?');
		}
	</script>
</body>
</html>