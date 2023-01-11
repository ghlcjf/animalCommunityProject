<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h2>비밀번호 확인</h2>
	<form action="/animalCommunity/checkPassword2/${user.name}" method="post" id="frm">
		<input type="password" name="password" value="${user.password}" disabled="disabled"><br>
		<input type="password" name="confirmPassword">	
		<button type="submit" onclick="return checkPassword()">비밀번호 확인</button>
	</form>
 	<script type="text/javascript">
		function checkPassword() {
			let f = document.forms.frm;
			
			let confirmPassword = f.confirmPassword.value;
			let password = f.password.value;
			
			 if(confirmPassword.length==0){
				alert('비밀번호를 입력해 주세요.');
				
				return false;
			} 
			if(confirmPassword.length>=1 && confirmPassword!=password){
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			}else if(confirmPassword==password){
				return true;
			}
			return false;
		}
	</script>
</body>
</html>