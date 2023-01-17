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
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<jsp:include page="../header.jsp"></jsp:include>
<h2>자유게시판 상세보기</h2>

<table border="1">

	<c:if test="${freeBoard.name == userInfo.name }">
		<tr>
			<td colspan="4">
				<form>
					<button type="button" onclick="return updateConfirm(${freeBoard.boardNum})">수정</button>
					<button type="button" onclick="return deleteConfirm(${freeBoard.boardNum})">삭제</button>
				</form>
			</td>
		</tr>
		
	</c:if>
	<tr>
		<td rowspan="7">
			<c:choose>
			
				<c:when test="${freeBoard.boardUrl=='null' || empty freeBoard.boardUrl}">
<%-- 					<img src="<spring:url value='/imageFolder/noImage.png' />"><br> --%>
					<img src="/imageFolder/noImage.png"><br>
				</c:when>
				
				<c:otherwise>
					<img src="/imageFolder/freeBoardImage/${freeBoard.boardUrl }" ><br>
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


<a href='<c:url value="/freeBoard/freeBoardList/main/1/1" />'>목록으로 돌아가기</a>
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
				
				
				let tbl = document.getElementById('commentTbl');
				let cr = document.createElement('tr');
				cr.innerHTML = '<td>'+data.name+'</td>';
				cr.innerHTML += '<td>'+data.commentContent+'</td>';
				cr.innerHTML += '<td>'+data.writeDate+'</td>';
				tbl.appendChild(cr);
				
				
			},
			complete:function(){
				$('#comment').val()='';
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