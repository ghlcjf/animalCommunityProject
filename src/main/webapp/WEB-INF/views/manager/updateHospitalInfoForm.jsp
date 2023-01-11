<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>병원 정보 수정 페이지</h2>

<form:form action="/animalCommunity/manager/updateHospitalInfo" modelAttribute="hospitalInfo">
	<table border="1">
		<tr>
			<td>병원 이름</td>
			<td>
				<form:input path="hospitalName"/>
				<form:errors path="hospitalName" />
			</td>
		</tr>
		<tr>
			<td>병원 지역</td>
			<td>
				<form:select path="hospitalLoc">
					<form:option value="서울" >서울</form:option>
					<form:option value="경기" >경기</form:option>
					<form:option value="강원" >강원</form:option>
					<form:option value="충청" >충청</form:option>
					<form:option value="경상" >경상</form:option>
					<form:option value="전라" >전라</form:option>
					<form:option value="제주" >제주</form:option>
				</form:select>
				<form:errors path="hospitalLoc" />
			</td>
		</tr>
		<tr>
			<td>병원 상세 주소</td>
			<td>
				<form:input path="detailedAddress"/>
				<form:errors path="detailedAddress" />
			</td>
		</tr>
		<tr>
			<td>병원 전화번호</td>
			<td>
				<form:input path="hospitalTel"/>
				<form:errors path="hospitalTel" />
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<form:textarea path="hospitalInfo"/>
				<form:errors path="hospitalInfo" />
			</td>
		</tr>
	</table>
	<form:hidden path="boardNum"/>
	<button type="submit">글 등록</button>

</form:form>

</body>
</html>