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
		.d-grid{
			width:850px;
		}
	</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="d-grid gap-2 col-6 mx-auto">
		<table class="table">
			<tr>
				<th>글번호</th>
				<td>${hospitals.boardNum}</td>
				<th>병원 이름</th>
				<td colspan="3">${hospitals.hospitalName }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${hospitals.name}</td>
				<th>지역</th>
				<td>${hospitals.hospitalLoc }</td>
				<th>전화번호</th>
				<td>${hospitals.hospitalTel}</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td colspan="5">${hospitals.detailedAddress}</td>
			</tr>
			<tr>
				<td colspan="6">
					<div id="map" style="width:100%;height:350px;"></div>
					<br>
					${hospitals.hospitalInfo}
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<form>
						<input type="button" id="goodBtn" value="추천 ${hospitals.good}" onclick="addGood(${hospitals.boardNum})">
						<input type="button" id="badBtn" value="반대 ${hospitals.bad}" onclick="addBad(${hospitals.boardNum})">
					</form><br>
				</td>
			</tr>
		</table>
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