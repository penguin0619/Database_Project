<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 게시판</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    
    
  </head>
  <body>
  
  	<!-- 상단 네비게이션 바 -->
<div class="navbar navbar-inverse navbar-fixed-top">

        <div class="navbar-header">
             
          <a class="navbar-brand" href="#">프람트소프트웨어</a>
        </div>
        </div>

  
   <div class="container" >
      <div style="margin-top: 100px;">
      <div class = "form-group">
      <strong>사원명 :</strong> ${member.member_name}
      </div>
      
      <div class = "form-group">
      <strong>직책 :</strong> ${member.position_type}
      </div>
      <div class = "form-group">
      <strong>생년월일 :</strong> ${fn:substring(member.member_personal_id,0,2)}년
  			   ${fn:substring(member.member_personal_id,2,4)}월
  			   ${fn:substring(member.member_personal_id,4,6)}일
  	</div>
      <div class = "form-group">
      <strong>최종학력 :</strong> ${member.member_degree}
      </div>
      <div class = "form-group">
      <strong>전화번호 :</strong> ${member.member_cellphone}
      </div>
      <div class = "form-group">
      <strong>기술목록 :</strong> ${member.member_skillset}
      </div>
      <div class = "form-group">
      </div>
      <div class = "form-group">
      <c:if test="${empty career}"><strong>경력유무 :</strong> 신입</c:if>
  <c:if test="${not empty career}"><strong>경력유무 : 경력</strong></c:if>
  	<br>	
  <c:forEach var="item" items="${career}" varStatus="status">
  <ul style="list-style-type:square">
  <li><strong>회사이름 :</strong> ${item.before_company_name}</li>
  <li><strong>직위 :</strong> ${item.position}</li>
  <li><strong>근무기간 :</strong> ${fn:substring(item.work_at_date,0,4)}년 
  			   ${fn:substring(item.work_at_date,5,7)}월 ~ 
  			   ${fn:substring(item.work_end_date,0,4)}년 
  			   ${fn:substring(item.work_end_date,5,7)}월
  </li>
  
  </ul>
  </c:forEach>
  <div class = "form-group">
      <c:if test="${empty history}"><strong>프로젝트유무 :</strong> 없음</c:if>
  <c:if test="${not empty history}"><strong>프로젝트유무 :</strong> 있음</c:if> 
  </div>
  <c:forEach var="item" items="${history}" varStatus="status"> 
  <div><H4>${status.count}. <strong>${item.project_name}</strong>
  [${item.role}]
  (${item.project_start_date} ~ <c:if test="${item.project_end_date ne '1111-11-11'}">${item.project_end_date}</c:if>)
  <c:if test="${item.project_end_date ne '1111-11-11'}">
  <a class = "btn btn-sm btn-default" href="./appraise_score_view?member_no=${item.member_no}&project_no=${item.project_no}">평가기록</a>
  </c:if>
  </H4>
  </div>
  </c:forEach>
</div>
</div>
</div>

  </body>
</html>