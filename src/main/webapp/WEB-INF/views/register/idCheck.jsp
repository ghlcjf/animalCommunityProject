<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h2>아이디 중복 체크</h2>
	<form action="/idCheck" method="GET" id="frm">
		아이디 : <input type="text" name="id" id="id" value="${id}">
		<button type="button" onclick="idCheck()">중복 체크</button><br>	
	</form>
	<div id="result">
	</div>
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript">
		function idCheck() {
			let id = document.getElementById('id').value;
			let btn = '<button type="button" onclick="newId()">사용</button>'
			
			$.ajax({
				type:"GET",
				url:"${context}/idCheck",
				data:{"id":id},
				dateType:JSON,
				success:function(data){
					
					if(data=="사용가능한 아이디 입니다."){
						$("#result").html(data+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+btn);
					}else{
						$("#result").html(data+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
					}
					/* console.log(btn);
					console.log(data);
					$("#result").html(data+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+btn); */
				}
			})	
		}
		
		function newId(){
			let idBtnCheck = 'y';
			let newId = document.getElementById('id').value;
			
			opener.frm.id.value = newId;
			opener.frm.idBtnCheck.value = idBtnCheck;
			
			self.close();
		}
	</script>

</body>
</html>