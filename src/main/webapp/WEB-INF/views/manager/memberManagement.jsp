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

 <style>
 	h2{
 		margin-right:580px;
 	}
 	.form-control-sm{
 		width:300px;
 	}
 	button[type="submit"]{
 		width: 50px; height: 33px; border-radius: 10px;
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

	<div class="d-grid gap-2 col-6 mx-auto">	
		<form:form action="search" modelAttribute="searchData">
			<table class="col">
				<tr>
					<td>
						<h2>회원관리</h2>
					</td>
					<td>
						<form:input path="search" placeholder="검색어를 입력해 주세요" class="form-control form-control-sm"/>
					</td>
					<td>
						<button type="submit" onclick="searchMember()">검색</button>
					</td>
				</tr>
			</table>
		</form:form>
		
		<table class="table">
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
	</div>
	
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
</body>
</html>