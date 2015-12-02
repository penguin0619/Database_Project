<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 게시판</title>
  	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="<c:url value="/resources/js/approval_filter.js" />"></script> 
  
  </head>
  <body>
  
  	<div class="navbar navbar-inverse navbar-fixed-top">

		<div class="navbar-header">

			<a class="navbar-brand" href="#">프람트소프트웨어</a>
		</div>
	</div>
	
<div class = "container">
<div style = "margin-top : 100px;">
  <h2>프로젝트정보</h2>
  
  <div class = "form-group">
  프로젝트명 : ${project.project_name}
  </div>
  <div class = "form-group">
  프로젝트명 : ${project.project_name}
  </div>
  <div class = "form-group">
  회사명 : ${project.project_company_name}
  </div>
  <div class = "form-group">
  	프로젝트 시작희망날짜 : ${fn:substring(project.project_hope_start_date,0,4)}년
  			   ${fn:substring(project.project_hope_start_date,5,7)}월
  			   ${fn:substring(project.project_hope_start_date,8,10)}일
  </div>
  <div class = "form-group">
  프로젝트 종료희망날짜 : ${fn:substring(project.project_hope_end_date,0,4)}년
  			   ${fn:substring(project.project_hope_end_date,5,7)}월
  			   ${fn:substring(project.project_hope_end_date,8,10)}일
  </div>
  <div class = "form-group">
  우편번호 : ${project.project_postcode}
  </div>
  <div class = "form-group">
  주소 : ${project.project_address}
  </div>
  <div class = "form-group">
  상세주소 : ${project.project_address_detail}
  </div>
  <div class = "form-group">
  요청상태 : ${project.project_status}
  </div>
  <div class = "form-group">
  <h3>프로젝트 요청 세부사항</h3>
  <div style="width:50%;height: 200px;border:1px solid black;overflow-y:scroll;">${project.project_contents}	 
					<!-- 크기고정시키고 스크롤 넣을것 -->					 
				</div>	
  </div>
  <div class = "form-group"></div>
  <div class = "form-group"></div>
  
  
  
  <a class = "btn btn-md btn-default"  href="./history_project_member_list?project_no=${project_no}">참여인원</a>
  <a class = "btn btn-md btn-default" href="./history_member_add?project_no=${project_no}">인원추가</a>
  <a class = "btn btn-md btn-default" href="./history_project_end?project_no=${project_no}">프로젝트 종료</a>
  
  </div>
  </div>
  </body>
</html>