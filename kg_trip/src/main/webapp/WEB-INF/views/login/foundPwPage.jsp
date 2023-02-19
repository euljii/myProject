<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findIdPw.css">

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

	<section class="cont"  style="min-height: 470px;">
		<div style="width: 70%; margin: 0 auto;">
			<div>
				<h2>비밀번호 찾기</h2>
			</div>
			<br>
			<div style="padding: 100px 95px 100px 95px; border: 1px solid #e9e9e9; text-align: center; border-radius: 3px;margin-top: 5px;" >
				<div class="jumbotron">
					<c:if test="${not empty findpvo}">
						<p> 임시 비밀번호가 전송되었습니다. </p>
						<br>
						<span style="font-weight: bold; font-size: 21px;"><c:out value="${findpvo.m_email }"></c:out></span>
						<span style="font-size: 15px;"> 를 확인해주세요.</span>
					<div style="text-align: center;">
						<input type="button" id="gologin" value="로그인" style="width: 25%;">
						<input type="button" id="gofindidP" value="아이디찾기" style="width: 25%;">
					</div>
					</c:if>
					<c:if test="${not empty findcvo}">
						<h2> 임시 비밀번호가 전송되었습니다. </h2>
						<br>
						<h2><c:out value="${findcvo.c_demail }"></c:out>를 확인해주세요.</h2>
					<div style="text-align: center;">
						<input type="button" id="gologin" value="로그인" style="width: 25%;">
						<input type="button" id="gofindidC" value="아이디찾기" style="width: 25%;">
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<script type="text/javascript">
	$(function () {
		$("#gologin").click(function () {
			location.href = "/Member/login";
		});
		$("#gofindidP").click(function () {
			location.href = "/Member/help/findIdFormP";
		});
		$("#gofindidC").click(function () {
			location.href = "/Member/help/findIdFormC";
		});
	})
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

		
	
