<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<h2>자유게시판</h2>

<jsp:include page="freeBoardMenu.jsp"></jsp:include>

<table border="1">
	<c:if test="${!empty userInfo}">
		<tr>
			<td colspan="5" align="right">
				<a href="<%=request.getContextPath() %>/freeBoard/insertFreeBoardForm">[글 작성하기]</a>
			</td>
		</tr>
	</c:if>
	<tr>
		<th>글번호</th>
		<th>글제목</th>
		<th>조회수</th>
		<th>작성자</th>
		<th>작성일자</th>
	</tr>
	<c:choose>
		<c:when test="${empty freeBoardList}">
			<p>등록한 게시글이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach items="${freeBoardList}" var="board">
				<tr>
					<td>${board.boardNum }</td>
					<td>
						<a href="<c:url value='/freeBoard/readFreeBoard/${board.boardNum}' />">${board.boardTitle }</a>
					</td>
					<td>${board.viewCount }</td>
					<td>${board.name }</td>
					<td><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</c:otherwise>
		
	</c:choose>

</table>

</body>
</html>