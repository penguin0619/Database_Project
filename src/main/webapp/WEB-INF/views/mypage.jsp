<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
     <head>
     <meta charset="utf-8">
     
     <title>Spring security</title>

     <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
     <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
     </head>

     <body>

     <h1>${user_name} 로그인 중</h1>
	 <a href="./list">회원목록</a>
	 <a href="./signout">로그아웃</a>
	 
     </body>

</html>