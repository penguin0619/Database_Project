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
    <script src="<c:url value="/resources/js/modify_appraise_member.js" />"></script>
    
  </head>
  <body>
  <form id="form" method="POST" action="./modify_appraise_member">
   	<!-- 상단 네비게이션 바 -->
<div class="navbar navbar-inverse navbar-fixed-top">
     
        <div class="navbar-header">
             
          <a class="navbar-brand" href="#">프람트소프트웨어</a>
       
        </div>
</div>
	
	<div class="container">
	<div style="margin-top: 100px;">
		<h1></h1>
		<div class="table-responsive">
			<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">이름/역할</th>
      <th scope="col">평가구분</th>
      <th scope="col">업무수행평가</th>
      <th scope="col">커뮤니케이션 평가</th>
      <th scope="col">참고사항</th>
    </tr>
    </thead>
	
    <tbody>
    <!-- 목록이 반복될 영역 -->
    <c:forEach var="item" items="${list}" varStatus="status">
    <tr>
      
     
      <td>
      ${item.member_name} - ${item.role}
      <input type="hidden" name="member_no${status.index}" id="member_no${status.index}" value="${item.member_no}">
      <input type="hidden" name="appraiser_code${status.index}" id="appraiser_code${status.index}" value="${item.appraiser_code}">
      </td>
      <td>${item.appraiser_type}  </td>
      <td>
      <select id="performance${status.index}"  name="performance${status.index}" size="1">
      <option value="5">매우좋음</option>
      <option value="4">좋음</option>
      <option value="3">보통</option>
      <option value="2">나쁨</option>
      <option value="1">매우나쁨</option>
      </select>
      </td>
      <td>
      <select id="communication${status.index}" name="communication${status.index}" size="1">
      <option value="5">매우좋음</option>
      <option value="4">좋음</option>
      <option value="3">보통</option>
      <option value="2">나쁨</option>
      <option value="1">매우나쁨</option>
      </select>
      </td>
      <td><input type="text" id="detail${status.index}" name="detail${status.index}" size=30></td>
    </tr>
    <c:if test="${status.last}">
    <input type="hidden" name="list_num" id="list_num" value="${status.count}">
        
    </c:if>
    </c:forEach>
    </tbody>
  </table>
  </div>
</div>
		<div>
		 <input type="hidden" name="project_no" id="project_no" value="${project_no}">
 	     <input type="hidden" name="appraise_content" id="appraise_content" value="">
		
			<input type="button" class="btn btn-default" value="제출" onclick="form_save('#form');"/>
			<a href="./mypage" class="btn btn-default" role="button">마이페이지</a>			
		
		</div>
	</div>
	</form>
</body>
</html>