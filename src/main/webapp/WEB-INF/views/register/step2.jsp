<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
	<style>
	
		#register-box{
			display: flex; justify-content: center; align-items: center;
		}
	
		.register-table{
			display: flex; justify-content: center; align-items: center;
			width: 2000px; 
			
		}

		.form-control{
			margin: 10px;
		}

		.box-size{
			width: 300px;
		}
		#btn-center{
			text-align: center;
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


	<h2 style="text-align: center;">회원가입</h2>
	<hr>
	
	<form:form action="main" modelAttribute="formData" id="frm">
		<div id="register-box">
			<table class="register-table">
				<tr>
					<td><spring:message code="name"/></td>
					<td class="box-size">
						<form:input class="form-control" path="name" placeholder="※ 한글로 시작하는 2~8자 (영문,숫자 사용가능) ※" />
						<input  type="hidden" name="nameBtnCheck" id="nameBtnCheck">
					</td>
					<td>
						<button type="button" class="sm-btn" onclick="nameCheck()">중복체크</button>
					</td>
				</tr>
				<tr>
					<td><spring:message code="id"/></td>
					<td>
						<form:input class="form-control" path="id" placeholder="※ 영문자로 시작하는 6~16자 (숫자 사용가능) ※"/>
						<input type="hidden" name="idBtnCheck" id="idBtnCheck">
					</td>
					<td>
						<button type="button" class="sm-btn" onclick="idCheck()">중복체크</button>			
					</td>
				</tr>
				<tr>
					<td><spring:message code="password"/></td>
					<td>
						<form:input class="form-control" path="password" type="password" placeholder="※ 6~14자 영문자,숫자,특수문자 조합 ※"/>
					</td>
					<td rowspan="2"></td>
				</tr>
				<tr>
					<td><spring:message code="password.confirm"/></td>
					<td>
						<form:input class="form-control" path="confirmPassword" type="password"/>				
					</td>
				</tr>
				<tr>
					<td><spring:message code="email"/></td>
					<td>
						<form:input class="form-control" path="email" type="email" placeholder="※ 예) user@email.com ※"/>
					</td>
					<td>
						<button type="button" class="sm-btn" onclick="emailCheck()">인증하기</button>
					</td>
				</tr>
				<tr>
					<td><spring:message code="certificateNum"/></td>
					<td>
						<form:input class="form-control" path="certificateNum" type=" text" placeholder="인증번호를 입력해주세요."/>
						<input type="hidden" id="emailNum" value="0">
					</td>
				</tr>
				<tr>
					<td><spring:message code="phone"/></td>
					<td>
						<form:input class="form-control" path="phone" placeholder="※ - 하이폰을 입력해주세요 ※"/>
					</td>	
				</tr>
				<tr align="center">
					<td colspan="3">
						<button type="button" class="big-btn" onclick="return cancel()">취소</button>
						<button type="submit" class="big-btn" onclick="return signUp()"><spring:message code="register.btn"/></button>
					</td>
					
				</tr>
			</table>
		</div>
	</form:form>
	<jsp:include page="../footer.jsp"></jsp:include>
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript">
		function nameCheck(){
			
			let name = document.getElementById('name').value;
			
			if(name.length==0){
				alert('닉네임을 입력해주세요.');
				return false;
			}
			
			let url = "${context}/newNameWindow/"+name;
			
			window.open(url,'_blank_1',
			'toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200');
		}
		
		function idCheck(){
			
			let id = document.getElementById('id').value;
			
			if(id.length==0){
				alert('아이디를 입력해주세요.');
				return false;
			}
			
			let url = "${context}/newIdWindow/"+id;
			
			window.open(url,'_blank_2',
			'toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200');
		}
		
		
		function emailCheck(){
			let email = $('#email').val();
			if(email.length==0){
				alert('이메일을 입력해 주세요');
			}else{
				let emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if(email.match(emailRegex) == null){
					alert('올바른 이메일 형식이 아닙니다. 다시 입력해주세요.');
					return false;
				}else{
					$.ajax({
						type:"GET",
						url:"${context}/certificateNum",
						async:false,
						data:{"email":email},
						dateType:JSON,
						success:function(data){
							$('#emailNum').val(data);
							alert("이메일로 인증번호를 보냈습니다.");
						}
						
					})
				}
				
			}
			
		}
		
		function cancel(){
			if(confirm('회원가입을 취소 하시겠습니까?')){
				let link = '${context}/main';
				
				return location.href=link;
			}
			return false;
		}
		
		function signUp(){
			// 정규식
			let nameRegex = /^[가-힣]{1}[a-z0-9가-힣]{1,7}$/g;
			let idRegex = /^[a-z]{1}[a-z0-9]{5,15}$/g;
			let pwRegex =  /^.*(?=^.{6,14}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			let emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			let phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
			
			let name = $('#name').val();
			let id = $('#id').val();
			let password = $('#password').val();
			let confirmPassword = $('#confirmPassword').val();
			let email = $('#email').val();
			let certificateNum = $('#certificateNum').val();
			let emailNum = $('#emailNum').val();
			let phone = $('#phone').val();
			
			let nameBtnCheck = document.getElementById('nameBtnCheck').value;
			let idBtnCheck = document.getElementById('idBtnCheck').value;
			
			if(name.length==0){
				alert('닉네임을 입력해주세요');
				return false;
			} 
			if(name.match(nameRegex) == null){
				alert('닉네임은 한글로 시작하는 2~8자입니다. (영문,숫자 사용가능)');
				return false;
			}
			if(id.length==0){
				alert('아이디를 입력해주세요');
				return false;
			}
			if(id.match(idRegex) == null){
				alert('아이디는 영문자로 시작하는 6~16자입니다. (숫자 사용가능)');
				return false;
			}
			if(password.length==0){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			if(password.match(pwRegex) == null){
				alert('비밀번호는 6~14자 영문자,숫자,특수문자 조합이어야 합니다.');
				return false;
			} 
			if(confirmPassword.length==0){
				alert('비밀번호확인을 입력해주세요');
				return false;
			}
			if(password!=confirmPassword){
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			}
			if(email.length==0){
				alert('이메일을 입력해주세요');
				return false;
			}
			if(email.match(emailRegex) == null){
				alert('올바른 이메일 형식이 아닙니다. 다시 입력해주세요.');
				return false;
			}
			if(certificateNum!=emailNum){
				alert('이메일 인증번호가 일치하지 않습니다.')
				return false;
			}
			if(phone.length==0){
				alert('전화번호를 입력해주세요');
				return false;
			}
			if(phone.match(phoneRegex) == null){
				alert('올바른 전화번호 형식이 아닙니다. 다시 입력해주세요.');
				return false;
			}
			if(nameBtnCheck.length==0){
				alert('닉네임 중복체크를 해주세요.')	
				return false;
			}
			if(idBtnCheck.length==0){
				alert('아이디 중복체크를 해주세요.')	
				return false;
			}
			 
			alert('가입이 완료됐습니다.');
			return true;
		}
	</script>
</body>
</html>