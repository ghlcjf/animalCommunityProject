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
 .navbar {
	margin-top: 15px;
	width: 100%;
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
table {
	table-layout: fixed
}

.table {
	margin-top: 30px;
}

thead {
	background-color: #dfe6f7;
}

th {
     font-weight: normal;
}

td {
overflow:hidden; white-space:nowrap; text-overflow:ellipsis;
}

a {
	text-decoration: none;
	color: black;
}
 	h2{
 		margin-right:580px;
 	}
 	.form-control-sm{
 		width:300px;
 	}
 	button{
		padding: 5px;   border: none;
		height: 30px; 	border-radius: 10px;
		color: white;   font-weight:bolder;
		background: rgb(136, 154, 233);
		background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
		margin-left: 10px;
		line-height: 10px;
	}
	button:hover{
  			background: rgb(101, 121, 207);
		background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	}
 </style>

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>	
	
	<div class="container text-center">
        <div class="row">
 <div class="col-10 mx-auto">	
 <nav class="navbar">
		<div class="container-fluid">
			<span class="navbar-brand-cs mb-0 h1">회원 관리 페이지</span>
			<form:form action="search" modelAttribute="searchData">
			<div class="d-flex align-items-end justify-content-end">
						<form:input path="search" placeholder="검색어를 입력해 주세요" class="form-control form-control-sm"/>
						<button type="submit" onclick="searchMember()">검색</button>
						</div>
						</form:form>
		</div>
	</nav>


		<form:form action="search" modelAttribute="searchData">

		</form:form>
		
		<table class="table table-hover table-sm">
		<thead>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>전화번호</th>
			</tr>

			</thead>
			<c:forEach items="${member}" var="member">			
				<tr>		
					<td style="cursor: pointer;" onclick="location.href='<c:url value='/member/detail/${member.name}' />'"> ${member.name }</td>
					<td style="cursor: pointer;" onclick="location.href='<c:url value='/member/detail/${member.name}' />'"> ${member.id }</td>
					<td>${member.email }</td>
					<td>${member.phone }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="d-flex justify-content-start">
		<button type="button" onclick="location.href='<c:url value="/manager/managerMain" />'">관리자 메뉴로 돌아가기</button>
		</div>
	</div>
          </div>
          </div>
          <jsp:include page="../footer.jsp"></jsp:include>
	
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