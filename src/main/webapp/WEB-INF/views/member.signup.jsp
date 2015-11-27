<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>스프링프레임워크 회원가입</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>	
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="<c:url value="/resources/js/signup_filter.js" />"></script>
    <script src="<c:url value="/resources/js/skillset.js" />"></script>
    <script src="<c:url value="/resources/js/career.js" />"></script>      
  	
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
  		<h1>회원가입페이지</h1>
  			<form id="form" method="post" action="./signup_ok">
	  		 
	  		  		
	  			<div class="form-group">
	  			<label for="member_id" class="col-sm-2 control-label">회원 ID</label>
	  			
	  			<!-- <span>회원 아이디</span> -->
	  			<input type="text" id="member_id" name="member_id" value="${memberVo.member_id}" onkeyup="dup_check()" />
	  			
	  			<span id="duplicateResult"></span>
			    <input type="hidden" id="dup_ok" name="dup_ok" value="true"/>
			     </div>
			  		  
			  
			<div class = "form-group">
			<label for="member_name" class="col-sm-2 control-label">회원 이름</label>
			  <!-- <span>회원이름</span>-->
			  <input type="text" id="member_name" name="member_name" value="${memberVo.member_name}"/>
			  </div>
			  
			  
			  <div class = "form-group">
			 
			 <label for="member_degree" class="col-sm-2 control-label">최종학력</label>
			 
			  <select id="member_degree"  name="member_degree">
			  <option value="고졸">고졸</option>
			  <option value="대졸">대졸</option>
			  <option value="석사">석사</option>
			  <option value="박사">박사</option>
			</select>
			  </div>
			 
			  
			  
			  
			  <div class = "form-group">
			 	<label for="password" class="col-sm-2 control-label">비밀번호</label>
			  <input type="password" id="member_password" name="member_password" value="${memberVo.member_password}" />
			  </div>
			  
			  
			  <div class = "form-group">
			  <label for="personal_ID" class="col-sm-2 control-label">주민번호</label>
			  <input type="text" id="personal_id_front" name="personal_id_front" maxlength="6" value="" />
			  <input type="password" id="personal_id_end" name="personal_id_end" maxlength="7" value="" />
			  <input type="hidden" id="member_personal_id" name="member_personal_id" value="${memberVo.member_personal_id}"/>
			  </div>
			  
			  
			  
			  <div class = "form-group">
			  <label for="member_cellphone" class="col-sm-2 control-label">핸드폰번호</label>
			  <input type="text" name="member_cellphone" id="member_cellphone" value="${memberVo.member_cellphone}" onkeyup="cell_check()" maxlength="13"  />
			  </div>
			  
			  
			  
			  <div class = "form-group">
			  <label for="skillset" class="col-sm-2 control-label">기술목록</label> 
			   <button type="button" id='add_skill' class="btn btn-sm btn-primary">목록추가</button>
			   <button type="button" id='remove_skill' class="btn btn-sm btn-primary">목록제거</button>
			  
			  <div id='skill_set' class = "form-group"   style="margin-top: 10px;">
			  <div>
			  
			  <input type="hidden" class = "form-group" id="member_skillset" name="member_skillset" value="${memberVo.member_skillset}"/>
			  <input type="hidden" class = "form-group"  id="skill_counter" name="skill_counter" value=""/>
			  </div>
			  </div>
			  </div>
			  
			  
			  <div class = "form-group">
			  <label for="career" class="col-sm-2 control-label">이전 경력</label> 
			   <button type="button" id='add_career' class="btn btn-sm btn-primary">경력추가</button>
			    <button type="button" id='remove_career' class="btn btn-sm btn-primary">경력제거</button>
			
			   <div id='career_set' style="margin-top: 10px;"></div>
			   <input type="hidden" id="career_content" name="career_content" value=""/>
			   <input type="hidden" id="career_counter" name="career_counter" value=""/>
			  </div>
		
			 
			 <div class="col-sm-6">
			  
			  <button class="btn btn-lg btn-primary btn-block" id="save" type="button" onclick="form_save('#form');">회원가입</button>
			 
			  </div>
  		</form>
  </div>
  </div>
 
  </body>
</html>