<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <th scope="col">Member_No</th>
      <th scope="col">Member_ID</th>
      <th scope="col">Member_Pos_Code</th>
      <th scope="col">Member_Name</th>
      <th scope="col">Member_Degree</th>      
      <th scope="col">Memeber_Password</th>
      <th scope="col">Personal_ID_Front</th>
      <th scope="col">Personal_ID_End</th>
    </tr>
    </thead>

    <tbody>
    <!-- 목록이 반복될 영역 -->
    <c:forEach var="item" items="${list}" varStatus="status">
    <tr>
      <td>${item.member_no}</td>
      <td>${item.member_id}</td>
      <td>${item.member_pos_code}</td>
      <td>${item.member_name}</td>
      <td>${item.member_degree}</td>
      <td>${item.member_password}</td>
      <td>${item.personal_id_front}</td>
      <td>${item.personal_id_end}</td>
    </tr>
    </c:forEach>

    </tbody>

  </table>
  <div><a href="./signup">회원가입</a></div>
  </body>
</html>