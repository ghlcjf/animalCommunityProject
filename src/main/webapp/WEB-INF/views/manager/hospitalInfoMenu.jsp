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

<h2>병원 정보 관리자 페이지</h2>
<c:choose>
	<c:when test="${empty hospitalInfoList}">
		<p>게시글이 없습니다.<br>
		   <button type="button" onclick="return insertConfirm()">글 작성</button>
		</p>
	</c:when>
	<c:otherwise>
		<table border="1">
			<tr>
				<td colspan="5">
					<button type="button" onclick="return insertConfirm()">글 작성</button>
				</td>
			</tr>
			<tr>
				<td>글 번호</td>
				<td>병원 이름</td>
				<td>병원 지역</td>
				<td>작성자</td>
				<td>수정/삭제</td>
			</tr>
			<c:forEach items="${hospitalInfoList}" var="hospitalInfo">
				<tr>
					<td>${hospitalInfo.boardNum}</td>
					<td>${hospitalInfo.hospitalName}</td>
					<td>${hospitalInfo.hospitalLoc}</td>
					<td>${hospitalInfo.name}</td>
					<td>
						<button type="button" onclick="return updateConfirm(${hospitalInfo.boardNum})">수정</button>
						<button type="button" onclick="return deleteConfirm(${hospitalInfo.boardNum})">삭제</button>
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
		alert('삭제가 완료되었습니다.');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/delete/hospitalInfo/"+boardNum;
		} 
	}
	
	function updateConfirm(updateNum){
		let boardNum = updateNum;
		let cc = confirm('게시물을 수정하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/updateForm/hospitalInfo/"+boardNum;
		} 
	}
	function insertConfirm(){
		let cc = confirm('게시물을 작성하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/writeForm/hospitalInfo";
		} 
	}
</script>
</html>