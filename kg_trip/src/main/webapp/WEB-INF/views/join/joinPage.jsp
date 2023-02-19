<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findIdPw.css">

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<section class="cont" style="min-height: 550px; padding-top: 0px;">
	<div style="text-align: center; margin: 0px 0px 40px 0px;">
		<h2>회원가입을 환영합니다.</h2>
		<p>이미 계정이 있으신가요 ? 지금 <a href="/Member/login" style="color: #28c3a5; font-weight: bold;">로그인</a>을 해주세요.</p>
	</div>
	<div style="display: flex; justify-content: center;">
		<div class="joinBox" style="display: flex; justify-content: space-around; padding: 55px; margin: 10px; width: 800px; border: 1px solid #e9e9e9;">
			<div class="publicJoin" style=" margin: 55px; width: 50%; text-align: center;">
				<img src="/img/public.png" style="width: 80px;">
				<h3>개인회원</h3>
				<input type="button" id="joinBtnP" value="가입하기">
			</div>
			<div class="corpJoin" style=" margin: 55px; width: 50%;text-align: center;">
				<img src="/img/corp.png" style="width: 80px;">
				<h3>기업회원</h3>
				<input type="button" id="joinBtnC" value="가입하기">
			</div>
		</div>
	</div>
</section>

	<script type="text/javascript">
	$(function () {
		$("#joinBtnP").click(function () {
			location.href = "/Member/join/joinFormP";
		});
		$("#joinBtnC").click(function () {
			location.href = "/Member/join/joinFormC";
		});
		
	});
	</script>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



