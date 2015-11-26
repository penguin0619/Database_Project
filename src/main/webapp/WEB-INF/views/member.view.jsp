<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 게시판</title>
  </head>
  <body>
  <ul style="list-style-type:circle">
  <li>사원명 : ${member.member_name}</li>
  <li>직책 : ${member.position_type}</li>
  <li>생년월일 : ${fn:substring(member.member_personal_id,0,2)}년
  			   ${fn:substring(member.member_personal_id,2,4)}월
  			   ${fn:substring(member.member_personal_id,4,6)}일
  </li>
  <li>최종학력 : ${member.member_degree}</li>
  <li>전화번호 : ${member.member_cellphone}</li>
  <li>기술목록 : ${member.member_skillset}</li>
  <c:if test="${empty career}"><li>경력유무 : 신입</li></c:if>
  <c:if test="${not empty career}"><li>경력유무 : 경력</li></c:if>		
  <c:forEach var="item" items="${career}" varStatus="status">
  <ul style="list-style-type:square">
  <li>회사이름 : ${item.before_company_name}</li>
  <li>직위 : ${item.position}</li>
  <li>근무기간 : ${fn:substring(item.work_at_date,0,4)}년 
  			   ${fn:substring(item.work_at_date,5,7)}월 ~ 
  			   ${fn:substring(item.work_end_date,0,4)}년 
  			   ${fn:substring(item.work_end_date,5,7)}월
  </li>
  </ul>
  </c:forEach> 
</ul>
  </body>
</html>