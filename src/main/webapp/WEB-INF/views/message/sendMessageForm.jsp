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
</head>
<body>
<h2>메세지 보내기</h2>
<form:form modelAttribute="message">
	
	<table>
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
				<input type="text" id="content" name="content">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="messageSend()">전송</button>
			</td>
		</tr>
	</table>
</form:form>


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