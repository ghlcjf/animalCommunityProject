<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지</title>

	<style>	
		#register-box{
			display: flex; justify-content: center; align-items: center;
		}
	
		.register-table{
			display: flex; justify-content: center; align-items: center;
			width: 800px; 
			
		}

		.form-control{
			margin: 10px;
		}
		
		
		.big-btn{
			margin: 20px;
	 		width: 180px; height: 50px; border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
			
		}
		
		.sm-btn{
			margin: 10px;
	 		width: 100px; height: 40px; border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
			margin-left:20px;
		}
		
		
		.sm-btn:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
		}		
		.big-btn:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
		}
		::placeholder {
		  color: black;
		  font-size: 12px;
		  font-weight: 400;		  
		}
		
	</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<h2 style="text-align: center;">회원 정보 수정</h2>
	
 	<form:form action="/animalCommunity/changeInfo" modelAttribute="user" id="frm">
	 	<div id="register-box">
	 		<table class="register-table">
				<tr>
					<td><spring:message code="name"/></td>
					<td>
						<form:input class="form-control" path="name" readonly="true"/>
						<input type="hidden" name="oldName" id="oldName" value="${user.name}">
						<input type="hidden" name="nameBtnCheck" id="nameBtnCheck">
					</td>
					<td>
						<button type="button" class="sm-btn" onclick="nameCheck()">닉네임 변경</button>
					</td>
					
				</tr>
				
				<tr>
					<td><spring:message code="id"/></td>
					<td>
						<form:input class="form-control" path="id" readonly="true"/>
					</td>
					
				</tr>
			
				<tr>
					<td><spring:message code="password"/></td>
					<td>
						<input class="form-control" type="password" name="oldpassword" id="oldPassword" value="${user.password}" readonly>
					</td>
				</tr>
				<tr>
					<td><spring:message code="new.password"/></td>
					<td>
						<input class="form-control" type="password" name="password" id="newPassword" placeholder="※ 6~14자 영문자,숫자,특수문자 조합 ※">
					</td>
				</tr>
				<tr>
					<td><spring:message code="email"/></td>
					<td>
						<form:input class="form-control" path="email" type="email" readonly="true"/>
					</td>		
				</tr>
				<tr>
					<td><spring:message code="phone"/></td>
					<td>
						<form:input class="form-control" path="phone" />
						<input type="hidden" name="admin" value="${user.admin }">
					</td>
				</tr>
				<tr align="center">
					<td colspan="3">
						<button type="button" class="big-btn" onclick="return cancel()">취소</button>
						<button type="submit" class="big-btn" onclick="return checkPassword()"><spring:message code="changeInfo.btn"/></button>
					</td>
				</tr>
			</table>	
		</div>	
	</form:form> 
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript">
		function cancel(){
			if(confirm('정보수정을 취소 하시겠습니까?')){
				let link = '${context}/myPage/1/1';
				
				return location.href=link;
			}
			return false;
		}
		
		function checkPassword() {

			let nameRegex = /^[가-힣]{1}[a-z0-9가-힣]{1,7}$/g;
			let pwRegex =  /^.*(?=^.{6,14}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			let phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
			
			let name = $('#name').val();
			let newPassword = document.getElementById('newPassword').value;
			let oldPassword = document.getElementById('oldPassword').value;
			let nameBtnCheck = document.getElementById('nameBtnCheck').value;
			let phone = $('#phone').val();
			
			
			if(name.match(nameRegex) == null){
				alert('닉네임은 한글로 시작하는 2~8자입니다. (영문,숫자 사용가능)');
				return false;
			}
			if(newPassword.length==0){
				alert('새로운 비밀번호를 입력해 주세요.');
				return false;
			}
			if(newPassword==oldPassword){
				alert('기존의 비밀번호와 일치합니다. 다른 비밀번호를 입력해주세요.');
				return false;
			}
			if(newPassword.match(pwRegex) == null){
				alert('비밀번호는 6~14자 영문자,숫자,특수문자 조합이어야 합니다.');
				return false;
			} 
			if(phone.match(phoneRegex) == null){
				alert('올바른 전화번호 형식이 아닙니다. 다시 입력해주세요.');
				return false;
			}
			alert('수정이 완료되었습니다.')
			return true;
			  
		}
		
		function nameCheck(){
			
			let oldName = document.getElementById('oldName').value;
			let name = document.getElementById('name').value;
	
			let url = "${context}/myNameWindow/"+name;
			
			window.open(url,'_blank_1',
			'toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200');
		}
		
		window.onload = function() {
			var e = document.forms;
			for(i=0; i<e.length; i++){
				for(j=0; j<e[i].elements.length; j++){
					if(e[i].elements[j].readOnly) e[i].elements[j].style.backgroundColor = "#F0F0F0";
				}
			}
		}
	</script>
</body>
</html>