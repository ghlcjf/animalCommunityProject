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
<style>
.container {
	margin-top: 20px;
}
.table-primary-cs {
    --bs-table-color: #000;
    --bs-table-bg: #dfe6f7;
    --bs-table-border-color: #dee2e6;
    --bs-table-striped-bg: #c5d7f2;
    --bs-table-striped-color: #000;
    --bs-table-active-bg: #bacbe6;
    --bs-table-active-color: #000;
    --bs-table-hover-bg: #bfd1ec;
    --bs-table-hover-color: #000;
    color: var(--bs-table-color);
    border-color: var(--bs-table-border-color);
    text-align: center;
}
.table>:not(caption)>*>* {
    padding: 0.5rem 0.5rem;
    background-color: var(--bs-table-bg);
    border-bottom-width: 1px;
    border-top-width: 1px;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}
.td-text-align{
	text-align: center;
}
.card-cs {
    --bs-card-spacer-y: 1rem;
    --bs-card-spacer-x: 1rem;
    --bs-card-title-spacer-y: 0.5rem;
    --bs-card-border-width: 1px;
    --bs-card-border-color: #dee2e6;
    --bs-card-box-shadow: ;
    --bs-card-inner-border-radius: calc(0.375rem - 1px);
    --bs-card-cap-padding-y: 0.5rem;
    --bs-card-cap-padding-x: 1rem;
    --bs-card-cap-bg: rgba(0, 0, 0, 0.03);
    --bs-card-cap-color: ;
    --bs-card-height: ;
    --bs-card-color: ;
    --bs-card-bg: #fff;
    --bs-card-img-overlay-padding: 1rem;
    --bs-card-group-margin: 0.75rem;
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    height: var(--bs-card-height);
    word-wrap: break-word;
    background-color: var(--bs-card-bg);
    background-clip: border-box;
    border: var(--bs-card-border-width) solid var(--bs-card-border-color);
    border-radius: var(--bs-card-border-radius);
    margin-bottom: 20px;
    min-height: 500px;
}
	
img {
    width: 51.5rem;
    margin-left: 1rem;
    margin-top: 1rem;
}
button {
	padding: 5px;   border: none;
	height: 40px; 	border-radius: 10px;
	width: 95px;
	color: white;   font-weight:bolder;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
}

button:hover {
	background: rgb(101, 121, 207);
	background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
}

.bigBtn {
	padding: 5px;   border: none;
	height: 30px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	width: 145px;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
}

.bigBtn:hover {
		background: rgb(101, 121, 207);
		background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

	<div class="container">
        <div class="row">
			<div class="col-8 mx-auto">

				<table class="table">
					<tr>
						<th class="table-primary-cs">글 제목</th>
						<td colspan="3" width="100px" style = "word-break: break-all; padding-left: 20px; padding-right: 20px">${issue.issueTitle}</td>
					</tr>
					<tr>
						<th class="table-primary-cs">글 번호</th>
						<td class="td-text-align">${issue.issueNum}</td>
						<th class="table-primary-cs">작성자</th>
						<td class="td-text-align">${issue.name}</td>
					</tr>
					<tr>
						<th class="table-primary-cs">작성일</th>
						<td class="td-text-align"><fmt:formatDate value="${issue.writeDate}" pattern="yyyy-MM-dd"/></td>
						<th class="table-primary-cs">조회수</th>
						<td class="td-text-align">${issue.viewCount}</td>
					</tr>
				</table>
				
					<div class="card-cs" style="width: 100%;">
						<c:if test="${!empty issue.issueUrl && issue.issueUrl!='null'}">
							<img src="/imageFolder/issueBoardImage/${issue.issueUrl }">
						</c:if>
	  					<div class="card-body">
							<p class="card-text">${issue.issueContent}</p>
	  					</div>
					</div>
				
				<table id="commentTbl" class="table" style="border-top-color: #fff">
					<c:if test="${!empty userInfo}">
						<tr>
							<td colspan="3">
								<form>
									<div class="input-group mb-3">
										<input type="hidden" id="name" value="${userInfo.name}">
										<input type="text" id="commentContent" class="form-control" placeholder="댓글을 입력해 주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
										<button type="button" id="button-addon2" onclick="insertComment(${issue.issueNum})">댓글 등록</button>
									</div>
								</form>
							</td>
						</tr>
					</c:if>		
					
					<c:forEach items="${issueComment}" var="issueComment">
						<tr>
							<td>${issueComment.name }</td>
							<td width="700px;" style = "word-break: break-all">${issueComment.commentContent }</td>
							<td><fmt:formatDate value="${issueComment.writeDate }" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</table>
	
				<div class="d-flex justify-content-start">
					<button type="button" class="bigBtn" onclick="location.href='<c:url value="/freeBoard/freeBoardList/main/1/1" />'">목록으로 돌아가기</button>
				</div>
			</div>
		</div>
	</div>
</body>


<c:set var="context" value="<%=request.getContextPath() %>"></c:set> 

<script type="text/javascript">

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
				let tr = $('<tr></tr>').appendTo(tbl);
				
                $('<td></td>').html(data.name).appendTo(tr);
                /* $('<td></td>').html(data.commentContent).appendTo(tr); */
				$('<td width="700px;" style = "word-break: break-all"></td>').html(data.commentContent).appendTo(tr);                
                $('<td></td>').html(data.writeDate).appendTo(tr);
				
			},
			complete:function(){
				document.getElementById('commentContent').value='';
			}
			
		});
	}

</script>
<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>