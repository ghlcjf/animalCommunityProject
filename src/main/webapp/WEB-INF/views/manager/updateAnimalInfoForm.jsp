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

<h2>동물 소개 수정 페이지</h2>

<form:form action="/animalCommunity/manager/updateAnimalInfo" modelAttribute="animalInfo" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td rowspan="4">
				<c:choose>
					<c:when test="${animalInfo.animalUrl=='null' || empty animalInfo.animalUrl}">
						<img src="<c:url value='/resources/image/noImage.png' />"><br>
					</c:when>
					
					<c:otherwise>
						<img src="<c:url value='/resources/freeBoardImage/${animalInfo.animalUrl }' />" ><br>
					</c:otherwise>
				
				</c:choose>
			</td>
			<td>카테고리</td>
			<td>
				<form:select path="animalCategory">
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
				<form:input path="animalTitle"/>
				<form:errors path="animalTitle" />
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				이미지 변경을 원할 때만 수정해 주세요!<br>
				<input type="file" id="animalUrl2" name="animalUrl2">
				<input type="hidden" name="originPic" value="${animalInfo.animalUrl}"> 
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<form:textarea path="animalContent"/>
				<form:errors path="animalContent" />
			</td>
		</tr>
	</table>
	<form:hidden path="animalNum"/>
	<button type="submit" onclick="return insertAnimalInfoCheck()">글 등록</button>
	
</form:form>

</body>
<script type="text/javascript">
	function insertAnimalInfoCheck() {
		
		if($('#animalTitle').val()==''){
			alert('제목을 입력해 주세요');
			return false;
		}
		if($('#animalContent').val()==0){
			alert('내용을 입력해 주세요');
			return false;
		}
		
		let cc = confirm('게시글을 작성하시겠습니까?');
		
		return cc;
	}

</script>
</html>