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
<script src="<c:url value="/resources/js/add_project_member.js" />"></script> 
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
						<th scope="col">참여여부</th>
						<th scope="col">사번</th>
						<th scope="col">이름</th>
						<th scope="col">프로젝트 참여일</th>
						<th scope="col">역할</th>
						<th scope="col">제외</th>
						<th scope="col">상세정보</th>						
					</tr>
				</thead>
				
				<tbody>
									
					<!-- 목록이 반복될 영역 -->
					
					<c:forEach var="item" items="${list}" varStatus="status">
						<tr>
							<td><c:if test="${item.project_end_date eq '1111-11-11'}">O</c:if>
							<c:if test="${item.project_end_date ne '1111-11-11'}">X</c:if>
							</td>
							<td>${item.member_no}</td>
							<td>${item.member_name}</td>
							<td>${item.project_start_date} ~ 
							<c:if test="${item.project_end_date ne '1111-11-11'}">
							${item.project_end_date}</c:if>
							</td>
							<td>${item.role}</td>							
							<td><c:if test="${item.role_no ne '10' && item.project_end_date eq '1111-11-11'}">
							<a href="./member_delete?pageNum=${pageNum}&project_no=${item.project_no}&member_no=${item.member_no}" class="btn btn-default" role="button">프로젝트제외</a>
							</c:if>
							<td><a href="./member_view?no=${item.member_no}" class="btn btn-default" role="button">상세보기</a><td>
												
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
						href="./history_project_member_list?project_no=${project_no}&pageNum=${(numPageGroup-2)*pageGroupSize+1}">prev</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li><a href="./history_project_member_list?project_no=${project_no}&pageNum=${i}"> <c:if
								test="${currentPage == i}">
							</c:if> ${i}
					</a></li>
				</c:forEach>
				<c:if test="${numPageGroup < pageGroupCount}">
					<li><a href="./history_project_member_list?project_no=${project_no}&pageNum=${numPageGroup*pageGroupSize+1}">next</a></li>
				</c:if>
			</ul>
		</c:if>
		<div><a href="./history_project_view?no=${project_no}" class="btn btn-default" role="button">프로젝트정보</a></div>	
	</div>
		
</body>
</html>