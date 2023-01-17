<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<h2>메세지</h2>

<!-- 전체 메세지 컨테이너 -->
<div id="massageContainer">


	<!-- 메세지 목록 리스트 -->
	<div>
	
	
	</div>
	
	
	<div>
		<div>
			<!-- 메세지 내용 공간 -->
		</div>
		
		<div>
			<!-- 메세지 입력 공간 -->
		</div>
	</div>
	
	
</div>

</body>
<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
<script>
	
	const FirstMessageList = function(){
		$.ajax({
			type:"GET",						
			url:"${context}/messenger/list",	
			data:{
				
			},
			success : function(data){
				console.log("연결 성공");
				
			}
		})
	}
	
	
	
	
	$(document).ready(function(){
		// 메세지 리스트 리로드
		FirstMessageList();
	});
</script>
</html>