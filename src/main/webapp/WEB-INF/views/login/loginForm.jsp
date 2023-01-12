<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
				<!-- <input type="text" name="id" id="id"> -->
				<%-- <input type="hidden" name="idCheck" id="idCheck" value="${loginCommand.id }"> --%>
				<%-- <form:errors path="id"/> --%>
			</label>
		</p>
		<p>
			<label>
				<spring:message code="password"/>: <br>
				<form:password path="password" />
				<!-- <input type="password" name="password" id="password"> -->
				<%-- <input type="hidden" name="passwordCheck" id="passwordCheck" value="${loginCommand.password }"> --%>
				<%-- <form:errors path="password"/> --%>
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
	function loginCheck() {
		alert('123');
		let id = $('#id').val();
		let pw = $('#password').val();
		아이디 비밀번호를 location.href="";
		컨트롤러 받아온 아이디랑 비밀번호 서비스객체로 보내줘요
		서비스객체에서 아이디 비밀번호 DAO로 연결
		아이디를 먼저 찾아요
		(데이터베이스에서 가져온 아이디)아이디가 있다면
		(사용자가 입력한 비밀번호와 데이터베이스에서 가져온 비밀번호 맞는지 확인)
		아이디도 있고 비밀번호도 맞다면 true를 반환하는 메서드
		아니라면 false
		
		/* let id = document.getElementById('id').value;
		let idCheck = document.getElementById('idCheck').value; 
		let password = document.getElementById('password').value;
		let passwordCheck = document.getElementById('passwordCheck').value;
		
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
		if (id != idCheck || password != passwordCheck) {
			alert('아이디 또는 비밀번호가 틀립니다');
			return false;
		} 
		 if (id.value != idCheck.value || password.value != passwordCheck.value) {
			alert('아이디 또는 비밀번호가 틀립니다');
			return false;
		}
		return true; */
		return false;
	}
</script>
</html>

