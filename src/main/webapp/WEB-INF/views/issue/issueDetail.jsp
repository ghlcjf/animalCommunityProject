<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div>
	<h2>${issue.issueTitle}</h2>
</div>
<hr>
<div>
	작성자 : ${issue.name} 작성일 : <fmt:formatDate value="${issue.writeDate}" pattern="yyyy-MM-dd"/> 조회수 : ${issue.viewCount} 
</div>
<hr>
<div>
	<c:if test="${!empty issue.issueUrl }">
		<img src="/imageFolder/issueBoardImage/${issue.issueUrl }" ><br>
	</c:if>
	${issue.issueContent}
</div>
<hr>

<table border="1" id="commentTbl">
	<c:if test="${!empty userInfo}">
		<tr>
			<td colspan="3">
				<form>
					<input type="hidden" id="name" value="${userInfo.name}">
					<textarea rows="4" cols="30" id="commentContent" placeholder="댓글을 입력해 주세요"></textarea>
					<button type="button" onclick="insertComment(${issue.issueNum})">댓글 등록</button>
				</form>
			</td>
		</tr>
	</c:if>		
	<c:choose>
		<c:when test="${empty issueComment}">
			<tr>
				<td colspan="3">댓글이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${issueComment}" var="issueComment">
				<tr>
					<td>${issueComment.name }</td>
					<td>${issueComment.commentContent }</td>
					<td><fmt:formatDate value="${issueComment.writeDate }" pattern="yyyy-MM-dd"/></td>
				</tr>
			
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<%-- <form action="comment">
	<label>
		<input type="hidden" id="name" value="홍길동">
	</label>
	<label> 댓글 :
		<textarea rows="5" cols="50" id="commentContent"></textarea> 
	</label>
	<button type="button" onclick="insertComment(${issue.issueNum})">등록</button>
</form>
<hr>
<c:choose>
	<c:when test="${empty issueComment}">
		<tr>
			<td colspan="3">댓글이 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${issueComment}" var="issueComment">
			<tr>
				<td>${issueComment.name }</td>
				<td>${issueComment.commentContent }</td>
				<td><fmt:formatDate value="${issueComment.writeDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
		
		</c:forEach>
	</c:otherwise>
</c:choose> --%>
<%-- <c:forEach items="${issueComment}" var="comment" varStatus="b">
	<tr>
		<td>${comment.name}</td>
		<td>${comment.commentContent}</td>
		<td><fmt:formatDate value="${comment.writeDate}" pattern="yyyy-MM-dd"/></td><br>
	</tr>

</c:forEach> --%>

<c:set var="context" value="<%=request.getContextPath() %>"></c:set> 

<script type="text/javascript">


/* function insertComment(Num) {
	let commentContent = $('#commentContent').val();
	let name = $('#name').val();
	let boardNum = Num;
	
	console.log(commentContent);
	console.log(name);
	console.log(boardNum);
	
	$.ajax({
		type:"POST",
		url:"${context}/comment",
		data:{"commentContent":commentContent,
			  "name":name,
		 	  "boardNum":boardNum
		},
		dataType:JSON,
		success:function(data){
			
		}

	}); */
function insertComment(num) {
	let boardNum = num;
	let name = $('#name').val(); 
	let comment = $('#commentContent').val();
	if(comment==null || comment.length==0){
		alert('댓글을 입력해 주세요');
		return;
	}
	
	console.log(boardNum);
	console.log(name);
	console.log(comment);
	$.ajax({
		type:"GET",
		url:"${context}/comment",
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
<%-- //-------------------여기부터 실제 jsp 작성한 것-----------------------------------------------------------
<input type="button" id="goodBtn" value="추천 ${freeBoard.good}" onclick="addGood(${freeBoard.boardNum})">


//------------- 이건 </body> <script> 사이에 그냥 아예 밖에다 적은 것. 아무데나 적어도 되는지는 몰?루
<c:set var="context" value="<%=request.getContextPath() %>"></c:set>



//-----------이건 스크립트 내부에 메서드 작성------------------------------------------------------------
function addGood(boardNum){ // XMLHttpRequest 객체
	$.ajax({
		type:"GET", // 메서드 전송 방식
		url:"${context}/good/"+boardNum, 
		// 매핑 주소 (자바스크립트 구역에서 ${} << 이거 쓰려고 위에서 제이쿼리 가져옴), context =  위에서 c:set으로 저장한 context이고 주소를 animalCommunity/good/(boardNum) 으로 가기 위함
		dateType:JSON, // 받을 데이터 타입? 이건 잘 모름
		success : function(data){ // 내가 설정한 매핑 주소로 가서 실행한 뒤 리턴받은 정보를 이용해 동작할 메서드 작성
			console.log("데이터 : "+JSON.parse(data)); // 이건 그냥 실험용 콘솔 출력
			$('#goodBtn').val("추천 "+JSON.parse(data)); // 위에 버튼(#goodBtn)에 val()메서드를 이용해 value값 설정
		}
			
	});
	
} --%>

</script>
</body>
</html>