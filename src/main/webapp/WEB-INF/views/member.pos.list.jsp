<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<title>스프링프레임워크 게시판</title>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>
<body>
 	<!-- 상단 네비게이션 바 -->
<div class="navbar navbar-inverse navbar-fixed-top">
     
        <div class="navbar-header">
             
          <a class="navbar-brand" href="#">프람트소프트웨어</a>
       
        </div>
</div>

<div class="container">
<div style="margin-top: 100px;">
		<h1></h1>
		<div class="table-responsive">
			<table class="table table-hover">

				<thead>
					<tr>
						<th scope="col">사번</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">학력</th>
						<th scope="col">휴대폰번호</th>
						
					</tr>
				</thead>

				<tbody>
					<!-- 목록이 반복될 영역 -->
					<c:forEach var="item" items="${list}" varStatus="status">
						<tr onclick="location.href='./member_view?no=${item.member_no}'">
							<td>${item.member_no}</td>
							<td>${item.member_id}</td>
							<td>${item.member_name}</td>
							<td>${item.member_degree}</td>							
							<td>${item.member_cellphone}</td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</div>
		<c:if test="${count > 0}">
			<c:set var="pageCount"
				value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
			<c:set var="startPage" value="${pageGroupSize*(numPageGroup-1)+1}" />
			<c:set var="endPage" value="${startPage + pageGroupSize-1}" />
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>

			<ul class="pagination">
				<c:if test="${numPageGroup > 1}">
					<li><a
						href="./status_member_view?pageNum=${(numPageGroup-2)*pageGroupSize+1}&pos_code=${pos_code}">prev</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li><a href="./status_member_view?pageNum=${i}&pos_code=${pos_code}"> <c:if
								test="${currentPage == i}">
							</c:if> ${i}
					</a></li>
				</c:forEach>
				<c:if test="${numPageGroup < pageGroupCount}">
					<li><a href="./status_member_view?pageNum=${numPageGroup*pageGroupSize+1}&pos_code=${pos_code}">next</a></li>
				</c:if>
			</ul>
		</c:if>

		<div>
			<a href="./mypage" class="btn btn-default" role="button">마이페이지</a>
		</div>
	</div>
</body>
</html>