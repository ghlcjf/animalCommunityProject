<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>이미지 수정 페이지</h2>

<form:form action="/animalCommunity/manager/updateImage" modelAttribute="image" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td rowspan="3">
				<img src="/imageFolder/image/${image.imageUrl}" >
			</td>
		</tr>

		<tr>
			<td>이미지</td>
			<td>
				이미지 변경을 원할 때만 수정해 주세요!<br>
				<input type="file" id="imageUrl2" name="imageUrl2">
				<input type="hidden" name="originPic" value="${image.imageUrl}"> 
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<form:textarea path="imageInfo"/>
				<form:errors path="imageInfo" />
			</td>
		</tr>
	</table>
	<form:hidden path="imageNum"/>
	<button type="submit" onclick="return updateImageCheck()">글 등록</button>
	
</form:form>

</body>
<script type="text/javascript">
	function updateImageCheck() {
		
		if($('#imageInfo').val()==0){
			alert('사진 정보를 입력해 주세요');
			return false;
		}
		
		let cc = confirm('이미지를 수정하시겠습니까?');
		if(cc){
			alert('수정이 완료되었습니다.');
			return cc;
		}
		return false;
	}

</script>
</html>