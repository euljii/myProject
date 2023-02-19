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
			<h1>기업회원 비밀번호 찾기</h1>
		</div>
		<br>
		<form class="user" action="/Member/findPwFormC" method="post">
			<div style="padding: 100px 95px 100px 95px; border: 1px solid #e9e9e9; text-align: center;">
				<p>등록된 회원정보를 입력해주세요!</p>
				<br><br>
				<ul>
					<li class="information">
						<div class="wrap_lab">
							아이디
						</div>
						<div class="wrap_input">
							<input type="text" id="c_id" aria-describedby="IdHelp"name="c_id">
						</div>
					</li>
					<li class="information">
						<div class="wrap_lab">
							사업자등록번호
						</div>
						<div class="wrap_input">
							<input type="text" id="c_code" aria-describedby="IdHelp"name="c_code" placeholder=" '-'없이 입력 ">
						</div>
					</li>
					<li class="information">
						<div class="wrap_lab">
							담당자 이름
						</div>
						<div class="wrap_input">
							<input type="text" id="c_dname" aria-describedby="IdHelp"name="c_dname">
						</div>
					</li>
					<li class="information">
						<div class="wrap_lab">
							이메일 주소
						</div>
						<div class="wrap_input">
							<input type="email" id="c_demail" aria-describedby="emailHelp" name="c_demail">
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
	$(function () {
		var msg = '${msg}';
		
		if (msg != "") {
			alert(msg);
		}
		$("#findPw").click(function () {
			$(".user").attr("action", "/Member/findPwFormC");
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



