<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<h2>자유게시판 상세보기</h2>

<table border="1">
	<tr>
		<td rowspan="7">
			<c:choose>
			
				<c:when test="${freeBoard.boardUrl=='null' || empty freeBoard.boardUrl}">
					<img src="<c:url value='/resources/image/noImage.png' />"><br>
				</c:when>
				
				<c:otherwise>
					<img src="<c:url value='/resources/freeBoardImage/${freeBoard.boardUrl }' />" ><br>
				</c:otherwise>
				
			</c:choose>
		</td>
		<td>글 번호 : ${freeBoard.boardNum}</td>
		<th>${freeBoard.boardTitle }</th>
		<td>조회수 : ${freeBoard.viewCount}</td>
	</tr>
	<tr>
		<td>카테고리 : ${freeBoard.boardCategory }</td>
		<td colspan="2">작성일자 : <fmt:formatDate value="${freeBoard.writeDate}" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<td colspan="3">${freeBoard.boardContent}
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<form>
				<input type="button" id="goodBtn" value="추천 ${freeBoard.good}" onclick="addGood(${freeBoard.boardNum})">
				<input type="button" id="badBtn" value="반대 ${freeBoard.bad}" onclick="addBad(${freeBoard.boardNum})">
				<input type="button" id="reportBtn" value="신고 ${freeBoard.report}" onclick="addReport(${freeBoard.boardNum})">
			</form>
			
		</td>
	</tr>
</table>

<table border="1" id="commentTbl">
	<c:if test="${!empty userInfo}">
		<tr>
			<td colspan="3">
				<form>
					<input type="hidden" id="name" value="${userInfo.name}">
					<textarea rows="4" cols="30" id="comment" placeholder="댓글을 입력해 주세요"></textarea>
					<button type="button" onclick="insertComment(${freeBoard.boardNum})">댓글 등록</button>
				</form>
			</td>
		</tr>
	</c:if>
	
	<c:choose>
		<c:when test="${empty freeComments}">
			<tr>
				<td colspan="3">댓글이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${freeComments}" var="freeComment">
				<tr>
					<td>${freeComment.name }</td>
					<td>${freeComment.commentContent }</td>
					<td><fmt:formatDate value="${freeComment.writeDate }" pattern="yyyy-MM-dd"/></td>
				</tr>
			
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr id="addComment"></tr>
</table>


<a href='<c:url value="/freeBoard/freeBoardList/main" />'>목록으로 돌아가기</a>
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
		/* let command = {
				"name":name,
				"commentContent":comment,
				"boardNum":boardNum
		} */
		// 여기부터 내일하기 더이상 모르겠음 ㅋ 위에 3개 묶어서 한번에 에이젝스로 보낸 뒤 댓글 저장하고 해당 댓글 받아와서 html 끼워넣기
		console.log(boardNum);
		console.log(name);
		console.log(comment);
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
				$('#comment').value='';
			}
			
		});
	}

</script>


</html>