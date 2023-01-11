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
<h2>동물 소개 게시글 작성하기</h2>

<form:form action="/animalCommunity/manager/writeAnimalInfo" modelAttribute="animalInfoCommand" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>동물 이름</td>
			<td>
				<form:input path="animalTitle"/>
				<form:errors path="animalTitle" />
			</td>
		</tr>
		<tr>
			<td>동물 종류</td>
			<td>
				<form:select path="animalCategory">
					<form:option value="강아지">강아지</form:option>
					<form:option value="고양이">고양이</form:option>
					<form:option value="파충류">파충류</form:option>
					<form:option value="조류">조류</form:option>
					<form:option value="어류">어류</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="animalCategory" />
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<input type="file" id="animalUrl2" name="animalUrl2">
				<form:errors path="animalUrl" />
			</td>
		</tr>
		<tr>
			<td>특징</td>
			<td>
				<form:textarea path="animalContent"/>
				<form:errors path="animalContent" />
			</td>
		</tr>
	</table>
	<button type="submit">글 등록</button>
</form:form>
</body>
</html>