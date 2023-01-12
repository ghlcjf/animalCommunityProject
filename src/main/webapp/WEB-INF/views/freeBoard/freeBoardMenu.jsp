<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
</head>



<div>
	<ul>
		<li><a href="<c:url value='/freeBoard/freeBoardList/main' />">전체 보기</a></li>
		<li><a href="<c:url value='/freeBoard/freeBoardList/dog' />">강아지</a></li>
		<li><a href="<c:url value='/freeBoard/freeBoardList/cat' />">고양이</a></li>
		<li><a href="<c:url value='/freeBoard/freeBoardList/reptile' />">파충류</a></li>
		<li><a href="<c:url value='/freeBoard/freeBoardList/birds' />">조류</a></li>
		<li><a href="<c:url value='/freeBoard/freeBoardList/fish' />">어류</a></li>
		<li><a href="<c:url value='/freeBoard/freeBoardList/other' />">기타</a></li>
	</ul>
</div>