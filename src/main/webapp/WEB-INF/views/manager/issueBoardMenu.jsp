<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<h2>이슈 게시판 관리자 페이지</h2>


<h2>이슈 게시판 관리자 페이지</h2>

<c:choose>
	<c:when test="${empty issueBoardList}">
		<p>게시글이 없습니다.<br>
			<button type="button" onclick="return insertConfirm()">글 작성</button>
		</p>
	</c:when>
	<c:otherwise>
		<table border="1">
			<tr>
				<td colspan="4">
					<button type="button" onclick="return insertConfirm()">글 작성</button>
				</td>
			</tr>
			<tr>
				<td>글 번호</td>
				<td>글 제목</td>
				<td>작성자</td>
				<td>수정/삭제</td>
			</tr>
			<c:forEach items="${issueBoardList}" var="issueBoard">

				<tr>
					<td>${issueBoard.issueNum}</td>
					<td>${issueBoard.issueTitle}</td>
					<td>${issueBoard.name}</td>
					<td>
						<button type="button" onclick="return updateConfirm(${issueBoard.issueNum})">수정</button>
						<button type="button" onclick="return deleteConfirm(${issueBoard.issueNum})">삭제</button>

					</td>
				</tr>
			</c:forEach>
		</table>
	</c:otherwise>

</c:choose>
<a href='<c:url value="/manager/managerMain" />'>관리자 메인페이지로 돌아가기</a>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function deleteConfirm(deleteNum){
		let boardNum = deleteNum;
		let cc = confirm('게시물을 삭제하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			alert('삭제가 완료되었습니다.');
			location.href="/animalCommunity/manager/delete/issue/"+boardNum;
		} 
	}
	
	function updateConfirm(updateNum){
		let boardNum = updateNum;
		let cc = confirm('게시물을 수정하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/updateForm/issue/"+boardNum;
		} 
	}
	function insertConfirm(){
		let cc = confirm('게시물을 작성하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/manager/writeForm/issue";
		} 
	}
</script>
</html>