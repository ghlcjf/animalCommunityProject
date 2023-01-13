<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 게시글 작성하기</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


</head>

<body>

	<jsp:include page="../header.jsp"></jsp:include>
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
		<button type="submit" onclick="return insertFreeBoardCheck()">글 등록</button>
		
	</form:form>


</body>
<script type="text/javascript">
	function insertFreeBoardCheck() {
		
		if($('#boardTitle').val()==''){
			alert('제목을 입력해 주세요');
			return false;
		}
		if($('#boardContent').val()==0){
			alert('내용을 입력해 주세요');
			return false;
		}
		
		let cc = confirm('게시글을 작성하시겠습니까?');
		
		return cc;
	}

</script>

</html>