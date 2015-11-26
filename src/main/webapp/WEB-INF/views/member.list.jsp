<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>스프링프레임워크 게시판</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>

<body>


	<h1></h1>
	<table border="1">
		<colgroup>
			<col width="60">
			<col>
			<col width="115">
			<col width="85">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">Member_No</th>
				<th scope="col">Member_ID</th>
				<th scope="col">Member_Pos_Code</th>
				<th scope="col">Member_Name</th>
				<th scope="col">Member_Degree</th>
				<th scope="col">Memeber_Password</th>
				<th scope="col">Memeber_Cellphone</th>
				<th scope="col">Member_Personal_ID</th>
			</tr>
		</thead>

		<tbody>
			<!-- 목록이 반복될 영역 -->
			<c:forEach var="item" items="${list}" varStatus="status">
				<tr>
					<td>${item.member_no}</td>
					<td>${item.member_id}</td>
					<td>${item.member_pos_code}</td>
					<td>${item.member_name}</td>
					<td>${item.member_degree}</td>
					<td>${item.member_password}</td>
					<td>${item.member_cellphone}</td>
					<td>${item.member_personal_id}</td>
				</tr>
			</c:forEach>

		</tbody>

	</table>
	<div>
		<a href="./signup">회원가입</a>
	</div>
</body>
</html>