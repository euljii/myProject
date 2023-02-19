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
		<div>
			<h2>개인회원 아이디 찾기</h2>
		</div>
		<br>
		<div>
			<fieldset>
				<form class="user" method="post">
					<div class="find_tab">
						<button type="button" id="phonebtn" class="phonebtn_on">휴대폰 번호로 찾기</button>
						<button type="button" id="emailbtn" class="emailbtn">이메일 주소로 찾기</button>
					</div>
					<div style="padding: 100px 95px 100px 95px; border: 1px solid #e9e9e9; text-align: center;" >
						<p>회원정보에 등록된 정보로 아이디를 찾을 수 있습니다.</p>
						<br>
						<br>
						<div id="phoneInfo" style="text-align: center;">
							<ul>
								<li class="information">
									<div class="wrap_lab">
										이름
									</div>
									<div class="wrap_input">
										<input type="text" id="m_name_p" aria-describedby="emailHelp" name="m_name">
									</div>
								</li>
								<li class="information">
									<div class="wrap_lab"> 
										휴대폰 번호
									</div>
									<div class="wrap_input">
										<input type="text" id="m_phone" aria-describedby="emailHelp" name="m_phone" placeholder=" '-'없이 입력 ">
									</div>
								</li>
							</ul>
						</div>
						<div id="emailInfo" style="display: none; text-align: center;">
							<ul>
								<li class="information">
									<div class="wrap_lab">
										<label>이름</label>
									</div>
									<div class="wrap_input">
										<input type="text" id="m_name_e" aria-describedby="emailHelp">
									</div>
								</li>
								<li class="information">
									<div class="wrap_lab">
										<label>이메일</label>
									</div>
									<div class="wrap_input">
										<input type="text" id="m_email" aria-describedby="emailHelp" name="m_email">
									</div>
								</li>
							</ul>
						</div>
						<div style="text-align: center;">
							<input type="button" id="findId" name="findId" value="아이디 찾기">
						</div>
					</div>
				</form>
					<div class="buttons">
						<button id="login" style="width:70px;">로그인</button>
						<button id="join" style="width:70px;">회원가입</button>
						<button id="freq" style="width: 102px;">자주 찾는 질문</button>
						<p>위 방법으로 계정을 찾을수 없다면, 고객센터로 직접 문의 주시기 바랍니다.</p>
					</div>
			</fieldset>
		</div>
	</div>
</section>

<script type="text/javascript">
	$(function () {
		
		$("#phonebtn").on("click",function(){
			$("#phoneInfo").show();
			$("#emailInfo").hide();
			$("#m_name_e").attr("name","m_name_e");
			$("#m_name_p").attr("name","m_name");
			$(".phonebtn").attr("class","phonebtn_on");
			$(".emailbtn_on").attr("class","emailbtn");
		});
		$("#emailbtn").on("click",function(){
			$("#phoneInfo").hide();
			$("#emailInfo").show();
			$("#m_name_e").attr("name","m_name");
			$("#m_name_p").attr("name","m_name_p");
			$(".phonebtn_on").attr("class","phonebtn");
			$(".emailbtn").attr("class","emailbtn_on");
		});
		
		$("#findId").click(function () {
			$(".user").attr("action", "/Member/findIdFormP");
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
		
	});
</script>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



