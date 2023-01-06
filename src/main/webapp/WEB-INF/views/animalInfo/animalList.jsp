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
	<c:forEach items="${animals}" var="animal">
			<a href="<c:url value='/animal/detail/${animal.animalNum }' />"> ${animal.animalUrl }</a>
			${animal.animalTitle}<br>
	</c:forEach>
</body>
</html>