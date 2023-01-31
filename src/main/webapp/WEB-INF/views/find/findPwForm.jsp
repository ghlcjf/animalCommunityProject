<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		#result{
			text-align: center;
			font-size:20px;
		}
		.findBtn{
			height: 80px; width:80px;	
			

		}
		.smallBtn{
			width:100%;
		}
		button[type="button"]{
			border-radius: 10px;
			padding: 5px;   border: none;
			color: white;   font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			
		}
		button[type="button"]:hover{
   			background: rgb(101, 121, 207);
			background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
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
		<form:form modelAttribute="findPwCommand">
			<h4 style="text-align: center;">비밀번호 찾기</h4>
			<hr>
			<table class="col">
				<tr>
					<th class="loginId">
						<form:input class="form-control" path="id" id="id" placeholder="id"/>
					</th>
					<td rowspan="2" style="width:90px;">
						<button class="findBtn" type="button" onclick="return findPw()">임시비밀번호 발급</button>
					</td>
				</tr>
				<tr>
					<th class="loginPwd">
						<form:input class="form-control" path="email" id="email" placeholder="email"/>
					</th>
				</tr>
			</table>
			<!-- <div>
				<p id="result"></p>
				
			</div> -->
			<!-- <div>
				<button type="button" class="smallBtn" onclick="findIdLogin()">로그인창 돌아가기</button>
			</div> -->
		</form:form>
			

	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript">

		function findPw(){
			
			let emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			let id = document.getElementById('id').value;
			let email = document.getElementById('email').value;
			
			if(id.length==0){
				alert('아이디를 입력해주세요');
				return false;
			}
			if(email.length==0){
				alert('이메일을 입력해주세요');
				return false;
			}
			if(email.match(emailRegex) == null){
				alert('올바른 이메일 형식이 아닙니다. 다시 입력해주세요.');
				return false;
			}
			$.ajax({
				type:"GET",
				url:"${context}/pwFind",
				async:false,
				data:{"id":id,
					  "email":email},
				dateType:JSON,
				success:function(data){
					
					
				}
				
			})
		}	
	
	
		
		
	</script>
</body>
</html>