<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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