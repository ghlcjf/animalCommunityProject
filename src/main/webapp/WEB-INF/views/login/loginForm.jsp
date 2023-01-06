<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	
	<form:form modelAttribute="loginCommand">
		<form:errors/><!--path없을시 글로벌 에러-->
		<p>
			<label>
				<spring:message code="id"/>: <br>
				<form:input path="id"/>
				<form:errors path="id"/>
			</label>
		</p>
		<p>
			<label>
				<spring:message code="password"/>: <br>
				<form:input path="password"/>
				<form:errors path="password"/>
			</label>
		</p>
		<p>
			<label>
				<form:checkbox path="rememberId"/>
				<spring:message code="rememberId"/>
			</label>
		</p>
	
		<button type="submit">
			<spring:message code="login.btn"/>
		</button>
	</form:form>





</body>
</html>

