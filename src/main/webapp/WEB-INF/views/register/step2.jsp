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
			width: 800px; 
			
		}

		.form-control{
			margin: 10px;
		}
	
		button[type="submit"]{
			margin: 20px;
	 		width: 200px; height: 50px; border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
			
		}
		
		button[type="submit"]:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
		}
		
	</style>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>


	<h2 style="text-align: center;">회원가입</h2>
	<hr>
	<form:form action="main" modelAttribute="formData">
		<div id="register-box">
			<table class="register-table">
				<tr>
					<td><spring:message code="name"/></td>
					<td>
						<form:input class="form-control" path="name"/>
						<form:errors path="name"/>
					</td>
				</tr>
				<tr>
					<td><spring:message code="id"/></td>
					<td>
						<form:input class="form-control" path="id"/>
						<form:errors path="id"/>				
					</td>
				</tr>
				<tr>
					<td><spring:message code="password"/></td>
					<td>
						<form:input class="form-control" path="password" type="password"/>
						<form:errors path="password"/>
					</td>
				</tr>
				<tr>
					<td><spring:message code="password.confirm"/></td>
					<td>
						<form:input class="form-control" path="confirmPassword" type="password"/>
						<form:errors path="confirmPassword"/>
					</td>
				</tr>
				<tr>
					<td><spring:message code="email"/></td>
					<td>
						<form:input class="form-control" path="email" type="email"/>
						<form:errors path="email"/>
					</td>
				</tr>
				<tr>
					<td><spring:message code="phone"/></td>
					<td>
						<form:input class="form-control" path="phone" placeholder="-하이폰을 입력해주세요"/>
						<form:errors path="phone"/>
					</td>	
				</tr>
				<tr>
					<td></td>
					<td>
						<button type="submit"  onclick="return registerCheck()"><spring:message code="register.btn"/></button>
					</td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>