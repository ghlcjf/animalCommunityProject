<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://getbootstrap.kr/docs/5.2/getting-started/introduction/" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.navbar {
	margin-top: 15px;
	background-color: #dfe6f7;
	border-top: 1px solid #96aeea;
	border-bottom: 1px solid #96aeea;
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
button{
		padding: 5px;   border: none;
		height: 30px; 	border-radius: 10px;
		color: white;   font-weight:bolder;
		background: rgb(136, 154, 233);
		background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
		line-height: 10px;
		
	}
	button:hover{
  			background: rgb(101, 121, 207);
		background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
	}
table {
	table-layout: fixed
}

.table {
	margin-top: 30px;
}

thead {
	background-color: #dfe6f7;
}

th {
     font-weight: normal;
}

td {
overflow:hidden; white-space:nowrap; text-overflow:ellipsis;
}

a {
	text-decoration: none;
	color: black;
}

.pagination{
	justify-content: center;
}
	.wrapper{
		display:grid;
		grid-template-columns: repeat(4,1fr);
      	grid-template-rows: repeat(5,150px);
      	grid-template-areas: 
      	". box2 box2 box2"
      	"box1 box2 box2 box2"
      	"box1 box2 box2 box2"
      	"box1 box2 box2 box2"
      	"box1 . box3 box3";
      	text-align:center;
	}
	.box1 {
      border:none;
      grid-area: box1;
    }
    .box2 {
     
      grid-area: box2;
    }
    .box3 {
     
      grid-area: box3;
    }
 	.list-group-item {
 		border:none;
 		font-size: 13px;
 		margin-top: 13px;
 	}
</style>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container text-center">
        <div class="row">
        <div class="col-1">
            <div class="box1 list-group">
  <a href="<c:url value='/freeBoard/freeBoardList/main/1/1' />" class="list-group-item list-group-item-action">
    전체보기
  </a>
  <a href="<c:url value='/freeBoard/freeBoardList/dog/1/1' />" class="list-group-item list-group-item-action">강아지</a>
  <a href="<c:url value='/freeBoard/freeBoardList/cat/1/1' />" class="list-group-item list-group-item-action">고양이</a>
  <a href="<c:url value='/freeBoard/freeBoardList/reptile/1/1' />" class="list-group-item list-group-item-action">파충류</a>
  <a href="<c:url value='/freeBoard/freeBoardList/birds/1/1' />" class="list-group-item list-group-item-action">조류</a>
  <a href="<c:url value='/freeBoard/freeBoardList/fish/1/1' />" class="list-group-item list-group-item-action">어류</a>
  <a href="<c:url value='/freeBoard/freeBoardList/other/1/1' />" class="list-group-item list-group-item-action">기타</a>
</div>
          </div>
           <div class="col-10">
<nav class="navbar">
		<div class="container-fluid">
			<span class="navbar-brand-cs mb-0 h1">자유게시판</span>
			<div class="d-flex justify-content-end">
			<button type="button" onclick="return insertConfirm()">글 작성</button>
			</div>
		</div>
	</nav>

<!-- <div class="wrapper container"> -->
<%-- <div class="box1 list-group">
  <a href="<c:url value='/freeBoard/freeBoardList/main/1/1' />" class="list-group-item list-group-item-action">
    전체 보기
  </a>
  <a href="<c:url value='/freeBoard/freeBoardList/dog/1/1' />" class="list-group-item list-group-item-action">강아지</a>
  <a href="<c:url value='/freeBoard/freeBoardList/cat/1/1' />" class="list-group-item list-group-item-action">고양이</a>
  <a href="<c:url value='/freeBoard/freeBoardList/reptile/1/1' />" class="list-group-item list-group-item-action">파충류</a>
  <a href="<c:url value='/freeBoard/freeBoardList/birds/1/1' />" class="list-group-item list-group-item-action">조류</a>
  <a href="<c:url value='/freeBoard/freeBoardList/fish/1/1' />" class="list-group-item list-group-item-action">어류</a>
  <a href="<c:url value='/freeBoard/freeBoardList/other/1/1' />" class="list-group-item list-group-item-action">기타</a>
</div> --%>
<div class="box2">
	<table class="table table-hover table-sm">
	  <thead>
	  	<%-- <tr>
			<td colspan="5" align="right">
				<a href="<%=request.getContextPath() %>/freeBoard/insertFreeBoardForm">글 작성하기</a>
				<button type="button" onclick="return insertConfirm()">글 작성</button>
			</td>
		</tr> --%>
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">제목</th>
	      <th scope="col">조회수</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:if test="${!empty noticeList}">
			<c:forEach items="${noticeList}" var="notice">
				<tr>
					 <th scope="row">${notice.boardNum }</th>
					<td><a href="<c:url value='/freeBoard/readFreeBoard/${notice.boardNum}' />">${notice.boardTitle } (${notice.commentCount})</a></td>
					<td>${notice.viewCount }</td>
					<td>${notice.name }</td>
					<td><fmt:formatDate value="${notice.writeDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</c:if>
		<c:choose>
			<c:when test="${empty freeBoardList}">
				<tr>
					<th scope="row" colspan="5">등록한 게시글이 없습니다.</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${freeBoardList}" var="board">
					<tr>
						<th scope="row">${board.boardNum }</th>
						<%-- <td>
							<a href="<c:url value='/freeBoard/readFreeBoard/${board.boardNum}' />">${board.boardTitle} (${board.commentCount})</a>
						</td> --%>
						<td style="cursor: pointer;" onclick="location.href='<c:url value='/freeBoard/readFreeBoard/${board.boardNum}' />'"> ${board.boardTitle} (${board.commentCount})</td>
						<td>${board.viewCount }</td>
						<td>${board.name }</td>
						<td><fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</c:otherwise>
			
		</c:choose>
	  </tbody>
	</table>
</div>

<div class="box3">
	<c:if test="${totalCnt != null}">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:choose>
					<c:when test="${totalCnt>100}"> <!-- 전체 개수가 100개 초과 -->
						<c:if test="${(sectionPage.section*100)<totalCnt }"> <!-- 다음 섹션이 존재하는가 => '>>' O -->
							<c:forEach var="page" begin="1" end="10" step="1"> <!-- 번호 매기기 -->
								<c:if test="${sectionPage.section>1 && page==1}">
									<li class="page-item">
								      <a class="page-link" aria-label="Previous" href="/animalCommunity/freeBoard/freeBoardList/${animal}/${sectionPage.section-1}/${10}">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
								</c:if>
								<li class="page-item">
									<a class="page-link" href="/animalCommunity/freeBoard/freeBoardList/${animal}/${sectionPage.section}/${page}">
										${(sectionPage.section-1)*10+page}
									</a>
								</li>
								<!-- 번호를 눌렀을 때 해당 섹션과 해당 페이지 번호를 서버에 전달 -->
								<c:if test="${page==10}">
									<li class="page-item">
								      <a class="page-link" href="/animalCommunity/freeBoard/freeBoardList/${animal}/${sectionPage.section+1}/${1}" aria-label="Next">
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
								      <a class="page-link" aria-label="Previous" href="/animalCommunity/freeBoard/freeBoardList/${animal}/${sectionPage.section-1}/${10}">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
								</c:if>
								<li class="page-item">
									<a class="page-link" href="/animalCommunity/freeBoard/freeBoardList/${animal}/${sectionPage.section}/${page}">
										${(sectionPage.section-1)*10+page}
									</a>
								</li>
							</c:forEach>
						</c:if>
						
					</c:when>
					
					
					<c:when test="${totalCnt==100}"> <!-- 전체 개수가 100개 -->
						<c:forEach var="page" begin="1" end="10" step="1">
							<li class="page-item">
								<a class="page-link" href="/animalCommunity/freeBoard/freeBoardList/${animal}/${sectionPage.section}/${page}">
									${(sectionPage.section-1)*10+page}
								</a>
							</li>
						</c:forEach>
					</c:when>
					
					
					<c:when test="${totalCnt<100}"> <!-- 전체 개수가 100개 미만 -->
						<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">
							<li class="page-item">
								<a class="page-link" href="/animalCommunity/freeBoard/freeBoardList/${animal}/${sectionPage.section}/${page}">
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
<!-- </div> -->
</div>
<div class="col-1">
            1 of 3
          </div>
</div>
</div>
	
<jsp:include page="../footer.jsp"></jsp:include>

</body>
<script type="text/javascript">
function insertConfirm(){
	let cc = confirm('게시물을 작성하시겠습니까?');
	if(cc==false){
		return false;
	}else{
		location.href="/animalCommunity/freeBoard/insertFreeBoardForm";
	} 
}
</script>
</html>