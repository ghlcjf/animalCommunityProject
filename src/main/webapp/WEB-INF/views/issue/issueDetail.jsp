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
	${issue.issueContent}
</div>
<hr>
<form action="comment">
	<label> 댓글 :
		<textarea rows="5" cols="50" id="commentContent"></textarea> 
	</label>
	<label>
		<input type="hidden" id="name" value="0">
	</label>
	<button type="button" onclick="insertComment(${issue.issueNum})">등록</button>
</form>
<hr>
<c:forEach items="${issueComment}" var="comment" varStatus="b">
	<tr>
		<td>${comment.name}</td>
		<td>${comment.commentContent}</td>
		<td><fmt:formatDate value="${comment.writeDate}" pattern="yyyy-MM-dd"/></td><br>
	</tr>

</c:forEach>
<c:set var="context" value="<%=request.getContextPath() %>"></c:set> 

<script type="text/javascript">


function insertComment(Num) {
	let commentContent = $('#commentContent').val();
	let name = $('#name').val();
	let boardNum = Num;
	
	/* let comment = {
		"commentContent":commentContent,
		"name":name,
		"boardNum":boardNum
	}; */
	
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