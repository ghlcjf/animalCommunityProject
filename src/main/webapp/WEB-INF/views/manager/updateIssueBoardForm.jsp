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
<style>

	button{
	 		width: 200px; height: 50px; border-radius: 10px;
			text-align: center; color: white; font-weight:bolder;
			background: rgb(136, 154, 233);
			background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
			border: none;
			
		}
		
	button:hover{
  			background: rgb(101, 121, 207);
		background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="d-grid gap-2 col-6 mx-auto">
<h2>공지사항 수정 페이지</h2>

<form:form action="/animalCommunity/manager/updateIssueBoard" modelAttribute="issueBoard" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<td colspan="2">
				<c:choose>
					<c:when test="${!empty issueBoard.issueUrl && issueBoard.issueUrl!='null'}">
						<img src="/imageFolder/issueBoardImage/${issueBoard.issueUrl }" class="rounded mx-auto d-block"><br>	
					</c:when>
					<c:otherwise>
						<img src="/imageFolder/noImage.png" class="rounded mx-auto d-block"><br>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td>
				<form:input path="issueTitle" class="form-control"/>
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				이미지 변경을 원할 때만 수정해 주세요!<br>
				<div class="input-group">
				  <input type="file" id="issueUrl2" name="issueUrl2" class="form-control">
				  <button class="btn btn-outline-secondary" type="button">Button</button>
				  <input type="hidden" name="originPic" value="${issueBoard.issueUrl}">
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row">내용</th>
			<td>
				<form:textarea path="issueContent" class="form-control" rows="3"/>
			</td>
		</tr>
	</table>
	<form:hidden path="issueNum"/>
	<button type="button" onclick="return cancel()">취소</button>
	<button type="submit" onclick="return insertIssueBoardCheck()">글 등록</button>
	
</form:form>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
<script type="text/javascript">

	function cancel(){
		if(confirm('수정을 취소 하시겠습니까?')){
			let link = '${context}/boardManagement/issue';
				
			return location.href=link;
		}
		return false;
	}

	function insertIssueBoardCheck() {
		
		if($('#issueTitle').val()==''){
			alert('제목을 입력해 주세요');
			return false;
		}
		if($('#issueContent').val()==0){
			alert('내용을 입력해 주세요');
			return false;
		}
		if($('#issueTitle').val().length>40){
			alert('제목 글자수가 초과되었습니다. ※40자 이하※');
			return false;
		}
				
		if($('#issueContent').val().length>1000){
			alert('내용 글자수가 초과되었습니다. ※1000자 이하※');
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