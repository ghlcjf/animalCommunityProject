<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 게시글 작성하기</title>
</head>
<body>

<h2>[자유게시판] 게시글 작성하기</h2>

<form:form action="insertFreeBoard" modelAttribute="freeBoardCommand" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>카테고리</td>
			<td>
				<form:select path="boardCategory">
					<form:option value="dog">강아지</form:option>
					<form:option value="cat">고양이</form:option>
					<form:option value="reptile">파충류</form:option>
					<form:option value="birds">조류</form:option>
					<form:option value="fish">어류</form:option>
					<form:option value="other">기타</form:option>
				</form:select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<form:input path="boardTitle"/>
				<form:errors path="boardTitle" />
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<input type="file" id="boardUrl2" name="boardUrl2">
				<form:errors path="boardUrl" />
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<form:textarea path="boardContent"/>
				<form:errors path="boardContent" />
			</td>
		</tr>
	</table>
	<button type="submit">글 등록</button>
	
</form:form>


</body>
</html>