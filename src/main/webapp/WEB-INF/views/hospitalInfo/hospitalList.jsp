<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
 	  .btn-group{
        margin-top: 50px;
      }
      thead {
        background-color: #dfe6f7;
        color: #808080;
      }
      .table{
        width: 50%;
        margin-top: 50px;
      }
      .btn-cf-primary{
        --bs-btn-color: #808080;
        --bs-btn-border-color: #dfe6f7;
        --bs-btn-hover-color: #dfe6f7;
        --bs-btn-hover-bg: #dfe6f7;
        --bs-btn-hover-border-color: #dfe6f7;
        --bs-btn-focus-shadow-rgb: 13,110,253;
        --bs-btn-active-color: #808080;
        --bs-btn-active-bg: #dfe6f7;
        --bs-btn-active-border-color: #dfe6f7;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #dfe6f7;
        --bs-btn-disabled-bg: transparent;
        --bs-btn-disabled-border-color: #dfe6f7;
        --bs-gradient: none;
      }
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<h2>병원 정보</h2>

	<div class="d-flex justify-content-center">
    <div class="btn-group mx-auto" role="group" aria-label="Basic radio toggle button group">
    
    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="location.href='<c:url value="/hospitalInfo/main" />'">
    <label class="btn btn-cf-primary" for="btnradio1">전체</label>
    
    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="location.href='<c:url value="/hospitalInfo/seoul" />'">
    <label class="btn btn-cf-primary" for="btnradio2">서울</label>
    
    <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" onclick="location.href='<c:url value="/hospitalInfo/gyeonggi" />'">
    <label class="btn btn-cf-primary" for="btnradio3">경기도</label>
    
    <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" onclick="location.href='<c:url value="/hospitalInfo/gangwon" />'">
    <label class="btn btn-cf-primary" for="btnradio4">강원도</label>
    
    <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off" onclick="location.href='<c:url value="/hospitalInfo/chungcheong" />'">
    <label class="btn btn-cf-primary" for="btnradio5">충청도</label>
    
    <input type="radio" class="btn-check" name="btnradio" id="btnradio6" autocomplete="off" onclick="location.href='<c:url value="/hospitalInfo/gyeongsang" />'">
    <label class="btn btn-cf-primary" for="btnradio6">경상도</label>
    
    <input type="radio" class="btn-check" name="btnradio" id="btnradio7" autocomplete="off" onclick="location.href='<c:url value="/hospitalInfo/jeolla" />'">
    <label class="btn btn-cf-primary" for="btnradio7">전라도</label>
    
    <input type="radio" class="btn-check" name="btnradio" id="btnradio8" autocomplete="off" onclick="location.href='<c:url value="/hospitalInfo/jeju" />'">
    <label class="btn btn-cf-primary" for="btnradio8">제주도</label>
    
	</div>
	</div>

	<c:choose>
		<c:when test="${empty hospitals}">
			<p>등록된 병원정보가 없습니다.</p>
		</c:when>
		<c:otherwise>
		<table class="table mx-auto">
			<thead>
    			<tr>
	    			<th scope="col">번호</th>
	    			<th scope="col">병원</th>
	    			<th scope="col">위치</th>
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