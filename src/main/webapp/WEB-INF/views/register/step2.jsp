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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<h2>회원가입</h2>
	<form:form action="step3" modelAttribute="formData" id="frm">
		<p>
			<label><spring:message code="name"/>
				<input type="text" name="name" id="name">
				<input type="hidden" name="nameBtnCheck" id="nameBtnCheck">
				<button type="button" onclick="nameCheck()">중복 체크</button>
			</label>
		</p>
		
		<p>
			<label><spring:message code="id"/>
				<input type="text" name="id" id="id">
				<input type="hidden" name="idBtnCheck" id="idBtnCheck">
				<button type="button" onclick="idCheck()">중복 체크</button>
			</label>
		</p>
	
		<p>
			<label><spring:message code="password"/>
				<form:input path="password" type="password"/>
			</label>
		</p>
		<p>
			<label><spring:message code="password.confirm"/>
				<form:input path="confirmPassword" type="password"/>
			</label>
		</p>
		<p>
			<label><spring:message code="email"/>
				<form:input path="email" type="email"/>
			</label>		
		</p>
		<p>
			<label><spring:message code="phone"/>
				<form:input path="phone" placeholder="-하이폰을 입력해주세요"/>
			</label>
		</p>
		

		<button type="submit" onclick="return signUp()"><spring:message code="register.btn"/></button>

	</form:form>

	
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
		
		function signUp(){
			let name = $('#name').val();
			let id = $('#id').val();
			let password = $('#password').val();
			let confirmPassword = $('#confirmPassword').val();
			let email = $('#email').val();
			let phone = $('#phone').val();
			
			let nameBtnCheck = document.getElementById('nameBtnCheck').value;
			let idBtnCheck = document.getElementById('idBtnCheck').value;
			
			if(name.length==0){
				alert('닉네임을 입력해주세요');
				return false;
			} 
			if(id.length==0){
				alert('아이디를 입력해주세요');
				return false;
			}
			if(password.length==0){
				alert('비밀번호를 입력해주세요');
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
			if(phone.length==0){
				alert('전화번호를 입력해주세요');
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
			
			return true;
		}
	</script>

</body>
</html>