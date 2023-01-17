<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<h2>이슈 게시판</h2>
<c:choose>
	<c:when test="${empty issue}">
		<p>게시글이 없습니다.</p>
	</c:when>
	<c:otherwise>
		<table border="1">
			
			<%-- <c:if test="${!empty authInfo}">
				<tr>
					<td colspan="5" align="right"><a href="<c:url value='/board/write'/>">[게시글 작성]</a></td>
				</tr>
			</c:if> 
			--%>
			
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${issue}" var="board" varStatus="b">
				<tr>
					<td>${board.issueNum}</td>
					<td><a href="<c:url value='/issue/detail/${board.issueNum}' />"> ${board.issueTitle} </a></td>
					<td>${board.name}</td>
					<td><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
		
			</c:forEach>
			
		</table>
		<a href="<c:url value='/main' />">[메인화면으로 돌아가기]</a>
		
	</c:otherwise>
</c:choose>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>