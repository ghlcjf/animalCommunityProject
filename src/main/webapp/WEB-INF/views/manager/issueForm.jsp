<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>이슈게시판 글 작성하기</h2>

<form:form action="/animalCommunity/manager/writeIssue" modelAttribute="issueBoardCommand" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>제목</td>
			<td>
				<form:input path="issueTitle"/>
				<form:errors path="issueTitle" />
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<input type="file" id="issueUrl2" name="issueUrl2">
				<form:errors path="issueUrl" />
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<form:textarea path="issueContent"/>
				<form:errors path="issueContent" />
			</td>
		</tr>
	</table>
	<button type="submit">글 등록</button>
	
</form:form>

</body>
</html>