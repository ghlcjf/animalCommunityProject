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
    color: var(--bs-table-color);
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
	width: 70px;
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
	width: 70px;
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
						<th scope="row" class="table-primary-cs">글번호</th>
						<td class="td-text-align">${hospitals.boardNum}</td>
						<th scope="row" class="table-primary-cs">병원 이름</th>
						<td colspan="3" style="padding-left: 20px">${hospitals.hospitalName }</td>
					</tr>
					<tr>
						<th scope="row" class="table-primary-cs">작성자</th>
						<td class="td-text-align">${hospitals.name}</td>
						<th scope="row" class="table-primary-cs">지역</th>
						<td class="td-text-align">${hospitals.hospitalLoc }</td>
						<th scope="row" class="table-primary-cs">전화번호</th>
						<td class="td-text-align">${hospitals.hospitalTel}</td>
					</tr>
					<tr>
						<th scope="row" class="table-primary-cs">상세주소</th>
						<td colspan="5" style="padding-left: 20px">${hospitals.detailedAddress}</td>
					</tr>
					</table>
					
					<table class="hospitalInfo-table">
					<tr>
						<td colspan="6" style="word-break: break-all">
							<div id="map" style="width:100%;height:350px;"></div>
							<br>
							<p style="padding-left: 20px; padding-right: 20px;">${hospitals.hospitalInfo}</p>
						</td>
					</tr>
					</table>
					
					<form>

						<div class="d-flex justify-content-center">
							<input class="btn-cs-1" type="button" id="goodBtn" value="추천 ${hospitals.good}" onclick="addGood(${hospitals.boardNum})">
							<input class="btn-cs-2" type="button" id="badBtn" value="반대 ${hospitals.bad}" onclick="addBad(${hospitals.boardNum})">
						</div>
					</form>
					
					<div class="d-flex justify-content-start">
						<button type="button" class="smallBtn" onclick="location.href='<c:url value="/hospitalInfo/main/1/1" />'">목록으로 돌아가기</button>
					</div>
				
			</div>

		</div>
	</div>		
		
	<c:set var="context" value="<%=request.getContextPath() %>"></c:set>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3574786400bcb2d7ecd6624766f14c5f&libraries=services"></script>		
	<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${hospitals.detailedAddress}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	        	content: '<div style="width:150px;text-align:center;padding:6px 0;">병원 위치</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	
	
	
	
	function addGood(boardNum){
		$.ajax({
			type:"GET",
			url:"${context}/hospitalGood/"+boardNum,
			dateType:JSON,
			success : function(data){
				$('#goodBtn').val("추천" +JSON.parse(data));
			}
		});
	}
		
	function addBad(boardNum){
		$.ajax({
			type:"GET",
			url:"${context}/hospitalBad/"+boardNum,
			dateType:JSON,
			success : function(data){
				$('#badBtn').val("반대" +JSON.parse(data));
			}
		});
	}
	</script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>