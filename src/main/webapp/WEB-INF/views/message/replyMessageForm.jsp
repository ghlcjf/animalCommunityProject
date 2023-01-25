<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
.navbar {
	margin-top: 15px;
	background-color: #dfe6f7;
	border-top: 1px solid #96aeea;
	border-bottom: 1px solid #96aeea;
}

.navbar-brand-cs {
	padding-top: 0.3rem;
	padding-bottom: 0.3rem;
	margin-right: var(- -bs-navbar-brand-margin-end);
	font-size: 1.1rem;
	font-weight: bold;
	color: #808080;
	text-decoration: none;
	white-space: nowrap;
	margin-left: 10px;
}
button{
		padding: 5px;   border: none;
		height: 30px; 	border-radius: 10px;
		color: white;   font-weight:bolder;
		background: rgb(136, 154, 233);
		background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
		line-height: 10px;
		
	}
button:hover{
 			background: rgb(101, 121, 207);
	background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
}

</style>
</head>
<body>

<div class="container text-center">
	<form:form modelAttribute="message">
		<nav class="navbar">
			<div class="container-fluid">
				<span class="navbar-brand-cs mb-0 h1">메세지 답장</span>
			</div>
		</nav>
		<table class="table table-sm">
			<tr>
				<th>to</th>
				<td>
					${message.senderName }
					<form:hidden path="senderName"/>
					<!-- 보낸 사람 : 받을 사람 -->
				</td>
			</tr>
			<tr>
				<th>message</th>
				<td>${message.messageContent}</td>
			</tr>
			<tr>
				<th>from</th>
				<td>
					${message.receiverName}
					<form:hidden path="receiverName"/>
					<!-- 받은 사람 : 보낼 사람  -->
				</td>
			</tr>
			<tr>
				<th>content</th>
				<td>
					<textarea rows="6" cols="30" id="content" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="messageSend()">전송</button>
				</td>
			</tr>
		</table>
	</form:form>
</div>

</body>
<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
<script type="text/javascript">
	function messageSend(){
		let content = $('#content').val();
		let senderName = $('#receiverName').val();
		let receiverName = $('#senderName').val();
		
		if(content.length==0){
			alert('메세지를 입력해 주세요.');
			return false;
		}
		if(content.length>500){
			alert('메세지 글자수가 초과되었습니다. ※500자 이하※');
			return false;
		}
		
		
		$.ajax({
			type:"GET",	
			url:"${context}/messenger/sendMessage",
			data:{
				"senderName":senderName,
				"receiverName":receiverName,
				"content":content
			},
			dateType:JSON,
			success : function(data){
				alert('전송이 완료되었습니다.');
				opener.location.reload();
				self.close();
				
				
				
			}
			
		});
		
		
		
		
	}
</script>
</html>