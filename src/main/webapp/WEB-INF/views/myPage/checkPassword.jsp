<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<style>
		#loginformBox{
			display: flex;
	        justify-content: center;
	        align-items: center;
	        margin: 30px;
		}
		table.col{
			width: 500px;
			
		}
		
		.loginId{
			padding: 10px;
		}
		
		.loginPwd{
			padding-top: 0px;    padding-bottom: 10px; 
			padding-right: 10px; padding-left: 10px;
		}
		

		button[type="submit"]{
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
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div id="loginformBox">
		<form action="/animalCommunity/checkPassword2/${user.name}" method="post" id="frm">
			<h2 style="text-align: center;">비밀번호 확인</h2>
			<hr>
			<table class="col">
				<tr>
					<td class="loginId">
						비밀번호 <input class="form-control" type="password" name="password" value="${user.password}" disabled="disabled"><br>
					</td>
				</tr>
				<tr>
					<td class="loginPwd">
						비밀번호 확인 <input class="form-control" type="password" name="confirmPassword">	
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						<button type="submit" onclick="return checkPassword()">비밀번호 확인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
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