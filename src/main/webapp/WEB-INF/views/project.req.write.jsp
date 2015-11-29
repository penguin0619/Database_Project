<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
	 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
     <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
     <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
     <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
     <script src="<c:url value="/resources/js/career.js" />"></script>
	 <script src="<c:url value="/resources/js/address.js" />"></script> 
	 <script src="<c:url value="/resources/js/project_req_filter.js" />"></script> 
     </head>

     <body>
     <div class="navbar navbar-inverse navbar-fixed-top">
     
        <div class="navbar-header">
             
          <a class="navbar-brand" href="#">프람트소프트웨어</a>
       
        </div>
</div>
      
<div class = "container" style="margin-top: 100px;" >
    <!--  /project_write_ok -->
     	<h1>프로젝트요청 페이지</h1>
     	
	<form id="form" method="post" action="./project_write_ok">
		
		 <div class="form-group">
	  			<label for="project_name" class="col-sm-2 control-label">프로젝트명</label>
		 		<input type="text" id="project_name" name="project_name" value="${object.project_name}">
		 </div>
		
		<div class = "form-group">
				<label for="project_company_name" class="col-sm-2 control-label">회사명</label>
				<input type="text" id="project_company_name" name="project_company_name" value="${object.project_company_name}">
		</div>
		
		<div class = "form-group">
				<label for="project_hope_start_date" class="col-sm-2 control-label">시작희망 날짜</label>
				<input type="text" id="project_hope_start_date" name="project_hope_start_date" class="datepicker" maxlength="8" value="${object.project_hope_start_date}">
		</div>
		
		<div class = "form-group">
			<label for="project_hope_end_date" class="col-sm-2 control-label">종료희망 날짜</label>
			<input type="text" id="project_hope_end_date" name="project_hope_end_date" class="datepicker" maxlength="8" value="${object.project_hope_end_date}">
		</div>
		
		
		<div class = "form-group">
			<label for="project_address" class="col-sm-2 control-label">주소입력</label>
			<input type="text" id="project_postcode" class = "form-group" name="project_postcode" value="${object.project_postcode}" placeholder="우편번호">
			<button type="button" class="btn btn-sm btn-primary" onclick="execDaumPostcode()">우편번호 찾기</button>
		</div>
		
		<div class = "form-group">
		<label for="project_address_detail" class="col-sm-2 control-label">상세주소</label>
		
		<input type="text" id="project_address" class = "form-group" name="project_address" value="${object.project_address}" placeholder="주소">
		<input type="text" id="project_address_detail" class = "form-group" name="project_address_detail" value="${object.project_address_detail}" placeholder="상세주소">
		</div>
		
		<div class = "form-group">
			<label for="project_address_detail" class="col-sm-2 control-label">프로젝트 세부사항</label>
			<textarea rows="15" cols="50" id="project_contents" name="project_contents">${object.project_contents}</textarea>
		</div>
		
		 <div class="col-sm-8">
			<button type="button" class="btn btn-lg btn-primary btn-block" onclick="form_save('#form');">작성완료</button>
		</div>
	</form>
</div>
			
		</body>