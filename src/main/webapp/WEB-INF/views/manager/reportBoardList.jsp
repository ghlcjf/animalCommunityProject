<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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

.table-group-divider-cs {
    border-bottom: 1px solid #96aeea;
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
						<span class="navbar-brand-cs mb-0 h1">?????? ????????? ?????? ?????????</span>
					</div>
				</nav>
	
				<c:choose>
					<c:when test="${empty freeBoard}">
						<p>??????????????? ???????????? ????????????.</p>
					</c:when>
					<c:otherwise>
						<table class="table table-sm">
							<thead class="table-group-divider-cs">
								<tr>
									<th width="70px;">??? ??????</th>
									<th width="300px;">??????</th>
									<th width="70px;">?????????</th>
									<th width="70px;">?????????</th>
									<th width="70px;">?????????</th>
									<th width="70px;">?????????</th>
								</tr>
							</thead>
							<c:forEach items="${freeBoard }" var="freeBoard">
								<tr class="td-button">
									<td>${freeBoard.boardNum}</td>
									<td>${freeBoard.boardTitle}</td>
									<td>${freeBoard.name}</td>
									<td><fmt:formatDate value="${freeBoard.writeDate}" pattern="yyyy-MM-dd"/></td>
									<td style="color:red;"><strong>${freeBoard.report}</strong></td>
									<td>
										<form action="<c:url value='/reportBoardDelete/${freeBoard.boardNum}' />">
											<button class="smBtn" type="submit" onclick="return boardDelete()">??????</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
				
				<div class="d-flex justify-content-start">
					<button type="button" onclick="location.href='<c:url value="/manager/managerMain" />'">????????? ????????? ????????????</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function boardDelete(){
			 return confirm('???????????? ?????? ???????????????????');
		}
	</script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>