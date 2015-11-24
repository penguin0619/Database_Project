<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>스프링프레임워크 회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="<c:url value="/resources/js/signup_filter.js" />"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </head>
  
  <body>
  <!-- 상단 네비게이션 바 -->
<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <!-- 브라우저가 좁아졋을때 나오는 버튼(클릭시 메뉴출력) -->
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">프람트소프트웨어</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">홈으로</a></li>
            <li><a href="#about">여기엔 </a></li>
            <li><a href="#contact">뭘넣지??</a></li>
            <li><a href="#contact">과제가</a></li>
            <li><a href="#contact">잘됬으면 좋겠당</a></li>
          </ul>
        </div>
      </div>
</div>
<!-- 
<div class="contentwrap">
  <article class="container">
    <div class="page-header">
    <div style="margin-top: 100px;">
	  <h1>회원가입</h1>
    </div>
    <form class="form-horizontal">
    <div class="form-group">
    <label for="회원 ID" class="col-sm-2 control-label">회원 ID</label>
    <div class="col-sm-6">
    <input type="text" id="member_id" name="member_id" value="${object.member_id}" onkeyup="dup_check()" />
    </div>
    </div>
    <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-6">
    <input type="password" id="member_password" name="member_password" value="${object.member_password}" />
    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
    </div>
    </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"> 회원이름</label>
    <div class="col-sm-6">
    <input type="text" id="member_name" name="member_name" value="${object.member_name}" />
    </div>
    </div>
    <div class="form-group">
    <label for="degree" class="col-sm-2 control-label">최종학력</label>
    <div class="col-sm-6">
    <select id="member_degree" name="member_degree">
    <option value="고졸">고졸</option>
    <option value="대졸">대졸</option>
    <option value="석사">석사</option>
    <option value="박사">박사</option>
    </select>
    </div>
    </div>
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">주민번호</label>
    <div class="col-sm-3">
    <input type="text" id="personal_id_front" name="personal_id_front" maxlength="6" value="${object.personal_id_front}" />
    </div>
    <div class="col-sm-3">
    <input type="password" id="personal_id_end" name="personal_id_end" maxlength="7" value="${object.personal_id_end}" />
    </div>
    </div>
 
    <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label"></label>
    <div class="col-sm-6">
      <button class="btn btn-lg btn-primary btn-block"  id="save"  onclick="form_save('#form');">회원가입      
      </button>
    </div>
    </div>
    </form>
    </div>
  </article>
  <a href="./">회원목록</a>
  
</div>


 -->





 
<div class="container">
      <div style="margin-top: 100px;">
        
  <h1>회원가입페이지</h1>
  <form id="form" method="post" action="./signup_ok">
  <div>
  <span>회원 아이디</span>
  <input type="text" id="member_id" name="member_id" value="${object.member_id}" onkeyup="dup_check()" />
  <span id="duplicateResult"></span>
  <input type="hidden" id="dup_ok" name="dup_ok" value="true"/>
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
   </div>
</div>



  </body>
</html>