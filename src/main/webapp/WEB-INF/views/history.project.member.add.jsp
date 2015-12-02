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
<form id="form" method="post" action="./history_add_project_member">
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
						<th scope="col">사원번호</th>
						<th scope="col">이름</th>
						<th scope="col">학력</th>
						<th scope="col">기술</th>
						<th scope="col">역할선택</th>
						<th scope="col">선택여부</th>
						<th scope="col">상세정보</th>						
					</tr>
				</thead>
				
				<tbody>
									
					<!-- 목록이 반복될 영역 -->
					
					<c:forEach var="item" items="${list}" varStatus="status">
						<tr>
							<td>${item.member_no}</td>
							<td>${item.member_name}</td>
							<td>${item.member_degree}</td>
							<td>${item.member_skillset}</td>
							<td>
							<select id="${item.member_no}" name="${item.member_no}" size="1">
							<c:forEach var="role" items="${role_list}" varStatus="status">
					        <option value="${role.role_no}">${role.role}</option>	
					        </c:forEach>		        
							</select>
							</td>							
							<td><input type="checkbox" id="addPeople" name="addPeople" value="${item.member_no}"></td>
							<td><a href="./member_view?no=${item.member_no}" class="btn btn-default" role="button">상세보기</a><td>
												
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
		<div>
			<button type="button" class="btn btn-default" onclick="form_save('#form');">적용</button>
		</div>
		
	</div>
	<input type="hidden" id="project_no" name="project_no" value="${project_no}"/>
	<input type="hidden" id="add_list" name="add_list" value=""/>
	</form>	
</body>
</html>