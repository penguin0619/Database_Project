<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>스프링프레임워크 게시판</title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value="/resources/js/approval_req_filter.js" />"></script>

</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<div class="navbar navbar-inverse navbar-fixed-top">

		<div class="navbar-header">

			<a class="navbar-brand" href="#">프람트소프트웨어</a>
		</div>
	</div>


	<div class="container">
		<div style="margin-top: 100px;"
			style="display:inline_block:text_align:center;">
			<h2>프로젝트 상세정보</h2>
			<ul style="list-style-type: circle">

				<li><strong>프로젝트명 :</strong> ${project.project_name}</li>
				<li><strong>회사명 :</strong> ${project.project_company_name}</li>
				<li><strong>프로젝트 시작희망날짜 :</strong>
					${fn:substring(project.project_hope_start_date,0,4)}년
					${fn:substring(project.project_hope_start_date,5,7)}월
					${fn:substring(project.project_hope_start_date,8,10)}일</li>
				<li><strong>프로젝트 종료희망날짜 :</strong>
					${fn:substring(project.project_hope_end_date,0,4)}년
					${fn:substring(project.project_hope_end_date,5,7)}월
					${fn:substring(project.project_hope_end_date,8,10)}일</li>
				<li><strong>우편번호 :</strong> ${project.project_postcode}</li>
				<li><strong>주소 :</strong> ${project.project_address}</li>
				<li><strong>상세주소 :</strong> ${project.project_address_detail}</li>
				<li><strong>요청상태 :</strong> ${project.project_status}</li>
			</ul>
			<span><strong>프로젝트요청 세부사항</strong></span>
			<div style="width:50%;height: 200px;border:1px solid black;overflow-y:scroll;">${project.project_contents}</div>
			<!-- 크기고정시키고 스크롤 넣을것 -->

		<c:if test="${project.project_status eq '대기중'}">
		<sec:authorize access="hasRole('ROLE_SECRETARY')">
			<form id="form" method="post" action="./request_approval">
				<input type="hidden" id="no" name="no"
					value="${project.project_request_no}" />
				<div>
					<span><strong>의견</strong></span><br>
					<textarea rows="15" cols="50" id="opinion" name="opinion"></textarea>
				</div>
				<button id="save" type="button" onclick="form_save('#form');">결재요청</button>
			</form>
			</sec:authorize>
		</c:if>
		</div>
	</div>
   </body>
</html>