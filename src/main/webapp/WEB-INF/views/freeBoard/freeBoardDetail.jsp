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
	.container{
	margin-top: 20px;
}
	button{
	padding: 5px;   border: none;
	height: 40px; 	border-radius: 10px;
	width: 95px;
	color: white;   font-weight:bolder;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
	
}
button:hover{
	background: rgb(101, 121, 207);
	background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
}


.bigBtn{
		padding: 5px;   border: none;
		height: 30px; 	border-radius: 10px;
		color: white;   font-weight:bolder;
		width: 145px;
		background: rgb(136, 154, 233);
		background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
		line-height: 10px;
		
	}
.bigBtn:hover{
  			background: rgb(101, 121, 207);
		background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	}
	img{
		width:100%;
		height:500px;
	}
	.messageBtn{
		color:black;
		margin:auto;
		position: relative;
	}
	.messageBtn:hover{
		color:rgb(101, 121, 207);
	}
	.bi{
		position:absolute;
		left:3px;
		bottom:-1px;
	}
</style>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container">
        <div class="row">
          <div class="col-8 mx-auto">

	<table class="table">
		<c:if test="${freeBoard.name == userInfo.name }">
			<tr>
				<td colspan="8">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  <button type="button" onclick="return updateConfirm(${freeBoard.boardNum})">수정</button>
					  <button type="button" onclick="return deleteConfirm(${freeBoard.boardNum})">삭제</button>
					</div>
				</td>
			</tr>
		</c:if>
		<tr>
			<th>글 번호</th>
			<td>${freeBoard.boardNum}</td>
			<th>글 제목</th>
			<td colspan="5" width="100px" style="word-break:break-all">${freeBoard.boardTitle}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td> 
				${freeBoard.name}
				<c:if test="${freeBoard.name!=userInfo.name}">
					<input type="hidden" id="receiverName" value="${freeBoard.name}">
					<a class="messageBtn" href="#" onclick="sendMessage(); return false;">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
						  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
						</svg>
					</a>
				</c:if>
				
			</td>
			<th>작성일</th>
			<td><fmt:formatDate value="${freeBoard.writeDate}" pattern="yyyy-MM-dd"/></td>
			<th>조회수</th>
			<td>${freeBoard.viewCount}</td>
			<th>카테고리</th>
			<td>${freeBoard.boardCategory } </td>
		</tr>
		<tr>
			<td colspan="8" style ="word-break: break-all">
				<c:if test="${!empty freeBoard.boardUrl && freeBoard.boardUrl!='null'}">
					<img src="/imageFolder/freeBoardImage/${freeBoard.boardUrl }" class="rounded mx-auto d-block" ><br>
				</c:if>
				${freeBoard.boardContent}
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<form>
					<input class="btn btn-success" type="button" id="goodBtn" value="추천 ${freeBoard.good}" onclick="addGood(${freeBoard.boardNum})">
					<input class="btn btn-danger" type="button" id="badBtn" value="반대 ${freeBoard.bad}" onclick="addBad(${freeBoard.boardNum})">
					<input class="btn btn-warning" type="button" id="reportBtn" value="신고 ${freeBoard.report}" onclick="addReport(${freeBoard.boardNum})">
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
							<button type="button" id="button-addon2" onclick="insertComment(${freeBoard.boardNum})">댓글 등록</button>
						</div>
					</form>
				</td>
			</tr>
		</c:if>
		<c:forEach items="${freeComments}" var="freeComment">
			<tr>
				<td width="130px">
					${freeComment.name }
					<c:if test="${freeComment.name!=userInfo.name}">
						<input type="hidden" id="receiverNameCmt" value="${freeComment.name}">
						<a class="messageBtn" href="#" onclick="sendMessageCmt(); return false;">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
							  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
							</svg>
						</a>
					</c:if>
				</td>
				<td style = "word-break: break-all">${freeComment.commentContent }</td>
				<td width="130px"><fmt:formatDate value="${freeComment.writeDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="d-flex justify-content-start">
		<button type="button" class="bigBtn" onclick="location.href='<c:url value="/freeBoard/freeBoardList/main/1/1" />'">목록으로 돌아가기</button>
		</div>
	
	</div>
	</div>
	</div>

<jsp:include page="../footer.jsp"></jsp:include>

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
				
				let commentTbl = document.getElementById('commentTbl');
				let tr = $('<tr></tr>').appendTo(commentTbl);
				
				$('<td></td>').html(data.name).appendTo(tr);
				/* $('<td></td>').html(data.commentContent).appendTo(tr); */
				$('<td width="700px;" style = "word-break: break-all"></td>').html(data.commentContent).appendTo(tr);
				$('<td></td>').html(data.writeDate).appendTo(tr);
				
				
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
	
	function sendMessage(){
		let receiverName = $('#receiverName').val();
		let senderName = $('#name').val();
		
		let cc = confirm(receiverName+'님에게 메세지를 보내시겠습니까?');
		if(cc){
			
			let url = "${context}/message/sendForm/"+receiverName;
			window.open(url,'_blank_1','toolbar=no, menubar=no,scrollbars=yes, resizeable=no, width=450, height=200');
		}
		return false;
	}
	
	function sendMessageCmt(){
		let receiverName = $('#receiverNameCmt').val();
		let senderName = $('#name').val();
		if(receiverName==senderName){
			alert('자신에게 메세지를 보낼 수 없습니다.');
			return false;
		}
		let cc = confirm(receiverName+'님에게 메세지를 보내시겠습니까?');
		if(cc){
			
			let url = "${context}/message/sendForm/"+receiverName;
			window.open(url,'_blank_1','toolbar=no, menubar=no,scrollbars=yes, resizeable=no, width=450, height=200');
		}
		return false;
	}
	

</script>


</html>