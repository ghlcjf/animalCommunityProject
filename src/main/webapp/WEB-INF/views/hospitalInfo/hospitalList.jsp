<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<a href='<c:url value="/hospitalInfo/jeju"/>'>제주도</a><br><br>

	<c:choose>
		<c:when test="${empty hospitals}">
			<p>등록된 병원정보가 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach items="${hospitals }" var="hospital">
				<a href="<c:url value='/hospital/detail/${hospital.boardNum }' />"> ${hospital.hospitalName }<br></a>
				병원 위치: ${hospital.hospitalLoc }<br>
				전화번호: ${hospital.hospitalTel }<br>
			</c:forEach>
		</c:otherwise>
	</c:choose><br>
	
	<a href='<c:url value="/hospitalInfo/main" />'>전체 보기</a>
</body>
</html>