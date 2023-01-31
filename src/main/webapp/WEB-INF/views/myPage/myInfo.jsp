<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
<style>
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
.pagination{
	margin-top: 15px;
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
						<span class="navbar-brand-cs mb-0 h1">마이페이지</span>
							<div class="d-flex justify-content-end">
								<form action='<c:url value="/mypage/${user.id}" />'>
									<button class="bigBtn" type="submit" onclick="return out('${user.id}')">회원 탈퇴</button>
								</form>
								<form id="section" action="<c:url value='/checkPassword' />">
									<button class="bigBtn" type="submit" onclick="newWindow()">개인정보 수정하기</button>
								</form>
							</div>
						</div>
					</nav>
	
				<div class="card" style="width: 100%;">
        			<div class="card-body">
          				<h2 class="card-title">${user.name }님
          				<c:if test="${userInfo.admin==0}">
						등급: <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
								<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
							</svg> 일반
          				</c:if>
          				<c:if test="${userInfo.admin==1}">
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
              					아이디: ${user.id }</h6></div>
              
							<div class="p-2 flex-fill">
							<h6 class="card-subtitle mb-2 text-muted">
				          	<svg style="color: #212529;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
						  		<path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
							</svg>
							이메일: ${user.email }</h6></div>
		  
							<div class="p-2 flex-fill">
							<h6 class="card-subtitle mb-2 text-muted">
							<svg style="color: #212529;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
								<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
							</svg>
							전화번호: ${user.phone }</h6></div>
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
							<span class="navbar-brand-cs-1 mb-0 h1">${((sectionPage.section-1)*10)+sectionPage.pageNum }page</span>
						</div>
					</div>
				</nav>
	
		<c:choose>
			<c:when test="${empty boardList}">
				<p>게시글이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<table class="table table-hover table-sm">
				<thead class="table-group-divider-cs">
					<tr>
						<th width="300px;">제목</th>
						<th width="70px;">작성일</th>
						<th width="70px;">조회수</th>
						<th width="70px;">글 수정</th>
						<th width="70px;">글 삭제</th>
					</tr>
				</thead>
				<c:forEach items="${boardList}" var="board">
					<tbody>
						<tr>
							<td style="cursor: pointer;" onclick="location.href='<c:url value='/freeBoard/readMyFreeBoard/${board.boardNum}' />'"> ${board.boardTitle}</td>
							<td><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/></td>
							<td>${board.viewCount }</td>
							<td>
								<form action="<c:url value='/myPage/updeteForm/${board.boardNum}' />">
									<button class="smBtn" type="submit" onclick="return boardUpdate()">수정</button>
								</form>
							</td>
							<td>
								<form action="<c:url value='/myPage/delete/${board.boardNum}' />">
									<button class="smBtn" type="submit" onclick="return boardDelete()">삭제</button>
									<%-- <input type="hidden" name="boardNum" value="${board.boardNum}"> --%>
								</form>
							</td>
						</tr>
					</tbody>
				</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		
	<!--마이페이지 페이지네이션-->
	<div class="d-flex justify-content-center">
		<c:if test="${totalCnt != null}">
			<nav aria-label="page navihation example">
				<ul class="pagination">
					<c:choose>
						<c:when test="${totalCnt>100}">
							<c:if test="${(sectionPage.section*100)<totalCnt }">
								<c:forEach var="page" begin="1" end="10" step="1">
									<c:if test="${sectionPage.section>1 && page==1}">
										<li class="page-item">
									      <a class="page-link" aria-label="Previous" href="/animalCommunity/myPage/${sectionPage.section-1}/${10}">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									</c:if>
									<li class="page-item">
										<a class="page-link" href="/animalCommunity/myPage/${sectionPage.section}/${page}">
											${(sectionPage.section-1)*10+page}
										</a>
									</li>
									<!-- 번호를 눌렀을 때 해당 섹션과 해당 페이지 번호를 서버에 전달 -->
									<c:if test="${page==10}">
										<li class="page-item">
									      <a class="page-link" href="/animalCommunity/myPage/${sectionPage.section+1}/${1}" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
									    </li>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${(sectionPage.section*100)>=totalCnt }"> <!-- 다음 섹션이 존재하지 않는가=> '>>' X  -->
								<c:forEach var="page" begin="1" end="${((totalCnt+9)-(sectionPage.section-1)*100)/10}" step="1">
									<c:if test="${sectionPage.section>1 && page==1}">
										<li class="page-item">
									      <a class="page-link" aria-label="Previous" href="/animalCommunity/myPage/${sectionPage.section-1}/${10}">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									</c:if>
									<li class="page-item">
										<a class="page-link" href="/animalCommunity/myPage/${sectionPage.section}/${page}">
											${(sectionPage.section-1)*10+page}
										</a>
									</li>
								</c:forEach>
							</c:if>
						</c:when>
						<c:when test="${totalCnt==100}"> <!-- 전체 개수가 100개 -->
							<c:forEach var="page" begin="1" end="10" step="1">
								<li class="page-item">
									<a class="page-link" href="/animalCommunity/myPage/${sectionPage.section}/${page}">
										${(sectionPage.section-1)*10+page}
									</a>
								</li>
							</c:forEach>
						</c:when>
						<c:when test="${totalCnt<100}"> <!-- 전체 개수가 100개 미만 -->
							<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">
								<li class="page-item">
									<a class="page-link" href="/animalCommunity//myPage/${sectionPage.section}/${page}">
										${(sectionPage.section-1)*10+page}
									</a>
								</li>
							</c:forEach>
						</c:when>
					</c:choose>
				</ul>
			</nav>
		</c:if>
	</div>
	
			<div class="d-flex justify-content-start">
				<button type="button" onclick="location.href='<c:url value="/main" />'">메인으로 돌아가기</button>
			</div>
			
					</div>
				</div>
			</div>
		</div>
	</div>
		
<jsp:include page="../footer.jsp"></jsp:include>

<script type="text/javascript">
	function boardDelete(){
		 return confirm('게시글을 삭제 하시겠습니까?');
	}

	function boardUpdate(){
		 return confirm('게시글을 수정하시겠습니까?');
	}
	
	/* function newWindow(){
		
		let url = "${context}/checkPassword";
		
		window.open(url,'_blank_1',
		'toolbar=no, menubar=no, scrollbars=yes, resizeable=no, width=450, height=200');
	} */

	function out(name){
		console.log(name);
		if(confirm('정말 탈퇴하시겠습니까?')){
			return alert('탈퇴가 정상 처리되었습니다.');
		}else{
			return false;
		}
	
	}
</script>
</body>
</html>