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

<h2>병원 정보</h2>
		<c:choose>
			<c:when test="${empty hospitals}">
				<p>등록된 병원정보가 없습니다.</p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${hospitals }" var="hospital">
					병원 이름: ${hospital.hospitalName }<br>
					위치: ${hospital.hospitalLoc }<br>
					전화번호: ${hospital.hospitalTel }<br>
					정보: ${hospital.hospitalInfo }<br>
					작성자: ${hospital.name }<br>
					추천: ${hospital.good }<br>
					반대: ${hospital.bad }<br>
					<form>
					<input type="button" id="goodBtn" value="추천 ${hospital.good}" onclick="addGood(${hospital.boardNum})">
					<input type="button" id="badBtn" value="반대 ${hospital.bad}" onclick="addBad(${hospital.boardNum})">
					</form><br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
			
	<script type="text/javascript">
	function addGood(boardNum){
		$.ajax({
			type:"GET",
			url:"${context}/hospitalGood/"+boardNum,
			dateType:JSON,
			success : function(data){
				$('#goodBtn').val("추천 "+JSON.parse(data));
			}
		});
	}
		
	function addBad(boardNum){
		$.ajax({
			type:"GET",
			url:"${context}/hospitalBad/"+boardNum,
			dateType:JSON,
			success : function(data){
				$('#badBtn').val("반대"+JSON.parse(data));
			}
		});
	}
	</script>
</body>
</html>