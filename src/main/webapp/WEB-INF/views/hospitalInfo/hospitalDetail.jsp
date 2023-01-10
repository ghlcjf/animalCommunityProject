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
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

		병원 이름: ${hospitals.hospitalName }<br>
		병원 위치: ${hospitals.hospitalLoc }<br>
		전화번호: ${hospitals.hospitalTel }<br>
		병원 정보: ${hospitals.hospitalInfo }<br>
		작성자: ${hospitals.name }<br>
		<form>
		<input type="button" id="goodBtn" value="추천 ${hospitals.good}" onclick="addGood(${hospitals.boardNum})">
		<input type="button" id="badBtn" value="반대 ${hospitals.bad}" onclick="addBad(${hospitals.boardNum})">
		</form><br>
		
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
			
	<script type="text/javascript">
	function addGood(boardNum){
		$.ajax({
			type:"GET",
			url:"${context}/hospitalGood/"+boardNum,
			dateType:JSON,
			success : function(data){
				$('#goodBtn').val("추천" +JSON.parse(data));
			}
		});
	}
		
	function addBad(boardNum){
		$.ajax({
			type:"GET",
			url:"${context}/hospitalBad/"+boardNum,
			dateType:JSON,
			success : function(data){
				$('#badBtn').val("반대" +JSON.parse(data));
			}
		});
	}
	</script>
</body>
</html>