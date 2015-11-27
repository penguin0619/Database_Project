<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
     <head>
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Spring security</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
     <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
     <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
     
     

    
        <script>

     function get_msg(message) {
          var move = '70px';
          jQuery('#message').text(message);
          jQuery('#message').animate({
               top : '+=' + move
          }, 'slow', function() {
               jQuery('#message').delay(1000).animate({ top : '-=' + move }, 'slow');
          });
     }

     <c:if test="${error == 'true'}">
     jQuery(function() {
          get_msg("로그인 실패하였습니다.");
     });

     </c:if>

     function signin() {
          $.ajax({
               url : './j_spring_security_check',
               data: $('form input').serialize(),
               type: 'POST',
               dataType : 'json',
               beforeSend: function(xhr) {
                    xhr.setRequestHeader("Accept", "application/json");
               }
          }).done(function(body) {

               var message = body.response.message;
               var error = body.response.error;
               if (error) get_msg(message);

               if (error == false) {
                    var url = '${referer}';
                    if (url == '') url = '<c:url value="/mypage" />';
                    location.href = url;
               }

          });

     }
     </script>
 

     </head>

<body>


     

 

<div class="navbar navbar-inverse navbar-fixed-top">
      
        <div class="navbar-header">
             
          <a class="navbar-brand" href="#">프람트소프트웨어</a>
        </div>
        </div>


<div class = "container" style="margin-top: 100px;">

  
     
<div class ="alert-danger"  role = "alert">
	<div id="message" style="width:300px;position:absolute; top:22px; border: 1px;border-color: #000;"></div>
     
</div>

     
     <form class = "form-sigin" id="form" action="./j_spring_security_check" method="post">
      <h2 class="form-signin-heading">시스템에 접속하시려면 로그인 해주세요.</h2>
      <label for="user_id" class="sr-only">User ID</label>
      <input type="text" id="user_id" class = "form-control" placeholder = "User ID" name="user_id">
      <label for="password" class="sr-only">Password</label>
      <input type="password" id="password" class = "form-control" placeholder = "Password" name="password">
     <button class="btn btn-lg btn-primary btn-block"  type="button" onclick="signin();">로그인</button>
     <button class="btn btn-lg btn-primary btn-block"  type="button" onclick = "location.href='./signup'">회원가입</button>
     </form>

     </div>
   
     


     </body>

</html>