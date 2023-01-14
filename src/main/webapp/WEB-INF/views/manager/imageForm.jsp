<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>	
<h2>이미지 업로드</h2>

<form:form action="/animalCommunity/manager/writeImage" modelAttribute="imageCommand" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>이미지</td>
			<td>
				<input type="file" id="imageUrl2" name="imageUrl2">
				<form:errors path="imageUrl" />
			</td>
		</tr>
		<tr>
			<td>이미지 정보</td>
			<td>
				<form:textarea path="imageInfo"/>
				<form:errors path="imageInfo" />
			</td>
		</tr>
	</table>
	<button type="submit" onclick="return insertImageCheck()">이미지 업로드</button>
	
</form:form>


</body>
<script type="text/javascript">
	function insertImageCheck() {
		
		if($('#imageUrl2').val()==''){
			alert('사진을 등록해 주세요');
			return false;
		}
		if($('#imageInfo').val()==0){
			alert('정보를 입력해 주세요');
			return false;
		}
		let cc = confirm('이미지를 업로드하시겠습니까?');
		if(cc){
			alert('작성이 완료되었습니다.');
			return cc;
		}
		return false;
	}

</script>
</html>