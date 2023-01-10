<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	
	<%-- <form:form modelAttribute="loginCommand">
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
				<form:input path="password" type="password"/>
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
	</form:form> --%>
	
	<form:form modelAttribute="loginCommand">
	<div class="form-group">
		<form:errors/><!--path없을시 글로벌 에러-->
		<p>
			<label>
				<spring:message code="id"/>: <br>
				<form:input path="id" class="form-control"/>
				<form:errors path="id"/>
			</label>
		</p>
		</div>
		<div class="form-group">
		<p>
			<label>
				<spring:message code="password"/>: <br>
				<form:input path="password" type="password" class="form-control"/>
				<form:errors path="password"/>
			</label>
		</p>
		</div>
		<div class="form-group form-check">
		<p>
			<label class="form-check-label">
				<form:checkbox path="rememberId" class="form-check-input"/>
				<spring:message code="rememberId"/>
			</label>
		</p>
		</div>
	
		<button type="submit" class="btn btn-primary">
			<spring:message code="login.btn"/>
		</button>
	</form:form>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>

