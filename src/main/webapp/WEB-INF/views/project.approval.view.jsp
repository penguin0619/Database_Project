<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 게시판</title>
  	 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
     <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
     <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
     <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="<c:url value="/resources/js/approval_req_filter.js" />"></script> 
  
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
  <c:if test="${project.project_status eq '대기중'}">
  <form id="form" method="post" action="./request_approval">
  <input type="hidden" id="no" name="no" value="${project.project_request_no}"/>     
  <div><span>의견</span><br><textarea rows="15" cols="50" id="opinion" name="opinion"></textarea></div>
  <button id="save" type="button" onclick="form_save('#form');">결재요청</button>
  </form>  
  </c:if>  

	<div>결재요청자 : ${request_approval_name}</div>
	<div>결재현황 : ${approval.approval_checknum} / ${approval.approval_max_num}</div>
	<div>승인 : ${approval.approval_count} / ${approval.approval_max_num}</div>
	<div><span>의견</span><br> <textarea></textarea></div>
	<button>결재승인</button> <button>결재거부</button>

  </body>
</html>