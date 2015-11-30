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
  <ul style="list-style-type:circle">
  <li>프로젝트명 : ${project.project_name}</li>
  <li>회사명 : ${project.project_company_name}</li>
  <li>프로젝트 시작희망날짜 : ${fn:substring(project.project_hope_start_date,0,4)}년
  			   ${fn:substring(project.project_hope_start_date,5,7)}월
  			   ${fn:substring(project.project_hope_start_date,8,10)}일
  </li>
  <li>프로젝트 종료희망날짜 : ${fn:substring(project.project_hope_end_date,0,4)}년
  			   ${fn:substring(project.project_hope_end_date,5,7)}월
  			   ${fn:substring(project.project_hope_end_date,8,10)}일
  </li>
  <li>우편번호 : ${project.project_postcode}</li>
  <li>주소 : ${project.project_address} </li>
  <li>상세주소 : ${project.project_address_detail}</li>
  <li>요청상태 : ${project.project_status}</li>
  </ul>
  <span>프로젝트요청 세부사항</span>
  <div>${project.project_contents}</div><!-- 크기고정시키고 스크롤 넣을것 -->
	<div>결재요청자 : ${request_approval_name}</div>
	<div>결재현황 : ${approval.approval_checknum} / ${approval.approval_max_num}</div>
	<div>승인 : ${approval.approval_count} / ${approval.approval_max_num}</div>
	<c:if test="${approval_is eq '0'}">
	<form id="form" method="post" action="./approval_select">
	<div><span>의견</span><br>
	<input type="hidden" name="project_request_no" id="project_request_no" value="${project.project_request_no}"/>
	<input type="hidden" name="select" id="select" value=""/>
	<textarea rows="10" cols="30" id="opinion" name="opinion"></textarea></div>
	<button id="approval" type="button"  onclick="form_approval('#form');">승인</button> 
	<button id="refusal"  type="button"  onclick="form_refusal('#form');">기각</button>
	</form>	
	</c:if>
	<c:if test="${approval_is eq '1'}">
	<div><span>이미 결재하셨습니다</span></div>
	</c:if>
  </body>
</html>