<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" >
    <title>스프링프레임워크 게시판</title>
    
    
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
     <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
     <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  </head>
  <body>
  <div class = "container">
  <h1></h1>
  <div class = "table-responsive">
  <table class ="table table-hover">
  
   <thead>
    <tr>
      <th scope="col">Member_No</th>
      <th scope="col">Member_ID</th>
      <th scope="col">Member_Pos_Code</th>
      <th scope="col">Member_Name</th>
      <th scope="col">Member_Degree</th>      
      <th scope="col">Memeber_Password</th>
      <th scope="col">Memeber_Cellphone</th>
      <th scope="col">Member_Personal_ID</th>
    </tr>
    </thead>

    <tbody>
    <!-- 목록이 반복될 영역 -->
    <c:forEach var="item" items="${list}" varStatus="status">
    <tr onclick="location.href='./member.view?no=${item.member_no}'">
      <td>${item.member_no}</td>
      <td>${item.member_id}</td>
      <td>${item.member_pos_code}</td>
      <td>${item.member_name}</td>
      <td>${item.member_degree}</td>
      <td>${item.member_password}</td>
      <td>${item.member_cellphone}</td>
      <td>${item.member_personal_id}</td>
    </tr>
    </c:forEach>
    </tbody>
  </table>
<<<<<<< HEAD
  </div>
=======
  
>>>>>>> b9efbbbf5409412d0899e45b81f2f865c56e0882

    <c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="startPage" value="${pageGroupSize*(numPageGroup-1)+1}"/>
   <c:set var="endPage" value="${startPage + pageGroupSize-1}"/>
   <c:if test="${endPage > pageCount}" >
     <c:set var="endPage" value="${pageCount}" />
<<<<<<< HEAD
   </c:if> 
   <ul class = "pagination">         
   <c:if test="${numPageGroup > 1}">
       <li><a href="./list?pageNum=${(numPageGroup-2)*pageGroupSize+1}">prev</a></li>
   </c:if>
   <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <li><a href="./list?pageNum=${i}">
          <c:if test="${currentPage == i}">          
        </c:if>
        ${i} 
       </a></li>
   </c:forEach>
   <c:if test="${numPageGroup < pageGroupCount}">
  <li><a href="./list?pageNum=${numPageGroup*pageGroupSize+1}">next</a></li>
=======
   </c:if>
   
   <ul class = "pagination">
   <c:if test="${numPageGroup > 1}">
    	<li><a href="./list?pageNum=${(numPageGroup-2)*pageGroupSize+1 }">prev</a></li>
   </c:if>
   <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <li> <a href="./list?pageNum=${i}">
          <c:if test="${currentPage == i}">          
        </c:if>
         ${i} 
       </a>
       </li>  
   </c:forEach>
   <c:if test="${numPageGroup < pageGroupCount}">
   <li><a  href="./list?pageNum=${numPageGroup*pageGroupSize+1}">next</a></li>
>>>>>>> b9efbbbf5409412d0899e45b81f2f865c56e0882
   </c:if>
   </ul>
</c:if>


<<<<<<< HEAD

  <div><a href="./mypage" class= "btn btn-default" role = "button">마이페이지</a></div>
=======
  <div>
  <a href="./mypage">마이페이지</a></div>
  </div>
>>>>>>> b9efbbbf5409412d0899e45b81f2f865c56e0882
  </body>
</html>