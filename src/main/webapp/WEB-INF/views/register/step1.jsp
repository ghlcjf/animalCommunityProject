<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 약관동의 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<style type="text/css">
		#agree-container{
			text-align: center;
		}
		button[type="submit"]{
	 		width: 200px; height: 50px; border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
			
		}
		
		button[type="submit"]:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
		}
	</style>


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="step2" method="post">
		<div id="agree-container">
			<h2 style="text-align: center;">약관동의 페이지</h2>
			<hr>
			<textarea cols="100" rows="10" readonly>
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
			</textarea><br>

			<textarea cols="100" rows="10" readonly>
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
				Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 Animal Community 이용약관 동의 
			</textarea><br>
			<input type="checkbox" name="agree" value="false" id="agreeCheckbox" onclick="agreeCheck()">
			<spring:message code="term.agree"/><br>		
			<button type="submit" onclick="return confirmCheckbox()"><spring:message code="next.btn"/></button>		
		</div>

	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">

	function agreeCheck(){
		
		let checkbox = document.getElementById('agreeCheckbox');
		const is_checkbox = checkbox.checked;
		checkbox.value=is_checkbox;
	}
	
	function confirmCheckbox() {
		let checkbox = document.getElementById('agreeCheckbox').value;
	
		
		if (checkbox=='false') {
			alert('약관동의에 체크해주세요');
			return false;
		}
		return true;
	}
	
</script>

</body>
</html>