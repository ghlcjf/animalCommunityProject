<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
	.navbar {
	margin-top: 15px;
	width: 100%;
	background-color: #dfe6f7;
	border-top: 1px solid #96aeea;
	border-bottom: 1px solid #96aeea;
}
.navbar-cs {
	margin-top: 15px;
	width: 100%;
	background-color: #fff;
}

.navbar-brand-cs {
	padding-top: 0.3rem;
	padding-bottom: 0.3rem;
	margin-right: var(- -bs-navbar-brand-margin-end);
	font-size: 1.1rem;
	font-weight: bold;
	color: #808080;
	text-decoration: none;
	white-space: nowrap;
	margin-left: 10px;
}

.navbar-brand-cs-1 {
	padding-top: 0.3rem;
	padding-bottom: 0.3rem;
	margin-right: var(- -bs-navbar-brand-margin-end);
	font-size: 2rem;
	font-weight: bold;
	color: #808080;
	text-decoration: none;
	white-space: nowrap;
}

 table {
	table-layout: fixed
}

.table {
	margin-top: 10px;
}

.table-group-divider-cs {
    border-bottom: 1px solid #96aeea;
}

th {
    font-weight: normal;
}


/* td {
overflow:hidden; white-space:nowrap; text-overflow:ellipsis;
} */


a {
	text-decoration: none;
	color: black;
	cursor: cursor;
}

.text-end {
	margin-right: 100px
}
.card {
	margin-top: 15px;
}
.card-title{
    color: #50b1d2;
    margin-left: 10px;
}
button {
	padding: 5px;   border: none;
	height: 30px; 	border-radius: 10px;
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
	margin-left: 10px;
}

.smBtn {
	padding: 5px;   border: none;
	height: 24px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="container">
        <div class="row">
        	<div class="col-10 mx-auto">
				<nav class="navbar">
					<div class="container-fluid">
						<div class="d-flex justify-content-start">
							<span class="navbar-brand-cs mb-0 h1">사용자 정보</span>
						</div>
						<div class="d-flex justify-content-end">
							<button type="button" onclick="sendMessage('${other.name}','${userInfo.name}'); return false;">메시지 보내기</button>
						</div>
					</div>
				</nav>
				
				<div class="card" style="width: 100%;">
        			<div class="card-body">
          				<h2 class="card-title">${other.name }님
          				<c:if test="${other.admin==0}">
						등급: <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
								<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
							</svg> 일반
          				</c:if>
          				<c:if test="${other.admin==1}">
          				등급: <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-gear-wide" viewBox="0 0 16 16">
					  			<path d="M8.932.727c-.243-.97-1.62-.97-1.864 0l-.071.286a.96.96 0 0 1-1.622.434l-.205-.211c-.695-.719-1.888-.03-1.613.931l.08.284a.96.96 0 0 1-1.186 1.187l-.284-.081c-.96-.275-1.65.918-.931 1.613l.211.205a.96.96 0 0 1-.434 1.622l-.286.071c-.97.243-.97 1.62 0 1.864l.286.071a.96.96 0 0 1 .434 1.622l-.211.205c-.719.695-.03 1.888.931 1.613l.284-.08a.96.96 0 0 1 1.187 1.187l-.081.283c-.275.96.918 1.65 1.613.931l.205-.211a.96.96 0 0 1 1.622.434l.071.286c.243.97 1.62.97 1.864 0l.071-.286a.96.96 0 0 1 1.622-.434l.205.211c.695.719 1.888.03 1.613-.931l-.08-.284a.96.96 0 0 1 1.187-1.187l.283.081c.96.275 1.65-.918.931-1.613l-.211-.205a.96.96 0 0 1 .434-1.622l.286-.071c.97-.243.97-1.62 0-1.864l-.286-.071a.96.96 0 0 1-.434-1.622l.211-.205c.719-.695.03-1.888-.931-1.613l-.284.08a.96.96 0 0 1-1.187-1.186l.081-.284c.275-.96-.918-1.65-1.613-.931l-.205.211a.96.96 0 0 1-1.622-.434L8.932.727zM8 12.997a4.998 4.998 0 1 1 0-9.995 4.998 4.998 0 0 1 0 9.996z"/>
							</svg> 관리자
          				</c:if>
          				</h2><br>
       					<div class="d-flex">
							<div class="p-2 flex-fill">
								<h6 class="card-subtitle mb-2 text-muted">
              					<svg style="color: #212529;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
					                <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5ZM9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8Zm1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Z"/>
					                <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12V4Z"/>
              					</svg>
              					아이디: ${other.id }</h6></div>
              
							<div class="p-2 flex-fill">
							<h6 class="card-subtitle mb-2 text-muted">
				          	<svg style="color: #212529;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
						  		<path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
							</svg>
							이메일: ${other.email }</h6></div>
		  
							<div class="p-2 flex-fill">
							<h6 class="card-subtitle mb-2 text-muted">
							<svg style="color: #212529;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
								<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
							</svg>
							전화번호: ${other.phone }</h6></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
				
				
	<div class="container text-center">
		<div class="row">
	 		<div class="col-10 mx-auto">
				<nav class="navbar-cs">
					<div class="container-fluid">
						<div style="margin-bottom: 30px; margin-top: 40px; margin-left: 20px" class="d-flex justify-content-start">
							<span class="navbar-brand-cs-1 mb-0 h1">게시글 목록&nbsp;</span>
						</div>
					</div>
				</nav>
				
				<c:choose>
					<c:when test="${empty board}">
						<p>게시글이 없습니다.</p>
					</c:when>
					<c:otherwise>
						<table class="table table-sm table-hover">
							<thead class="table-group-divider-cs">
								<tr>
									<th width="300px;">제목</th>
									<th width="70px;">작성일</th>
									<th width="70px;">조회수</th>
								</tr>
							</thead>
						
							<c:forEach items="${board}" var="board">
								<tr>
									<%-- <td>${board.boardTitle}</td> --%>
									<td style="cursor: pointer;" onclick="location.href='<c:url value='/freeBoard/readFreeBoard/${board.boardNum}' />'"> ${board.boardTitle}</td>
									<td><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/></td>
									<td>${board.viewCount }</td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
				
				<div class="d-flex justify-content-start">
					<button type="button" class="smallBtn" onclick="location.href='<c:url value="/freeBoard/freeBoardList/main/${sectionPage.section}/${sectionPage.pageNum }" />'">자유게시판으로 돌아가기</button>
				</div>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
<script type="text/javascript">

function sendMessage(rName, sName){

    let receiverName = rName;
    let senderName = sName;
    
    let cc = confirm(receiverName+'님에게 메세지를 보내시겠습니까?');
    if(cc){
       
       let url = "${context}/message/sendForm/"+receiverName;
       window.open(url,'_blank_1','toolbar=no, menubar=no,scrollbars=yes, resizeable=no, width=450, height=400');
    }
    return false;
 }
 
</script> 
</html>