<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findIdPw.css">

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
	<div style="width: 70%; margin: 0 auto;">
		<div class="text-center">
			<h1>개인 비밀번호 찾기</h1>
		</div>
		<br>
		<form class="user" action="/Member/findPwFormP" method="post">
			<div style="padding: 100px 95px 100px 95px; border: 1px solid #e9e9e9; text-align: center;">
				<p>회원정보에 등록된 정보로 비밀번호를 찾을 수 있습니다.</p>
				<br>
				<br>
				<ul>
					<li class="information">
						<div class="wrap_lab">
							아이디
						</div>
						<div class="wrap_input">
							<input type="text" id="m_id" aria-describedby="IdHelp"name="m_id">
						</div>
					</li>
					<li class="information">
						<div class="wrap_lab">
							이름
						</div>
						<div class="wrap_input">
							<input type="text" id="m_name" aria-describedby="IdHelp"name="m_name">
						</div>
					</li>
					<li class="information">
						<div class="wrap_lab">
							이메일 주소
						</div>
						<div class="wrap_input">
							<input type="email" id="m_email" aria-describedby="emailHelp" name="m_email">
						</div>
					</li>
				</ul>
				<div style="text-align: center;">
					<input type="button" id="findPw" name="findPw" value="비밀번호 찾기">
				</div>
			</div>
		</form>
		<div class="buttons">
			<button id="login" style="width:70px;">로그인</button>
			<button id="join" style="width:70px;">회원가입</button>
			<button id="freq" style="width: 102px;">자주 찾는 질문</button>
			<p>위 방법으로 계정을 찾을수 없다면, 고객센터로 직접 문의 주시기 바랍니다.</p>
		</div>
	</div>

</section>
<script type="text/javascript">
	var msg = '${msg}';
	
	if (msg != "") {
		alert(msg);
	}
	$(function () {
		$("#findPw").click(function () {
			$(".user").attr("action", "/Member/findPwFormP");
			$(".user").submit();
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
	})
</script>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



