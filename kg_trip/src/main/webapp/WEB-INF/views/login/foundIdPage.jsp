<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findIdPw.css">

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

	<section class="cont" style="min-height: 550px;">
		<div style="width: 70%; margin: 0 auto;">
			<div>
				<h2>아이디 찾기</h2>
			</div>
			<br>
			<div style="padding: 100px 95px 100px 95px; border: 1px solid #e9e9e9; text-align: center; border-radius: 3px;margin-top: 5px;" >
				<c:if test="${not empty findpvo}">
					<c:out value="${findpvo.m_name }"></c:out>님의 아이디가 검색되었습니다.
					<br><Br>
					<div style="padding: 0px 95px 0px 95px; text-align: center;">
						<ul>
							<li class="information">
								<div class="wrap_lab">
									아이디
								</div>
								<div class="wrap_input">
									<c:out value="${findpvo.m_id }"></c:out>
								</div>
							</li>
							<li class="information">
								<div class="wrap_lab"> 
									가입일
								</div>
								<div class="wrap_input">
									<c:out value="${findpvo.m_regdate }"></c:out>
								</div>
							</li>
						</ul>
					</div>
					<div style="text-align: center;">
						<input type="button" id="gologin"value="로그인" style="width: 25%;">
						<input type="button" id="gofindpwP" value="비밀번호찾기" style="width: 25%;">
					</div>
				</c:if>
				<c:if test="${not empty findcvo}">
					<c:out value="${findcvo.c_dname }"></c:out>님의 아이디가 검색되었습니다.
					<br><Br>
					<div style="padding: 0px 95px 0px 95px; text-align: center;">
						<ul>
							<li class="information">
								<div class="wrap_lab">
									아이디
								</div>
								<div class="wrap_input">
									<c:out value="${findcvo.c_id }"></c:out>
								</div>
							</li>
							<li class="information">
								<div class="wrap_lab"> 
									가입일
								</div>
								<div class="wrap_input">
									<c:out value="${findcvo.c_regdate }"></c:out>
								</div>
							</li>
						</ul>
					</div>
					<div style="text-align: center;">
						<input type="button" id="gologin" value="로그인" style="width: 25%;">
						<input type="button" id="gofindpwC" value="비밀번호찾기" style="width: 25%;">
					</div>
				</c:if>
			</div>
			<div class="buttons">
				<button id="login" style="width:70px;">로그인</button>
				<button id="join" style="width:70px;">회원가입</button>
				<button id="freq" style="width: 102px;">자주 찾는 질문</button>
				<p>위 방법으로 계정을 찾을수 없다면, 고객센터로 직접 문의 주시기 바랍니다.</p>
			</div>
		</div>
	</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<script type="text/javascript">
	$(function () {
		$("#gologin").click(function () {
			location.href = "/Member/login";
		});
		$("#gofindpwP").click(function () {
			location.href = "/Member/help/findPwFormP";
		});
		$("#gofindpwC").click(function () {
			location.href = "/Member/help/findPwFormC";
		});
	})
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

		
	
