<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공 페이지</title>
</head>
<body>
<script
    src="https://code.jquery.com/jquery-3.6.1.js"
    integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
    crossorigin="anonymous">
</script>
	<jsp:include page="../header.jsp"></jsp:include>	
	<p>
		<spring:message code="register.done" arguments="${formData.name}"/>
	</p>
	<p>
		<a href="<c:url value='/main'/>">[<spring:message code="go.main"/>]</a>
	</p>
	
	<script type="text/javascript">
		alert("가입을 완료하였습니다");
	</script>
</body>
</html>