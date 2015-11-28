<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 게시판</title>
  </head>
  <body>
  <h1></h1>
  <table border="1">
    <colgroup>
  <col width="60"><col><col width="115"><col width="85">
  </colgroup>
  <thead>
    <tr>
      <th scope="col">요청번호</th>
      <th scope="col">프로젝트이름</th>
      <th scope="col">회사명</th>
      <th scope="col">요청날짜</th>
      <th scope="col">상태</th>
    </tr>
    </thead>
	
    <tbody>
    <!-- 목록이 반복될 영역 -->
    <c:forEach var="item" items="${list}" varStatus="status">
    <tr onclick="location.href='./request_project_view?no=${item.project_request_no}'">
      <td>${item.project_request_no}</td>
      <td>${item.project_name}</td>
      <td>${item.project_company_name}</td>
      <td>${item.project_register_date}</td>
      <td>${item.project_status}</td>
    </tr>
    </c:forEach>
    </tbody>
  </table>
  
  
  
  <c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="startPage" value="${pageGroupSize*(numPageGroup-1)+1}"/>
   <c:set var="endPage" value="${startPage + pageGroupSize-1}"/>
   <c:if test="${endPage > pageCount}" >
     <c:set var="endPage" value="${pageCount}" />
   </c:if>          
   <c:if test="${numPageGroup > 1}">
        <a href="./request_project_list?pageNum=${(numPageGroup-2)*pageGroupSize+1 }">[이전]</a>
   </c:if>
   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="./request_project_list?pageNum=${i}">  
          <c:if test="${currentPage == i}">          
        </c:if>
        [ ${i} ]
       </a>
   </c:forEach>
   <c:if test="${numPageGroup < pageGroupCount}">
        <a href="./request_project_list?pageNum=${numPageGroup*pageGroupSize+1}">[다음]</a>
   </c:if>
</c:if>
  <div><a href="./mypage">마이페이지</a></div>
  </body>
</html>