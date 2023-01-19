<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 체크 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<style>
		h2{
			text-align: center;
			margin-top: 30px;
		}
		.form-control-sm{
			width: 220px;
		}
		#loginformBox{
			display: flex;
	        justify-content: center;
	        align-items: center;
	        margin: 30px;
		}
		.btn-outline-primary{
			--bs-btn-color: rgb(136, 154, 233);
			--bs-btn-border-color: rgb(136, 154, 233);
			--bs-btn-hover-bg: rgb(136, 154, 233);
			--bs-btn-hover-border-color: rgb(136, 154, 233);
			--bs-btn-active-bg: rgb(136, 154, 233);
			--bs-btn-active-border-color: rgb(136, 154, 233);
			--bs-btn-disabled-color: rgb(136, 154, 233);
			--bs-btn-disabled-border-color: rgb(136, 154, 233);
		}
		button[type="button"]{
			margin-left:20px;
		}
		
	</style>
</head>
<body>
	<h2>닉네임 중복 체크</h2>
	<div id="loginformBox">
		<form id="frm">
			<table class="col">
				<tr>
					<td>
						<input class="form-control form-control-sm" type="text" name="name" id="name" value="${name}">
					</td>
					<td>
						<button class="btn btn-outline-primary btn-sm" type="button" onclick="nameCheck()">중복 체크</button><br>	
					</td>
				</tr>
				<tr>
					<td id="result">
					</td>
					<td id="btn">
					</td>
				</tr>
			</table>
		</form>
		
	</div>
	
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript">
		function nameCheck() {
			let name = document.getElementById('name').value;
			let btn = '<button class="btn btn-outline-primary btn-sm" type="button" onclick="newName()">사용</button>'
			
			
			$.ajax({
				type:"GET",
				url:"${context}/nameCheck",
				data:{"name":name},
				dateType:JSON,
				success:function(data){

					if(data=="사용가능한 닉네임 입니다."){
						$("#result").html(data);
						$("#btn").html(btn);
					}else{
						$("#result").html(data);
						$("#btn").html(null);
					}
					/* console.log(btn);
					console.log(data);
					$("#result").html(data+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+btn); */
				}
			})	
		}
		
		function newName(){
			let nameBtnCheck = 'y';
			let newName = document.getElementById('name').value;
			
			opener.frm.name.value = newName;
			opener.frm.nameBtnCheck.value = nameBtnCheck;
			
			self.close();
		}
	</script>

</body>
</html>