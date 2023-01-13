<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
	a {
	text-decoration: none;
}
</style>

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<h2>병원 정보</h2>
	<a href='<c:url value="/hospitalInfo/seoul"/>'>서울</a>
	<a href='<c:url value="/hospitalInfo/gyeonggi"/>'>경기도</a>
	<a href='<c:url value="/hospitalInfo/gangwon"/>'>강원도</a>
	<a href='<c:url value="/hospitalInfo/chungcheong"/>'>충청도</a>
	<a href='<c:url value="/hospitalInfo/gyeongsang"/>'>경상도</a>
	<a href='<c:url value="/hospitalInfo/jeolla"/>'>전라도</a>
	<a href='<c:url value="/hospitalInfo/jeju"/>'>제주도</a>
	<a href='<c:url value="/hospitalInfo/main" />'>전체 보기</a>

	<c:choose>
		<c:when test="${empty hospitals}">
			<p>등록된 병원정보가 없습니다.</p>
		</c:when>
		<c:otherwise>
		<table class="table">
			<thead>
    			<tr>
	    			<th scope="col">#</th>
	    			<th scope="col">병원 이름</th>
	    			<th scope="col">병원 위치</th>
	      			<th scope="col">전화 번호</th>
      			</tr>
   			</thead>
			<c:forEach items="${hospitals }" var="hospital">
      			<tbody>
      				<tr>
	     				<th scope="row">${hospital.boardNum }</th>
	     				<td><a href="<c:url value='/hospital/detail/${hospital.boardNum }' />"> ${hospital.hospitalName }</a></td>
	     				<td>${hospital.hospitalLoc }</td>
	     				<td>${hospital.hospitalTel }</td>
      				</tr>
      			</tbody>
			</c:forEach>
		</table>
		</c:otherwise>
	</c:choose>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>	
</body>
</html>