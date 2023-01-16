<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성하기</title>
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
<h2>공지사항 작성하기</h2>
<form:form action="/animalCommunity/manager/writeNotice" modelAttribute="freeBoardCommand" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<th scope="row">카테고리</th>
			<td>
				<form:select path="boardCategory"  class="form-select">
					<form:option value="공지사항">공지사항</form:option>
				</form:select>
			</td>
		</tr>
		<tr>
			<th scope="row">제목</th>
			<td>
				<form:input path="boardTitle" class="form-control"/>
			</td>
		</tr>
		<tr>
			<th scope="row">이미지</th>
			<td>
				<div class="input-group">
				  <input type="file" id="boardUrl2" name="boardUrl2" class="form-control">
				  <button class="btn btn-outline-secondary" type="button">Button</button>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row">내용</th>
			<td>
				<form:textarea path="boardContent" class="form-control" rows="3"/>
			</td>
		</tr>
	</table>
	<button type="submit" onclick="return insertNoticeCheck()">글 등록</button>
	
</form:form>
</div>

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
		
		let cc = confirm('게시글을 작성하시겠습니까?');
		if(cc){
			alert('작성이 완료되었습니다.');
			return cc;
		}
		return false;
	}

</script>
</html>