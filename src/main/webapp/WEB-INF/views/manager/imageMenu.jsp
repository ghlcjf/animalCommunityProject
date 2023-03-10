<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
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

table {
	table-layout: fixed
}

.table {
	margin-top: 10px;
}

th {
    font-weight: normal;
}

td {
	overflow:hidden; white-space:nowrap; text-overflow:ellipsis;
}

.table-group-divider-cs {
    border-bottom: 1px solid #96aeea;
}

a {
	text-decoration: none;
	color: black;
}

button {
	padding: 5px;   border: none;
	height: 30px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
}

button:hover {
	background: rgb(101, 121, 207);
	background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
}

.smBtn {
	padding: 5px;   border: none;
	height: 24px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
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
						<span class="navbar-brand-cs mb-0 h1">?????? ?????? ?????????</span>
							<div class="d-flex justify-content-end">
								<button type="button" onclick="return insertConfirm()">????????? ?????????</button>
							</div>
						</div>
					</nav>

				<c:choose>
					<c:when test="${empty imageList}">
						<p>???????????? ????????????.</p>
					</c:when>
					<c:otherwise>
						<table class="table table-sm">
							<thead class="table-group-divider-cs">
							   <tr>
								    <th scope="col" width="70px;">?????? ??????</th>
								    <th scope="col" width="100px;">?????? ??????</th>
								    <th scope="col" width="300px;">?????? ??????</th>
								    <th scope="col" width="70px;">??????/??????</th>
							   </tr>
						 	</thead>
				 			<tbody>
							 	<c:forEach items="${imageList}" var="image">
							  		<tr>
										<th scope="row">${image.imageNum}</th>
										<td>${image.imageUrl}</td>
										<td>${image.imageInfo}</td>
										<td>
											<button class="smBtn" type="button" onclick="return updateConfirm(${image.imageNum})">??????</button>
											<button class="smBtn" type="button" onclick="return deleteConfirm(${image.imageNum})">??????</button>
										</td>
								  	</tr>
							    </c:forEach>
				  			</tbody>
						 </table>
				 	</c:otherwise>
				</c:choose>
			
				<div class="d-flex justify-content-start">
					<button type="button" onclick="location.href='<c:url value="/manager/managerMain" />'">????????? ????????? ????????????</button>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function deleteConfirm(deleteNum){
		let boardNum = deleteNum;
		let cc = confirm('???????????? ?????????????????????????');
		if(cc==false){
			return false;
		}else{
			alert('????????? ?????????????????????.');
			location.href="/animalCommunity/manager/delete/image/"+boardNum;
		} 
	}
	
	function updateConfirm(updateNum){
		let boardNum = updateNum;
		let cc = confirm('???????????? ?????????????????????????');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/updateForm/image/"+boardNum;
		} 
	}
	function insertConfirm(){
		let cc = confirm('???????????? ????????? ???????????????????');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity//manager/writeForm/image";
		} 
	}
</script>
</html>