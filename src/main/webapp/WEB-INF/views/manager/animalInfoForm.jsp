<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!--부트스트랩-->
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

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
	<button type="submit" onclick="return insertAnimalInfoCheck()">글 등록</button>
</form:form>
</body>
<script type="text/javascript">
	function insertAnimalInfoCheck() {
		
		if($('#animalTitle').val()==''){
			alert('제목을 입력해 주세요');
			return false;
		}
		if($('#animalContent').val()==0){
			alert('내용을 입력해 주세요');
			return false;
		}
		
		let cc = confirm('게시글을 작성하시겠습니까?');
		
		return cc;
	}

</script>
</html>