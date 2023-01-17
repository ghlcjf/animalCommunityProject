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
		
		button[type="button"]{
			margin-left:20px;
		}
		
		button[type="submit"]{
			margin: 20px;
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
						<form:input class="form-control" path="name" />
						<input type="hidden" name="oldName" id="oldName" value="${user.name}">
						<input type="hidden" name="nameBtnCheck" id="nameBtnCheck">
					</td>
					<td>
						<button type="button" onclick="nameCheck()">중복 체크</button>
					</td>
					
				</tr>
				
				<tr>
					<td><spring:message code="id"/></td>
					<td>
						<form:input class="form-control" path="id" disabled="true"/>
						<input type="hidden" name="id" value="${user.id }">
					</td>
				</tr>
			
				<tr>
					<td><spring:message code="password"/></td>
					<td>
						<input class="form-control" type="password" name="oldpassword" id="oldPassword" value="${user.password}" disabled>
					</td>
				</tr>
				<tr>
					<td><spring:message code="new.password"/></td>
					<td>
						<input class="form-control" type="password" name="password" id="newPassword">
					</td>
				</tr>
				<tr>
					<td><spring:message code="email"/></td>
					<td>
						<form:input class="form-control" path="email" type="email" disabled="true"/>
						<input type="hidden" name="email" value="${user.email }">
					</td>		
				</tr>
				<tr>
					<td><spring:message code="phone"/></td>
					<td>
						<form:input class="form-control" path="phone" />
						<input type="hidden" name="admin" value="${user.admin }">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<button type="submit" onclick="return checkPassword()"><spring:message code="changeInfo.btn"/></button>
					</td>
				</tr>
			</table>	
		</div>	
	</form:form> 
	
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript">
		function checkPassword() {

			let newPassword = document.getElementById('newPassword').value;
			let oldPassword = document.getElementById('oldPassword').value;
			let nameBtnCheck = document.getElementById('nameBtnCheck').value;
			
			if(nameBtnCheck.length==0){
				alert('닉네임 중복체크를 해주세요.')
				
				return false;
			}
			
			if(newPassword.length==0){
				alert('새로운 비밀번호를 입력해 주세요.');
				
				return false;
			}
			
			if(newPassword==oldPassword){
				alert('기존의 비밀번호와 일치합니다. 다른 비밀번호를 입력해주세요.');
				return false;
			}else if(newPassword!=oldPassword){
				alert('수정이 완료되었습니다.')
				return true;
			}  
		}
		
		function nameCheck(){
			
			let oldName = document.getElementById('oldName').value;
			let name = document.getElementById('name').value;
			
			if(name==oldName){
				alert('기존 닉네임이랑 일치합니다.');
				return false;
			}
			
			let url = "${context}/newNameWindow/"+name;
			
			window.open(url,'_blank_1',
			'toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200');
		}
	</script>
</body>
</html>