<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >
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
		<div class="table-responsive">
			<h1>프로젝트 진행현황<small>총 ${total}개의 프로젝트 진행중</small></h1>
			<a href="./status_project_view?status=총합" class="btn btn-default" role="button">총합 ${total}개</a>
			<a href="./status_project_view?status=대기중" class="btn btn-default" role="button">대기중 ${waiting}개</a>
			<a href="./status_project_view?status=결재중" class="btn btn-default" role="button">결재중 ${approval}개</a>
			<a href="./status_project_view?status=승인"  class="btn btn-default"role="button">승인 ${yes}개</a>
			<a href="./status_project_view?status=거절" class="btn btn-default" role="button">거절 ${no}개</a>
			<a href="./status_project_view?status=진행중"  class="btn btn-default" role="button">진행중 ${ing}개</a>
			<a href="./status_project_view?status=종료" class="btn btn-default" role="button">종료 ${end}개</a>
			
			<h1>회사 인원현황<small>총 ${total_member}명 종사중</small></h1>
			<a href="./status_member_view?pos_code=-1" class="btn btn-default" role="button">총원 ${total_member}명</a>
			<a href="./status_member_view?pos_code=0" class="btn btn-default" role="button">임원 ${executive}명</a>
			<a href="./status_member_view?pos_code=1" class="btn btn-default" role="button">PM ${pm}명</a>
			<a href="./status_member_view?pos_code=2" class="btn btn-default" role="button">비서 ${secretary}명</a>
			<a href="./status_member_view?pos_code=3" class="btn btn-default" role="button">일반사원 ${normal}명</a>
		</div>
	</div>
	</div>
</body>
</html>