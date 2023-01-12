<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>		
	<h2>회원관리</h2>
	
	<form:form action="search" modelAttribute="searchData">
		<form:input path="search" placeholder="검색어를 입력해 주세요"/>
		<button type="submit" onclick="searchMember()">검색</button>
	</form:form>
	
<%-- 	<form>
		<input type="search" id="search">
		<button type="button" onclick="searchMember()">검색</button>
	</form> --%>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
		</tr>
		<c:forEach items="${member}" var="member">
			<tr>
	
				<td><a href="<c:url value='/member/detail/${member.name}' />">${member.name }</a></td>
				<td>${member.id }</td>
				<td>${member.email }</td>
				<td>${member.phone }</td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:url value="/manager/managerMain" />'>이전으로 돌아가기</a>
<script type="text/javascript">
	function searchMember() {
		let search = $('#search').val();
		if(search.length==0){
			alert('검색어를 입력해주세요.');
			return false;
		}
		return true;
	}
</script>
<!-- ajax 실패 -->


<%-- <c:set var="context" value="<%=request.getContextPath() %>"></c:set> 
<script type="text/javascript">
function searchMember() {
	let search = $('#search').val();
	
	console.log(search)
	
	$.ajax({
		type:"GET",
		url:"${context}/search",
		data:{"search":search},
		dateType:JSON,
		success:function(data){
			
			/* for (User user : data){
				console.log(user.name);
			}
			 */
			
			let user = document.getElementById('searchMember');
			let tr = document.createElement('tr');
			tr.innerHTML = null;
			data.forEach((data) => tr.innerHTML = '<td>'+data.name+'</td>');
			data.forEach((data) => tr.innerHTML += '<td>'+data.id+'</td>'); 
			data.forEach((data) => tr.innerHTML += '<td>'+data.email+'</td>'); 
			data.forEach((data) => tr.innerHTML += '<td>'+data.phone+'</td>'); 
			user.appendChild(tr); 
			if(data == null){
				alert('요청하신 정보가 없습니다.')
			}
			
			
		}
	
		
	});
	
} --%>

<!-- </script> -->
</body>
</html>