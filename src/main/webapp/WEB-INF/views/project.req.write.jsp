<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
     <head>
     <meta charset="utf-8">

     <title>Spring security</title>
	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
	 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
     <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
     <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
     <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
     <script src="<c:url value="/resources/js/career.js" />"></script>
	 <script src="<c:url value="/resources/js/address.js" />"></script> 
	 <script src="<c:url value="/resources/js/project_req_filter.js" />"></script> 
     </head>

     <body>
    <!--  /project_write_ok -->
     	<h1>프로젝트요청 페이지</h1>
     	<form id="form" method="post" action="./project_write_ok">
		<div><span>프로젝트명</span> <input type="text" id="project_name" name="project_name" value="${object.project_name}"></div>
		<div><span>회사명</span> <input type="text" id="project_company_name" name="project_company_name" value="${object.project_company_name}"></div>
		<div><span>프로젝트 시작희망날짜</span><br><input type="text" id="project_hope_start_date" name="project_hope_start_date" class="datepicker" maxlength="8" value="${object.project_hope_start_date}"></div>
		<div><span>프로젝트 종료희망날짜</span><br><input type="text" id="project_hope_end_date" name="project_hope_end_date" class="datepicker" maxlength="8" value="${object.project_hope_end_date}"></div>
		<div>
		<span>주소입력</span><br>
		<input type="text" id="project_postcode" name="project_postcode" value="${object.project_postcode}" placeholder="우편번호">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="project_address" name="project_address" value="${object.project_address}" placeholder="주소">
		<input type="text" id="project_address_detail" name="project_address_detail" value="${object.project_address_detail}" placeholder="상세주소">
		</div>
		<div><span>프로젝트세부사항</span><br><textarea rows="15" cols="50" id="project_contents" name="project_contents">${object.project_contents}</textarea></div>
		<button id="save" type="button" onclick="form_save('#form');">작성완료</button>
		</form>