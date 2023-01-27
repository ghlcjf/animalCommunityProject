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
.container{
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
	padding: 5px;   
	border: none;
	height: 40px; 	
	border-radius: 10px;
	width: 95px;
	color: white;   
	font-weight:bolder;
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
				<p class="fs-2">동물 병원 정보 글 수정</p>
				<hr>

				<form:form action="/animalCommunity/manager/updateHospitalInfo" modelAttribute="hospitalInfo">
				
				<div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">병원 이름</label>
					<form:input path="hospitalName" class="form-control exampleFormControlInput1" id="hospitalName" placeholder="이름을 입력해주세요 (40자 이내)"/>
				</div>
				
				<div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">병원 지역</label>
		            <form:select path="hospitalLoc" class="form-select" aria-label="Default select example" id="category">
	            		<form:option value="선택">선택</form:option>
						<form:option value="서울" >서울</form:option>
						<form:option value="경기도" >경기도</form:option>
						<form:option value="강원도" >강원도</form:option>
						<form:option value="충청도" >충청도</form:option>
						<form:option value="경상도" >경상도</form:option>
						<form:option value="전라도" >전라도</form:option>
						<form:option value="제주도" >제주도</form:option>
					</form:select>
				</div>
				
				<div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">병원 상세 주소</label>
					<form:input path="detailedAddress" class="form-control exampleFormControlInput1" placeholder="상세 주소를 입력해주세요 (100자 이내)"/>
				</div>
				
				<div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">병원 전화번호</label>
					<form:input path="hospitalTel" class="form-control exampleFormControlInput1" placeholder="전화번호를 입력해주세요 (20자 이내)"/>
				</div>
				
				<div class="mb-3">
			        <label for="exampleFormControlTextarea1" class="form-label">병원 소개</label>
			        <form:textarea path="hospitalInfo" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력해주세요 (1000자 이내)"/>
		      	</div>
		      	
				<form:hidden path="boardNum"/>
				<button type="button" onclick="return cancel()">취소</button>
				<button type="submit" onclick="return insertHospitalCheck()">글 수정</button>
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
			let link = '${context}/boardManagement/hospitalInfo/'+${sectionPage.section}+'/'+${sectionPage.pageNum};
				
			return location.href=link;
		}
		return false;
	}
	function insertHospitalCheck() {
		
		if($('#hospitalName').val()==''){
			alert('병원 이름을 입력해 주세요');
			return false;
		}
		
		if($('#category').val()=='선택'){
			alert('지역을 선택해 주세요');
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
		/* modelAttribute와 textarea의 아이디가 같아서 네임값을 이용해 값 가져오기 */
		/* let hospitalInfo = document.getElementsByName('hospitalInfo')[0].value;
		if(hospitalInfo==''){
			alert('내용을 입력해 주세요');
			return false;
		}	 */
		
		if($('#exampleFormControlTextarea1').val()==''){
			alert('병원 소개 내용을 입력해 주세요');
			return false;
		}
		
		if($('#hospitalName').val().length>40){
			alert('이름 글자수가 초과되었습니다. ※40자 이하※');
			return false;
		}
				
		/* if(hospitalInfo.length>1000){
			alert('내용 글자수가 초과되었습니다. ※1000자 이하※');
			return false;
		} */
		
		if($('#detailedAddress').val().length>100){
			alert('상세 주소 글자수가 초과되었습니다. ※100자 이하※');
			return false;
		}
		
		if($('#hospitalTel').val().length>20){
			alert('전화번호 글자수가 초과되었습니다. ※20자 이하※');
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