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
</head>
<body>


<h2>자유게시판 수정 페이지</h2>

<form:form action="/animalCommunity/myPage/updateMyBoard" modelAttribute="freeBoard" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td rowspan="4">
				<c:choose>
			
					<c:when test="${freeBoard.boardUrl=='null' || empty freeBoard.boardUrl}">
						<img src="<c:url value='/resources/image/noImage.png' />"><br>
					</c:when>
					
					<c:otherwise>
						<img src="<c:url value='/resources/freeBoardImage/${freeBoard.boardUrl }' />" ><br>
					</c:otherwise>
				
				</c:choose>
			</td>
			<td>카테고리</td>
			<td>
				<form:select path="boardCategory">
					<form:option value="강아지">강아지</form:option>
					<form:option value="고양이">고양이</form:option>
					<form:option value="파충류">파충류</form:option>
					<form:option value="조류">조류</form:option>
					<form:option value="어류">어류</form:option>
					<form:option value="기타">기타</form:option>
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
	<button type="submit" onclick="return updateFreeBoardcheck()">글 등록</button>
	
</form:form>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function updateFreeBoardcheck() {
		
		if($('#boardTitle').val()==''){
			alert('제목을 입력해 주세요');
			return false;
		}
		if($('#boardContent').val()==0){
			alert('내용을 입력해 주세요');
			return false;
		}
		
		let cc = confirm('게시글을 수정하시겠습니까?');
		
		return cc;
	}

</script>
</html>