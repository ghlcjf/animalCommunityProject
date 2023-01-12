<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
	<button type="submit" onclick="return insertIssueBoardCheck()">글 등록</button>
	
</form:form>

</body>
<script type="text/javascript">
	function insertIssueBoardCheck() {
		
		if($('#issueTitle').val()==''){
			alert('제목을 입력해 주세요');
			return false;
		}
		if($('#issueContent').val()==0){
			alert('내용을 입력해 주세요');
			return false;
		}
		
		let cc = confirm('게시글을 작성하시겠습니까?');
		
		return cc;
	}

</script>
</html>