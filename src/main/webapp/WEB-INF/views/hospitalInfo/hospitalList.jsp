<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					반대: ${hospital.bad }<br><br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
</body>
</html>