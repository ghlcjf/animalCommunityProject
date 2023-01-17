<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	button{
	 		width: 200px; height: 50px; border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
			
		}
		
	button:hover{
  			background: rgb(101, 121, 207);
		background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>	

<div class="d-grid gap-2 col-6 mx-auto">
<h2>이미지 수정 페이지</h2>

<form:form action="/animalCommunity/manager/updateImage" modelAttribute="image" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<td colspan="2">
				<img src="/imageFolder/image/${image.imageUrl}" class="rounded mx-auto d-block" >
			</td>
		</tr>

		<tr>
			<th scope="row">이미지</th>
			<td>
				이미지 변경을 원할 때만 수정해 주세요!<br>
				<div class="input-group">
				  <input type="file" id="imageUrl2" name="imageUrl2" class="form-control">
				  <button class="btn btn-outline-secondary" type="button">Button</button>
				  <input type="hidden" name="originPic" value="${image.imageUrl}">
				</div> 
			</td>
		</tr>
		<tr>
			<th scope="row">이미지 정보</th>
			<td>
				<form:input path="imageInfo" class="form-control"/>
			</td>
		</tr>
	</table>
	<form:hidden path="imageNum"/>
	<button type="submit" onclick="return updateImageCheck()">글 등록</button>
	
</form:form>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function updateImageCheck() {
		
		if($('#imageInfo').val()==0){
			alert('사진 정보를 입력해 주세요');
			return false;
		}
		
		let cc = confirm('이미지를 수정하시겠습니까?');
		if(cc){
			alert('수정이 완료되었습니다.');
			return cc;
		}
		return false;
	}

</script>
</html>