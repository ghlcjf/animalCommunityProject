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
.container {
    margin-top: 20px;
}

.fs-2 {
	color: #889ae9;
	font-weight: bold;
}

.form-label {
	font-weight: bold;
}

#exampleFormControlTextarea1 {
    height: 300px;
    resize: none;
}

img {
	width: 100%;
	height: 500px;
}

button {
	padding: 5px;   border: none;
	height: 40px; 	border-radius: 10px;
	width: 95px;
	color: white;   font-weight:bolder;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
}

button:hover {
	background: rgb(101, 121, 207);
	background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
		<div class="container">
        	<div class="row">
				<div class="col-7 mx-auto">
					<p class="fs-2">동물 소개 글 수정</p>
					<hr>

					<form:form action="/animalCommunity/manager/updateAnimalInfo" modelAttribute="animalInfo" enctype="multipart/form-data">
			
					<div class="mb-3">
			            <label for="exampleFormControlInput1" class="form-label">제목</label>
						<form:input path="animalTitle" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요"/>
					</div>
				
					<div class="mb-3">
			            <label for="exampleFormControlInput1" class="form-label">카테고리</label>
			            <form:select path="animalCategory" class="form-select" aria-label="Default select example" id="category">
		            		<form:option value="선택">선택</form:option>
							<form:option value="강아지">강아지</form:option>
							<form:option value="고양이">고양이</form:option>
							<form:option value="파충류">파충류</form:option>
							<form:option value="조류">조류</form:option>
							<form:option value="어류">어류</form:option>
							<form:option value="기타">기타</form:option>
						</form:select>
					</div>
			
					<c:choose>
						<c:when test="${animalInfo.animalUrl=='null' || empty animalInfo.animalUrl}">
							<!-- <img src="/imageFolder/noImage.png" class="rounded mx-auto d-block"><br> -->
						</c:when>
						<c:otherwise>
							<img src="/imageFolder/animalInfoImage/${animalInfo.animalUrl }"><br><br>
						</c:otherwise>
					</c:choose>
				
					<div class="mb-3">
				        <label for="formFile" class="form-label">이미지 등록/수정</label>
				        <input type="file" id="animalUrl2" name="animalUrl2" class="form-control" type="file" id="formFile">
				        <input type="hidden" name="originPic" value="${animalInfo.animalUrl}">
			      	</div>
		      	
					<div class="mb-3">
				        <label for="exampleFormControlTextarea1" class="form-label">내용</label>
				        <form:textarea path="animalContent" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력해주세요 (1000자 이내)"/>
					</div>
					
					<form:hidden path="animalNum"/>
					<button type="button" onclick="return cancel()">취소</button>
					<button type="submit" onclick="return insertAnimalInfoCheck()">글 수정</button>
				</form:form>
			</div>
		</div>
	</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>

<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
<script type="text/javascript">
	function cancel(){
		if(confirm('수정을 취소 하시겠습니까?')){
			let link = '${context}/boardManagement/animalInfo';
				
			return location.href=link;
		}
		return false;
	}
	function insertAnimalInfoCheck() {
		
		if($('#exampleFormControlInput1').val()==''){
			alert('제목을 입력해 주세요');
			return false;
		}
		
		if($('#category').val()=='선택'){
			alert('카테고리를 선택해 주세요');
			return false;
		}
		
		if($('#exampleFormControlTextarea1').val()==0){
			alert('내용을 입력해 주세요');
			return false;
		}
		if($('#exampleFormControlInput1').val().length>40){
			alert('제목 글자수가 초과되었습니다. ※40자 이하※');
			return false;
		}
				
		if($('#exampleFormControlTextarea1').val().length>1000){
			alert('내용 글자수가 초과되었습니다. ※1000자 이하※');
			return false;
		}
		let cc = confirm('게시글을 수정하시겠습니까?');
		if(cc){
			alert('수정이 완료되었습니다.');
			return cc;
		}
		return false;
	}

</script>
</html>