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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h2>회원 정보 수정</h2>

 	<form:form action="/animalCommunity/changeInfo" modelAttribute="user" id="frm">
		<p>
			<label><spring:message code="name"/>
				<form:input path="name" />
				<input type="hidden" name="oldName" id="oldName" value="${user.name}">
				<input type="hidden" name="btnCheck" id="btnCheck">
				<button type="button" onclick="nameCheck()">중복 체크</button>
			</label>
		</p>
		
		<p>
			<label><spring:message code="id"/>
				<form:input path="id" disabled="true"/>
				<input type="hidden" name="id" value="${user.id }">
			</label>
		</p>
	
		<p>
			<label><spring:message code="password"/>
				<input type="password" name="oldpassword" id="oldPassword" value="${user.password}" disabled>
			</label>
		</p>
		<p>
			<label><spring:message code="new.password"/>
				<input type="password" name="password" id="newPassword">
			</label>
		</p>
		<p>
			<label><spring:message code="email"/>
				<form:input path="email" type="email" disabled="true"/>
				<input type="hidden" name="email" value="${user.email }">
			</label>		
		</p>
		<p>
			<label><spring:message code="phone"/>
				<form:input path="phone" />
				<input type="hidden" name="admin" value="${user.admin }">
			</label>
		</p>
		
		<button type="submit" onclick="return checkPassword()"><spring:message code="changeInfo.btn"/></button>
	</form:form> 
	
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript">
		function checkPassword() {

			let newPassword = document.getElementById('newPassword').value;
			let oldPassword = document.getElementById('oldPassword').value;
			let btnCheck = document.getElementById('btnCheck').value;
			
			if(btnCheck.length==0){
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
			
			let url = "${context}/newWindow/"+name;
			
			window.open(url,'_blank_1',
			'toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200');
		}
	</script>
</body>
</html>