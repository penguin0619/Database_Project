<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 게시판</title>
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
  <input type="text" id="member_degree" name="member_degree" value="${object.member_degree}" />
  </div>
  <div>
  <span>비밀번호</span>
  <input type="password" id="member_password" name="member_password" value="${object.member_password}" />
  </div>
  <div>
  <span>주민번호</span>
  <input type="text" id="personal_id" name="personal_id_front" value="${object.personal_id_front}" />
  <input type="password" id="personal_id" name="personal_id_end" value="${object.personal_id_end}" />
  
  </div>
 

  <div>
  <input type="submit" value="가입" />
  <a href="./">회원목록</a>
  </div>
  </form>
  </body>
</html>