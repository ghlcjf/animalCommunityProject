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
<h2>이미지 관리 페이지</h2>
<c:choose>
	<c:when test="${empty imageList}">
		<p>
			등록한 배너 이미지가 없습니다.<br>
			<button type="button" onclick="return insertConfirm()">이미지 업로드</button>	
		</p>
	</c:when>
	
	<c:otherwise>
		<table border="1">
			<tr>
				<td colspan="5">
					<button type="button" onclick="return insertConfirm()">이미지 업로드</button>
				</td>
			</tr>
			<tr>
				<td>사진 번호</td>
				<td>사진 이름</td>
				<td>사진 정보</td>
				<td>수정/삭제</td>
			</tr>
			<c:forEach items="${imageList}" var="image">
				<tr>
					<td>${image.imageNum}</td>
					<td>${image.imageUrl}</td>
					<td>${image.imageInfo}</td>
					<td>
						<button type="button" onclick="return updateConfirm(${image.imageNum})">수정</button>
						<button type="button" onclick="return deleteConfirm(${image.imageNum})">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:otherwise>

</c:choose>
<a href='<c:url value="/manager/managerMain" />'>관리자 메인페이지로 돌아가기</a>
</body>
<script type="text/javascript">
	function deleteConfirm(deleteNum){
		let boardNum = deleteNum;
		let cc = confirm('게시물을 삭제하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			alert('삭제가 완료되었습니다.');
			location.href="/animalCommunity/manager/delete/image/"+boardNum;
		} 
	}
	
	function updateConfirm(updateNum){
		let boardNum = updateNum;
		let cc = confirm('게시물을 수정하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/updateForm/image/"+boardNum;
		} 
	}
	function insertConfirm(){
		let cc = confirm('게시물을 작성하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity//manager/writeForm/image";
		} 
	}
</script>
</html>