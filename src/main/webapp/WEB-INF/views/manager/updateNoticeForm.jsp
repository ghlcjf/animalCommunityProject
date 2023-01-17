<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<h2>공지사항 수정 페이지</h2>

<form:form action="/animalCommunity/manager/updateNotice" modelAttribute="freeBoard" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td rowspan="4">
				<c:choose>
			
				<c:when test="${freeBoard.boardUrl=='null' || empty freeBoard.boardUrl}">
<%-- 					<img src="<spring:url value='/imageFolder/noImage.png' />"><br> --%>
					<img src="/imageFolder/noImage.png"><br>
				</c:when>
				
				<c:otherwise>
					<img src="/imageFolder/freeBoardImage/${freeBoard.boardUrl }" ><br>
				</c:otherwise>
				
			</c:choose>
			</td>
			<td>카테고리</td>
			<td>
				<form:select path="boardCategory">
					<form:option value="공지사항">공지사항</form:option>
				</form:select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<form:input path="boardTitle"/>
				<form:errors path="boardTitle" />
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				이미지 변경을 원할 때만 수정해 주세요!<br>
				<input type="file" id="boardUrl2" name="boardUrl2">
				<input type="hidden" name="originPic" value="${freeBoard.boardUrl}"> 
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<form:textarea path="boardContent"/>
				<form:errors path="boardContent" />
			</td>
		</tr>
	</table>
	<form:hidden path="boardNum"/>
	<button type="submit" onclick="return insertNoticeCheck()">글 등록</button>
	
</form:form>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function insertNoticeCheck() {
		
		if($('#boardTitle').val()==''){
			alert('제목을 입력해 주세요');
			return false;
		}
		if($('#boardContent').val()==0){
			alert('내용을 입력해 주세요');
			return false;
		}
		
		let cc = confirm('게시글을 수정하시겠습니까?');
		if(cc){
			alert('수정이 완료되었습니다.');
			return cc;
		}
		return false;
	}

</script>
</html>