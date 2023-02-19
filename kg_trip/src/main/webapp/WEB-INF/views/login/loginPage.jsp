<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loginform.css">

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->


<section class="cont3">
	<form method="post" id="login_all">
		<div style="text-align: center; margin: 0px 0px 40px 0px;">
			<h2>로그인 후 다양한 서비스를 이용해 보세요.</h2>
			<p>아직 계정이 없으신가요 ? 지금 <a href="/Member/join" style="color: #28c3a5; font-weight: bold;">회원가입</a>을 해주세요.</p>
		</div>
		<div style="display: flex; justify-content: center;">
			<div style="width: 600px;">
				<div class="login_tab" style="display: flex; justify-content: center;">
					<button type="button" id="publicBtn" class="login_tab_p_on">개인회원</button>
					<button type="button" id="corpBtn" class="login_tab_c">기업회원</button>
				</div>
				<fieldset style="border: none;">
					<!-- <legend>로그인</legend> -->
					<div class="input-box">
						<input id="m_id" type="text" name="m_id" placeholder="아이디">
						<label for="m_id">아이디</label>
					</div>
	
					<div class="input-box">
						<input id="m_pw" type="password" name="m_pw" placeholder="비밀번호">
						<label for="m_pw">비밀번호</label>
					</div>
					<div id="forgot">
						<a href="/Member/join">회원가입</a>
						<span>|</span>
						<a href="/Member/help/findIdPw">아이디/비밀번호 찾기</a>
					</div>
					<input type="button" value="로그인" id="loginSubBtn">
				</fieldset>
			</div>
		</div>
	</form>

</section>
<script>
	$(function() {
		//개인회원 버튼을 누르면 
		$("#publicBtn").on("click", function() {
			$("input[name=c_id]").attr("name", "m_id");
			$("input[name=c_pw]").attr("name", "m_pw");
			$(".login_tab_p").attr("class","login_tab_p_on");
			$(".login_tab_c_on").attr("class","login_tab_c");
		});
		//기업회원 버튼을 누르면 
		$("#corpBtn").on("click", function() {
			$("input[name=m_id]").attr("name", "c_id");
			$("input[name=m_pw]").attr("name", "c_pw");
			$(".login_tab_p_on").attr("class","login_tab_p");
			$(".login_tab_c").attr("class","login_tab_c_on");
		});
	});
	$("#loginSubBtn").on("click", function() {
		var m_id = $("input[name=m_id]").val();
		if (typeof m_id == "undefined") {
			$("#login_all").attr("action", "/Member/loginFormC");
			$("#login_all").submit();
		} else {
			$("#login_all").attr("action", "/Member/loginFormP");
			$("#login_all").submit();
		}
	});
</script>



<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



