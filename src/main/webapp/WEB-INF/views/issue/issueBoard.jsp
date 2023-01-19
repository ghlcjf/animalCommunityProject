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
table {
	table-layout: fixed
}

.table {
	margin-top: 30px;
}

thead {
	background-color: #dfe6f7;
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
</style>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container text-center">
        <div class="row">
 <div class="col-10 mx-auto">
<nav class="navbar">
		<div class="container-fluid">
			<span class="navbar-brand-cs mb-0 h1">이슈</span>
		</div>
	</nav>

<c:choose>
	<c:when test="${empty issue}">
		<p>게시글이 없습니다.</p>
	</c:when>
	<c:otherwise>
		<table class="table table-hover table-sm">
		<thead>
			<tr>
				<th scope="col">글 번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
			</thead>
			<c:forEach items="${issue}" var="board" varStatus="b">
				<tr>
					<th scope="row">${board.issueNum}</th>
					<td style="cursor: pointer;" onclick="location.href='<c:url value='/issue/detail/${board.issueNum}' />'"> ${board.issueTitle}</td>
					<td>${board.name}</td>
					<td><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</table>
		
	</c:otherwise>
</c:choose>
</div>
</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>