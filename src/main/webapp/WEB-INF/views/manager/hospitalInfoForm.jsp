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
<h2>병원 정보 글 작성하기</h2>

<form:form action="/animalCommunity/manager/writeHospitalInfo" modelAttribute="hospitalInfoCommand">
	<table class="table">
		<tr>
			<th scope="row">병원 이름</th>
			<td>
				<form:input path="hospitalName" class="form-control"/>
			</td>
		</tr>
		<tr>
			<th scope="row">병원 지역</th>
			<td>
				<form:select path="hospitalLoc" class="form-select">
					<form:option value="서울" >서울</form:option>
					<form:option value="경기도" >경기도</form:option>
					<form:option value="강원도" >강원도</form:option>
					<form:option value="충청도" >충청도</form:option>
					<form:option value="경상도" >경상도</form:option>
					<form:option value="전라도" >전라도</form:option>
					<form:option value="제주도" >제주도</form:option>
				</form:select>
			</td>
		</tr>
		<tr>
			<th scope="row">병원 상세 주소</th>
			<td>
				<form:input path="detailedAddress" class="form-control"/>
			</td>
		</tr>
		<tr>
			<th scope="row">병원 전화번호</th>
			<td>
				<form:input path="hospitalTel" class="form-control"/>
			</td>
		</tr>
		<tr>
			<th scope="row">병원 소개</th>
			<td>
				<form:textarea path="hospitalInfo" class="form-control" rows="3"/>
			</td>
		</tr>
	</table>
	<form:hidden path="name"/>
	<button type="submit" onclick="return insertHospitalCheck()">글 등록</button>

</form:form>
</div>
</body>

<script type="text/javascript">
	function insertHospitalCheck() {
		
		if($('#hospitalName').val()==''){
			alert('이름을 입력해 주세요');
			return false;
		}
		if($('#detailedAddress').val()==0){
			alert('상세 주소를 입력해 주세요');
			return false;
		}
		if($('#hospitalTel').val()==0){
			alert('전화번호를 입력해 주세요');
			return false;
		}
		console.log($('#hospitalInfo').val());
		if($('#hospitalInfo').val()==0){
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