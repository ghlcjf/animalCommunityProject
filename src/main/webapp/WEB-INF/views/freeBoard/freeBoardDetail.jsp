<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %> 
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
	 		border-radius: 10px;
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
	<h2>자유게시판 상세보기</h2>
	<table class="table">
		<c:if test="${freeBoard.name == userInfo.name }">
			<tr>
				<td  colspan="8">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  <button class="btn btn-primary me-md-2" type="button" onclick="return updateConfirm(${freeBoard.boardNum})">수정</button>
					  <button class="btn btn-primary" type="button" onclick="return deleteConfirm(${freeBoard.boardNum})">삭제</button>
					</div>
				</td>
			</tr>
		</c:if>
		<tr>
			<th>글 번호</th>
			<td>${freeBoard.boardNum}</td>
			<th>글 제목</th>
			<td colspan="5">${freeBoard.boardTitle}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td> ${freeBoard.name}</td>
			<th>작성일</th>
			<td><fmt:formatDate value="${freeBoard.writeDate}" pattern="yyyy-MM-dd"/></td>
			<th>조회수</th>
			<td>${freeBoard.viewCount}</td>
			<th>카테고리</th>
			<td>${freeBoard.boardCategory } </td>
		</tr>
		<tr>
			<td colspan="8">
				<c:if test="${!empty freeBoard.boardUrl && freeBoard.boardUrl!='null'}">
					<img src="/imageFolder/freeBoardImage/${freeBoard.boardUrl }" class="rounded mx-auto d-block" ><br>
				</c:if>
				${freeBoard.boardContent}
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<form>
					<input class="btn btn-primary" type="button" id="goodBtn" value="추천 ${freeBoard.good}" onclick="addGood(${freeBoard.boardNum})">
					<input class="btn btn-primary" type="button" id="badBtn" value="반대 ${freeBoard.bad}" onclick="addBad(${freeBoard.boardNum})">
					<input class="btn btn-primary" type="button" id="reportBtn" value="신고 ${freeBoard.report}" onclick="addReport(${freeBoard.boardNum})">
				</form>
			</td>
		</tr>
	</table>
	<table id="commentTbl" class="table">
		<c:if test="${!empty userInfo}">
			<tr>
				<td colspan="3">
					<form>
						<div class="input-group mb-3">
							<input type="hidden" id="name" value="${userInfo.name}">
							<input type="text" id="comment" class="form-control" placeholder="댓글을 입력해 주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="insertComment(${freeBoard.boardNum})">댓글 등록</button>
						</div>
					</form>
				</td>
			</tr>
		</c:if>
		<c:forEach items="${freeComments}" var="freeComment">
			<tr>
				<td>${freeComment.name }</td>
				<td>${freeComment.commentContent }</td>
				<td><fmt:formatDate value="${freeComment.writeDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		
		</c:forEach>

		<tr id="addComment"></tr>
	</table>
	
	
	
	<a href='<c:url value="/freeBoard/freeBoardList/main/1/1" />'>목록으로 돌아가기</a>
	
	</div>
	






</body>

<c:set var="context" value="<%=request.getContextPath() %>"></c:set>

<script type="text/javascript">
	function addGood(boardNum){ // XMLHttpRequest 객체
		$.ajax({
			type:"GET",						// 전송 방식
			url:"${context}/good/"+boardNum,			// 어디로? 서블릿 '매핑 주소'
			dateType:JSON,
			success : function(data){
				$('#goodBtn').val("추천 "+JSON.parse(data));
			}
			
		});
	
	}
	function addBad(boardNum){ // XMLHttpRequest 객체
		$.ajax({
			type:"GET",						// 전송 방식
			url:"${context}/bad/"+boardNum,			// 어디로? 서블릿 '매핑 주소'
			dateType:JSON,
			success : function(data){
				$('#badBtn').val("반대 "+JSON.parse(data));
			}
			
		});
	
	}
	function addReport(boardNum){ // XMLHttpRequest 객체
		$.ajax({
			type:"GET",						// 전송 방식
			url:"${context}/report/"+boardNum,			// 어디로? 서블릿 '매핑 주소'
			dateType:JSON,
			success : function(data){
				$('#reportBtn').val("신고 "+JSON.parse(data));
			}
			
		});
	
	}
	
	function insertComment(num) {
		let boardNum = num;
		let name = $('#name').val(); 
		let comment = $('#comment').val();
		if(comment==null || comment.length==0){
			alert('댓글을 입력해 주세요');
			return;
		}
		
		$.ajax({
			type:"GET",
			url:"${context}/insertComment",
			data:{
				"name":name,
				"commentContent":comment,
				"boardNum":boardNum
			},
			dateType:JSON,
			success:function(data){
				
				
				let tbl = document.getElementById('commentTbl');
				let cr = document.createElement('tr');
				cr.innerHTML = '<td>'+data.name+'</td>';
				cr.innerHTML += '<td>'+data.commentContent+'</td>';
				cr.innerHTML += '<td>'+data.writeDate+'</td>';
				tbl.appendChild(cr);
				
				
			},
			complete:function(){
				document.getElementById('comment').value='';
			}
			
		});
	}
	function deleteConfirm(deleteNum){
		let boardNum = deleteNum;
		let cc = confirm('게시물을 삭제하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			alert('삭제가 완료되었습니다.');
			location.href="/animalCommunity/freeBoard/deleteFreeBoard/"+boardNum;
		} 
	}
	
	function updateConfirm(updateNum){
		let boardNum = updateNum;
		let cc = confirm('게시물을 수정하시겠습니까?');
		if(cc==false){
			return false;
		}else{
			location.href="/animalCommunity/freeBoard/updateFreeBoardForm/"+boardNum;
		} 
	}

</script>


</html>