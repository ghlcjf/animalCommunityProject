<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
<h2>이슈게시판 글 작성하기</h2>
					<!-- /animalCommunity/manager/writeIssue --> 
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
		if(cc){
			alert('작성이 완료되었습니다.');
			return cc;
		}
		return false;
	}

</script>
</html>