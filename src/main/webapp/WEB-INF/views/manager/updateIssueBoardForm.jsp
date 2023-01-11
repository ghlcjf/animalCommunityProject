<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>공지사항 수정 페이지</h2>

<form:form action="/animalCommunity/manager/updateIssueBoard" modelAttribute="issueBoard" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td rowspan="3">
				<c:choose>
					<c:when test="${issueBoard.issueUrl=='null' || empty issueBoard.issueUrl}">
						<img src="<c:url value='/resources/image/noImage.png' />"><br>
					</c:when>
					
					<c:otherwise>
						<img src="<c:url value='/resources/freeBoardImage/${issueBoard.issueUrl }' />" ><br>
					</c:otherwise>
				
				</c:choose>
			</td>
			<td>제목</td>
			<td>
				<form:input path="issueTitle"/>
				<form:errors path="issueTitle" />
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				이미지 변경을 원할 때만 수정해 주세요!<br>
				<input type="file" id="issueUrl2" name="issueUrl2">
				<input type="hidden" name="originPic" value="${issueBoard.issueUrl}"> 
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
	<form:hidden path="issueNum"/>
	<button type="submit">글 등록</button>
	
</form:form>
</body>
</html>