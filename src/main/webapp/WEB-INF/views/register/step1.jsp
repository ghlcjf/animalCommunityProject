<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 약관동의 페이지</title>
</head>
<body>
	<h2>약관동의 페이지</h2>
	<p>
		<strong>Animal Community 이용약관</strong><br>
		1)Animal Community 이용약관 동의<br>
		2)개인정보 수집 및 이용<br>
		3)고유식별 정보 수집<br>
	</p>
	
	<form action="step2" method="post">
		<label>
			<input type="checkbox" name="agree" value="true">
			<spring:message code="term.agree"/>
		</label><br>
		<button type="submit"><spring:message code="next.btn"/></button>
	</form>
	
</body>
</html>