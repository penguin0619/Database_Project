<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 회원가입</title>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="<c:url value="/resources/js/signup_filter.js" />"></script>
  </head>
  <body>
  <h1>회원가입페이지</h1>
  <form id="form" method="post" action="./signup_ok">
  <div>
  <span>회원 아이디</span>
  <input type="text" id="member_id" name="member_id" value="${object.member_id}" />
  </div>
  <div>
  <span>회원이름</span>
  <input type="text" id="member_name" name="member_name" value="${object.member_name}" />
  </div>
  <div>
  <span>최종학력</span>
  <select id="member_degree" name="member_degree">
  <option value="고졸">고졸</option>
  <option value="대졸">대졸</option>
  <option value="석사">석사</option>
  <option value="박사">박사</option>
</select>
  </div>
  <div>
  <span>비밀번호</span>
  <input type="password" id="member_password" name="member_password" value="${object.member_password}" />
  </div>
  <div>
  <span>주민번호</span>
  <input type="text" id="personal_id_front" name="personal_id_front" maxlength="6" value="${object.personal_id_front}" />
  <input type="password" id="personal_id_end" name="personal_id_end" maxlength="7" value="${object.personal_id_end}" />
  
  </div>
 

  <div>
  <button id="save" type="button" onclick="form_save('#form');">가입</button>
  <a href="./">회원목록</a>
  </div>
  </form>
  </body>
</html>