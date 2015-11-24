<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 회원가입</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>	
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="<c:url value="/resources/js/signup_filter.js" />"></script>
    <script src="<c:url value="/resources/js/skillset.js" />"></script>
    <script src="<c:url value="/resources/js/career.js" />"></script>      
  	
  </head>
  <body>
  <h1>회원가입페이지</h1>
  <form id="form" method="post" action="./signup_ok">
  <div>
  <span>회원 아이디</span>
  <input type="text" id="member_id" name="member_id" value="${memberVo.member_id}" onkeyup="dup_check()" />
  <span id="duplicateResult"></span>
  <input type="hidden" id="dup_ok" name="dup_ok" value="true"/>
  </div>
  <div>
  <span>회원이름</span>
  <input type="text" id="member_name" name="member_name" value="${memberVo.member_name}"/>
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
  <input type="password" id="member_password" name="member_password" value="${memberVo.member_password}" />
  </div>
  <div>
  <span>주민번호</span>
  <input type="text" id="personal_id_front" name="personal_id_front" maxlength="6" value="${memberVo.personal_id_front}" />
  <input type="password" id="personal_id_end" name="personal_id_end" maxlength="7" value="${memberVo.personal_id_end}" />
  </div>
  <div>
  <span>휴대번호</span>
  <input type="text" name="member_cellphone" id="member_cellphone" value="${memberVo.member_cellphone}" onkeyup="cell_check()" maxlength="13"  />
  </div>
  <div>
  <span>기술목록</span> 
  <input type='button' value='목록추가' id='add_skill'>
  <input type='button' value='목록제거' id='remove_skill'>
  <div id='skill_set'></div>
  <input type="hidden" id="member_skillset" name="member_skillset" value="${memberVo.member_skillset}"/>
  <input type="hidden" id="skill_counter" name="skill_counter" value=""/>
  </div>
  
  <div>
  <span>이전경력</span>
  <input type='button' value='경력추가' id='add_career'>
  <input type='button' value='경력제거' id='remove_career'>
   <div id='career_set'></div>
   <input type="hidden" id="career_content" name="career_content" value=""/>
   <input type="hidden" id="career_count" name="career_count" value=""/>
  </div>
 

  <div>
  <button id="save" type="button" onclick="form_save('#form');">가입</button>
  <a href="./">회원목록</a>
  </div>
  </form>
  </body>
</html>