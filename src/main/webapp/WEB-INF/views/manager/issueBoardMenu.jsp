<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>이슈 게시판 관리자 페이지</h2>

<c:choose>
	<c:when test="${empty issueBoardList}">
		<p>게시글이 없습니다.<br>
			<c:url value="/manager/writeForm/issue" var="writeUrl" />
			<button type="button" onclick="location.href='${writeUrl}'">글 작성하기</button>
		</p>
	</c:when>
	<c:otherwise>
		<table border="1">
			<tr>
				<td colspan="4">
					<c:url value="/manager/writeForm/issue" var="writeUrl" />
					<button type="button" onclick="location.href='${writeUrl}'">글 작성하기</button>
				</td>
			</tr>
			<tr>
				<td>글 번호</td>
				<td>글 제목</td>
				<td>작성자</td>
				<td>수정/삭제</td>
			</tr>
			<c:forEach items="${issueBoardList}" var="issueBoard">
				<tr>
					<td>${issueBoard.issueNum}</td>
					<td>${issueBoard.issueTitle}</td>
					<td>${issueBoard.name}</td>
					<td>
						<c:url value="/manager/updateForm/issue/${issueBoard.issueNum}" var="updateUrl" />
						<button type="button" onclick="location.href='${updateUrl}'">수정</button>
						<c:url value="/manager/delete/issue/${issueBoard.issueNum}" var="deleteUrl" />
						<button type="button" onclick="location.href='${deleteUrl}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:otherwise>

</c:choose>
<a href='<c:url value="/manager/managerMain" />'>관리자 메인페이지로 돌아가기</a>


</body>
</html>