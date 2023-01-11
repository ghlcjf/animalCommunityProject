<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 체크 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h2>닉네임 중복 체크</h2>
	<form action="/nameCheck" method="GET" name="frm">
		아이디 : <input type="text" name="name" id="name" value="${name}">
		<button type="button" onclick="nameCheck()">중복 체크</button><br>
		
		
	</form>
	
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript">
		function nameCheck() {
			let name = document.getElementById('name').value;
			
			console.log(name);
			
			$.ajax({
				type:"GET",
				url:"${context}/nameCheck",
				data:{"name":name},
				dateType:JSON,
				success:function(data){
					
					
				}
			})	
		}
	</script>

</body>
</html>