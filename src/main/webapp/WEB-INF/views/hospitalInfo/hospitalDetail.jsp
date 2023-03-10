<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style type="text/css">
.container {
	margin-top: 20px;
}
.d-grid {
	width:850px;
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
    color: #808080;
    border-color: var(--bs-table-border-color);
    text-align: center;
}

.d-grid{
	width:850px;
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
	
.table>:not(caption)>*>* {
    padding: 0.5rem 0.5rem;
    background-color: var(--bs-table-bg);
    border-bottom-width: 1px;
    border-top-width: 1px;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
}

.hospitalInfo-table {
	border-left: 1px solid #dee2e6; 
	border-right: 1px solid #dee2e6;
	border-top: 1px solid #dee2e6;
	border-bottom: 1px solid #dee2e6;
}

.td-text-align{
	text-align: center;
}	

.btn-cs-1 {
	padding: 5px;   border: none;
	height: 35px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	width: 75px;
	margin-top: 20px;margin-bottom: 5px;
	margin-left: 10px;
	background: green;
}

.btn-cs-1:hover {
	background: rgb(0, 88, 0);
}

.btn-cs-2 {
	padding: 5px;   border: none;
	height: 35px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	width: 75px;
	background: red;
	margin-left: 10px;
	margin-bottom: 5px;
	margin-top: 20px;
}

.btn-cs-2:hover {
	background:rgb(189, 0, 0);
}
.smallBtn {
	padding: 5px;   border: none;
	height: 30px; 	border-radius: 10px;
	color: white;   font-weight:bolder;
	width: 145px;
	background: rgb(136, 154, 233);
	background: linear-gradient(0deg, rgb(184, 194, 238) 0%, rgb(136, 154, 233)  100%);
	line-height: 10px;
}

.smallBtn:hover {
	background: rgb(101, 121, 207);
	background: linear-gradient(0deg, rgb(77, 101, 204) 0%, rgb(101, 121, 207) 100%);
}

</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row">
			<div class="d-grid col-8 mx-auto">
	
				<table class="table table-sm">
					<tr>
						<th scope="row" class="table-primary-cs">?????????</th>
						<td class="td-text-align">${hospitals.boardNum}</td>
						<th scope="row" class="table-primary-cs">?????? ??????</th>
						<td colspan="3" style="padding-left: 20px">${hospitals.hospitalName }</td>
					</tr>
					<tr>
						<th scope="row" class="table-primary-cs">?????????</th>
						<td class="td-text-align">${hospitals.name}</td>
						<th scope="row" class="table-primary-cs">??????</th>
						<td class="td-text-align">${hospitals.hospitalLoc }</td>
						<th scope="row" class="table-primary-cs">????????????</th>
						<td class="td-text-align">${hospitals.hospitalTel}</td>
					</tr>
					<tr>
						<th scope="row" class="table-primary-cs">????????????</th>
						<td colspan="5" style="padding-left: 20px">${hospitals.detailedAddress}</td>
					</tr>
					</table>
					
					<table class="hospitalInfo-table">
					<tr>
						<td colspan="6" style="word-break: break-all">
							<div id="map" style="width:100%;height:350px;"></div>
							<br>
							<p style="padding-left: 15px; padding-right: 15px;">${fn:replace(hospitals.hospitalInfo, replaceChar, "<br/>")}</p>
						</td>
					</tr>
					</table>
					
					<form>

						<div class="d-flex justify-content-center">
							<input class="btn-cs-1" type="button" id="goodBtn" value="?????? ${hospitals.good}" onclick="addGood(${hospitals.boardNum})">
							<input class="btn-cs-2" type="button" id="badBtn" value="?????? ${hospitals.bad}" onclick="addBad(${hospitals.boardNum})">
						</div>
					</form>
					
					<div class="d-flex justify-content-start">
						<button type="button" class="smallBtn" onclick="location.href='<c:url value="/hospitalInfo/main/${sectionPage.section }/${sectionPage.pageNum }" />'">???????????? ????????????</button>
					</div>
				
			</div>

		</div>
	</div>		
		
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3574786400bcb2d7ecd6624766f14c5f&libraries=services"></script>		
	<script>
	
	var mapContainer = document.getElementById('map'), // ????????? ????????? div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
        level: 3 // ????????? ?????? ??????
    };  
	
	// ????????? ???????????????    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// ??????-?????? ?????? ????????? ???????????????
	var geocoder = new kakao.maps.services.Geocoder();
	
	// ????????? ????????? ???????????????
	geocoder.addressSearch('${hospitals.detailedAddress}', function(result, status) {
	
	    // ??????????????? ????????? ??????????????? 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // ??????????????? ?????? ????????? ????????? ???????????????
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // ????????? ????????? ??????????????? ?????? ????????? ??????????????????
	        map.setCenter(coords);
	    } 
	});    
	
	
	
	
	function addGood(boardNum){
		$.ajax({
			type:"GET",
			url:"${context}/hospitalGood/"+boardNum,
			dateType:JSON,
			success : function(data){
				$('#goodBtn').val("??????" +JSON.parse(data));
			}
		});
	}
		
	function addBad(boardNum){
		$.ajax({
			type:"GET",
			url:"${context}/hospitalBad/"+boardNum,
			dateType:JSON,
			success : function(data){
				$('#badBtn').val("??????" +JSON.parse(data));
			}
		});
	}
	</script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>