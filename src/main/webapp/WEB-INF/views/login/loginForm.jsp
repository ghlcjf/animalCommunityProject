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

	<style>
		#loginformBox{
			display: flex;
	        justify-content: center;
	        align-items: center;
	        margin: 30px;
	        margin-bottom: 500px;
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
		
		p{
			padding-top:12px;
			float:right;
		}
		button[type="submit"]{
			margin-top:10px;
	 		width: 200px; height: 50px; border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
			display: block;
			margin:auto;
		}
		
		button[type="submit"]:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
		}
	
		.kakaologo{
			width: 203px; height: 53px; border-radius: 10px;
			display: block;
			margin:auto;
			margin-top:5px;
		}
	
	</style>
</head>
<body>   
	<script
       src="https://code.jquery.com/jquery-3.6.1.js"
       integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
       crossorigin="anonymous">
   </script>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div id="loginformBox">
	
		<form:form action="/animalCommunity/login" modelAttribute="loginCommand" method="post">
			<h4 style="text-align: center;">로그인</h4>
			<hr>
				<table class="col">
					<tr>
						<th class="loginId" colspan="3">
							<form:input class="form-control" path="id" placeholder="id"/>
						</th>
								
					</tr>
					<tr>
						<th class="loginPwd" colspan="3">
							<form:input class="form-control" path="password" type="password" placeholder="password"/>
						</th>
					</tr>
					<tr>
						<td>
							<form:checkbox path="rememberId"/>
							<spring:message code="rememberId"/>
						</td>
						<td>
							<p><a href="<c:url value='findIdForm'/>">아이디 찾기</a></p>
						</td>
						<td style="width:120px;">
							<p><a href="<c:url value='findPwForm'/>">비밀번호 찾기</a></p>
						</td>
					</tr>					
					<tr>
						<th colspan="3" style="text-align: center;">
							<button  type="submit" onclick="return loginCheck()">
								<spring:message code="login.btn"/>
							</button>
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=3e99b1f9d093993529dc3f7a28116951&redirect_uri=http://192.168.0.51:8090/animalCommunity/kakaoLogin&response_type=code"><img class="kakaologo" alt="카카오 로그인" src="/imageFolder/kakaomediumlogo.png"></a>
						</th>						
					</tr>

				</table>
				

		</form:form>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
<script type="text/javascript">
	function loginCheck() {
		
		let id = $('#id').val();
		let password = $('#password').val();


		if($('#id').val()==''){
			alert('아이디를 입력해주세요');
			($('#id').focus());
			return false;
		}
		
		if($('#password').val()==''){
			alert('비밀번호를 입력해주세요');
			($('#password').focus());
			return false;
		}
		
		$.ajax({
			type: "POST",
			url: "${context}/loginCheck",
			data: {"id":id, "password":password},
			dateType: JSON,
			success: function(data){
				if (!data) {
					alert('아이디 또는 비밀번호가 틀렸습니다.')
				}
				return data;
			}
		});
	}
		
		/* 컨트롤러 받아온 아이디랑 비밀번호 서비스객체로 보내줘요
		서비스객체에서 아이디 비밀번호 DAO로 연결
		아이디를 먼저 찾아요
		(데이터베이스에서 가져온 아이디)아이디가 있다면
		(사용자가 입력한 비밀번호와 데이터베이스에서 가져온 비밀번호 맞는지 확인)
		아이디도 있고 비밀번호도 맞다면 true를 반환하는 메서드 
		아니라면 false */
		
</script>
</html>

