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
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<h2>회원가입</h2>
	<form:form action="step3" modelAttribute="formData">
		<p>
			<label><spring:message code="name"/>
				<%-- <form:input path="name"/> --%>
				<input type="text" name="name" id="name">
				<form:errors path="name"/>
			</label>
		</p>
		
		<p>
			<label><spring:message code="id"/>
				<%-- <form:input path="id"/> --%>
				<input type="text" name="id" id="id">
				<form:errors path="id"/>
			</label>
		</p>
	
		<p>
			<label><spring:message code="password"/>
				<%-- <form:input path="password" type="password"/> --%>
				<input type="password" name="password" id="password">
				<form:errors path="password"/>
			</label>
		</p>
		<p>
			<label><spring:message code="password.confirm"/>
				<%-- <form:input path="confirmPassword" type="password"/> --%>
				<input type="password" name="confirmPassword" id="confirmPassword">
				<form:errors path="confirmPassword"/>
			</label>
		</p>
		<p>
			<label><spring:message code="email"/>
				<%-- <form:input path="email" type="email"/> --%>
				<input type="email" name="email" id="email">
				<form:errors path="email"/>
				<!-- <input type="checkbox" name="advertise" value=""> -->
			</label>		
		</p>
		<p>
			<label><spring:message code="phone"/>
				<%-- <form:input path="phone" placeholder="-하이폰을 입력해주세요"/> --%>
				<input type="tel" name="phone" id="phone">
				<form:errors path="phone"/>
			</label>
		</p>
		
		<button type="submit" onclick="return registerCheck()">
		<spring:message code="register.btn"/></button>
	</form:form>

<c:set var="context" value="<%=request.getContextPath() %>"></c:set>	
	<script type="text/javascript">
	
	function registerCheck() {
		
		let name = document.getElementById('name').value;
		let id = document.getElementById('id').value;
		let password = document.getElementById('password').value;
		let confirmPassword = document.getElementById('confirmPassword').value;
		let email = document.getElementById('email').value;
		let phone = document.getElementById('phone').value;
		
		if (name.length==0) {
			alert('이름을 입력해주세요');
			name.focus();
			return false;
		}
		if (id.length==0) {
			alert('아이디를 입력해주세요');
			id.focus();
			return false;
		}
		if (password.length==0) {
			alert('비밀번호를 입력해주세요');
			password.focus();
			return false;
		}
		if (password!=confirmPassword) {
			alert('비밀번호가 일치하지 않습니다');
			password.focus();
			return false;
		}
		if (email.length==0) {
			alert('이메일을 입력해주세요');
			email.focus();
			return false;
		}
		if (phone.length==0) {
			alert('전화번호를 입력해주세요');
			phone.focus();
			return false;
		}
	}
</script>	
</body>
</html>