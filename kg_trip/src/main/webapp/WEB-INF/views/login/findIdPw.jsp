<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findIdPwform.css">


<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
	<div style="display: flex; justify-content: center;">
		<div style="width: 60%;">
			<h2 style="border-bottom: 1px solid #e9e9e9">아이디 / 비밀번호 찾기</h2>
			<p style="margin-top: 5px;">가입한 비밀번호와 아이디를 잊으셨습니까?</p>
			<div class="joinBox">
				<div class="publicFind">
					<div style="font-size: 32px; height: 90px; line-height: 90px; border: 1px solid #e9e9e9; border-bottom: none; border-radius: 2px;">개인회원</div>
					<div style="display: flex; justify-content: center; height: 60px; line-height: 60px;">
						<div id="findIdFormP" class="buttonB">아이디 찾기</div>
						<div id="findPwFormP" class="buttonB" style="border-left: none;">비밀번호 찾기</div>
					</div>
				</div>
				<div class="corpFind">
					<div style="font-size: 32px; height: 90px; line-height: 90px; border: 1px solid #e9e9e9; border-bottom: none; border-radius: 2px;">기업회원</div>
					<div style="display: flex; justify-content: center; height: 60px; line-height: 60px;">
						<div id="findIdFormC" class="buttonC">아이디 찾기</div>
						<div id="findPwFormC" class="buttonC" style="border-left: none;">비밀번호 찾기</div>
					</div>
				</div>
			</div>
			<div class="buttons">
				<button id="login" style="width: 70px;">로그인</button>
				<button id="join" style="width: 70px;">회원가입</button>
				<button id="freq" style="width: 102px;">자주 찾는 질문</button>
				<p>위 방법으로 계정을 찾을수 없다면, 고객센터로 직접 문의 주시기 바랍니다.</p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function () {
		$("#findIdFormP").click(function () {
			location.href = "/Member/help/findIdFormP";
		});
		$("#findIdFormC").click(function () {
			location.href = "/Member/help/findIdFormC";
		});
		$("#findPwFormP").click(function () {
			location.href = "/Member/help/findPwFormP";
		});
		$("#findPwFormC").click(function () {
			location.href = "/Member/help/findPwFormC";
		});
		$("#login").click(function () {
			location.href = "/Member/login";
		});
		$("#join").click(function () {
			location.href = "/Member/join";
		});
		$("#freq").click(function () {
			location.href = "/freq/list";
		});
		
	});
	</script>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



