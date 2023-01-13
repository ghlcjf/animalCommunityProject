<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<!--부트스트랩 주소-->
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>   
	<script
       src="https://code.jquery.com/jquery-3.6.1.js"
       integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
       crossorigin="anonymous">
   </script>
	<jsp:include page="../header.jsp"></jsp:include>
	
	
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
	
		<button type="submit" onclick="return loginCheck()">
			<spring:message code="login.btn"/>
		</button>
	</form:form>

</body>
<script type="text/javascript">
	function loginCheck(){
		alert('1234');
		return false;
	}
</script>
</html>

