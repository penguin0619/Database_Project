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
  
  <div class = "container" style="margin-top: 100px;">
  
<div class = "form-group">
<label for="user_id" class="sr-only" style="margin-top: 100px;" >User ID</label>
	<h3>프로젝트명 : ${project.project_name}</h3>
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

  <h3>프로젝트요청 세부사항</h3><br>
  <div style="width:50%;height: 200px;border:1px solid black;overflow-y:scroll;">
  ${project.project_contents}
  </div><!-- 크기고정시키고 스크롤 넣을것 -->
  <br>
	<div class = "form-group">결재요청자 : ${request_approval_name}</div>
	<div class = "form-group">결재현황 : ${approval.approval_checknum} / ${approval.approval_max_num}</div>
	<div class = "form-group">승인 : ${approval.approval_count} / ${approval.approval_max_num}</div>
	<c:if test="${approval_is eq '0'}">
	<form id="form" method="post" action="./approval_select">
	
	
	<div class = "form-group">의견<br>
	
	<input type="hidden" name="project_request_no" id="project_request_no" value="${project.project_request_no}"/>
	<input type="hidden" name="select" id="select" value=""/>
	
	<div >
	<textarea style="width:50%;height: 100px" id="opinion" name="opinion"></textarea>
	</div>
	</div>
	<button class = "btn btn-md btn-default"  id="approval" type="button"  onclick="form_approval('#form');">승인</button> 
	<button class = "btn btn-md btn-default"  id="refusal"  type="button"  onclick="form_refusal('#form');">기각</button>
	</form>	
	</c:if>
	<c:if test="${approval_is eq '1'}">
	<div>이미 결재하셨습니다.</div>
	</c:if>
</div>

  
	
	
</div>
  </body>
</html>