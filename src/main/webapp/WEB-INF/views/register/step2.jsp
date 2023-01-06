<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<h2>회원가입</h2>
	<form:form action="step3" modelAttribute="formData">
		<p>
			<label><spring:message code="name"/>
				<form:input path="name"/>
				<form:errors path="name"/>
			</label>
		</p>
		
		<p>
			<label><spring:message code="id"/>
				<form:input path="id"/>
				<form:errors path="id"/>
			</label>
		</p>
	
		<p>
			<label><spring:message code="password"/>
				<form:input path="password"/>
				<form:errors path="password"/>
			</label>
		</p>
		<p>
			<label><spring:message code="password.confirm"/>
				<form:input path="confirmPassword"/>
				<form:errors path="confirmPassword"/>
			</label>
		</p>
		<p>
			<label><spring:message code="email"/>
				<form:input path="email"/>
				<form:errors path="email"/>
				<!-- <input type="checkbox" name="advertise" value=""> -->
			</label>		
		</p>
		<p>
			<label><spring:message code="phone"/>
				<form:input path="phone"/>
				<form:errors path="phone"/>
			</label>
		</p>
		
		<button type="submit"><spring:message code="register.btn"/></button>
	</form:form>
	
	
</body>
</html>