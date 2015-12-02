<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
     <head>
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Spring security</title>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
<div class = "jumbotron"  style="margin-top: 100px;">
     <h2>${user_name} 로그인 중</h2>
     <br>
     <sec:authorize access="hasRole('ROLE_EXECUTIVE')">
	 <a class = "btn btn-md btn-default" href="./list">회원목록</a>
	 </sec:authorize>
	 <sec:authorize access="hasRole('ROLE_SECRETARY')">
	 <a class = "btn btn-md btn-default" href="./request_project_list">요청목록</a>
	 </sec:authorize>
	 <sec:authorize access="hasRole('ROLE_EXECUTIVE')">
	 <a class = "btn btn-md btn-default" href="./request_approval_list">결재요청</a>
	 </sec:authorize>
	 <sec:authorize access="hasRole('ROLE_PM') OR hasRole('ROLE_NORMAL') ">
	 <a class = "btn btn-md btn-default" href="./history_project_list">참여프로젝트</a>
	 </sec:authorize>
	 <sec:authorize access="hasRole('ROLE_PM')">
	 <a class = "btn btn-md btn-default" href="./enabled_project_list">프로젝트처리</a>
	 </sec:authorize>
	 <sec:authorize access="hasRole('ROLE_PM') OR hasRole('ROLE_NORMAL')">
	 <a class = "btn btn-md btn-default" href="./appraise_member_list">개인평가</a>
	 </sec:authorize>
	 <sec:authorize access="hasRole('ROLE_EXECUTIVE')">
     <a class = "btn btn-md btn-default" href="./status_info_list">현황</a>
     </sec:authorize>
	 <a class = "btn btn-md btn-default" href="./signout">로그아웃</a>
</div>
</div>
     </body>

</html>