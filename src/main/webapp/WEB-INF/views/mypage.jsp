<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
     <head>
     <meta charset="utf-8">
     <title>Spring security</title>
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
     <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
     <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
     </head>

 <body data-feedly-mini="yes">


 	<!-- 상단 네비게이션 바 -->
<div class="navbar navbar-inverse navbar-fixed-top">
     
        <div class="navbar-header">
             
          <a class="navbar-brand" href="#">프람트소프트웨어</a>
       
        </div>
</div>




 <div class="container">
<div style="margin-top: 100px;">

 <div class= "jumbotron">
       <h1>프람트 소프트웨어 시스템</h1>
          
        <h2>${user_name} 로그인 중</h2>
        
        <p class="lead">진행하실 업무를 선택하세요.</p>
        
        <p>
        	<a class="btn btn-lg btn-primary" href="./list" role="button">회원목록</a>
        	<a class="btn btn-lg btn-primary" href="./request_project_list" role="button">요청목록</a>
        	<a class="btn btn-lg btn-primary" href=" ./request_project_list" role="button">결재요청</a>
        	<a class="btn btn-lg btn-primary" href="./signout" role="button">로그아웃</a>
        </p>
      </div>

     
</div>
</div>
     </body>

</html>