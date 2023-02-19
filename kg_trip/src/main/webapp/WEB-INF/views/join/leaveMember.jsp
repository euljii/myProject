<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findIdPw.css">
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont" style="min-height: 550px;">
	<form action="/Member/delete" method="post" id="deleteForm" name="deleteForm">
		<div style="margin: 0 auto;">
			<h2>회원탈퇴하시겠습니까?</h2>
			<p>탈퇴하시면 그 동안의 모든 데이터가 사라집니다.</p>
		</div>
		<div style="padding: 100px 95px 100px 95px; border: 1px solid #e9e9e9; text-align: center; border-radius: 3px;margin-top: 5px;">
			<p class="lead">본인 확인을 위해 비밀번호를 입력해주세요.</p>
			<br>
			<c:if test="${not empty loginPublicInfo}">
				<input type="hidden" id="m_idx" name="m_idx" value="${loginPublicInfo.m_idx}">
				<input type="hidden" id="m_id" name="m_id" value="${loginPublicInfo.m_id}">
				<div style="padding: 0px 95px 0px 95px; text-align: center;">
					<ul>
						<li class="information">
							<div class="wrap_lab">
								비밀번호
							</div>
							<div class="wrap_input">
								<input type="password" id="m_pw" name="m_pw"/>
							</div>
						</li>
						<li class="information">
							<div class="wrap_lab">
								비밀번호 확인
							</div>
							<div class="wrap_input">
								<input type="password" id="m_pw_check" name="m_pw_check"/>
							</div>
						</li>
					</ul>
					<div style="text-align: center;">
						<input type="button" id="memberLeave" name="memberLeave" value="회원탈퇴" style="width: 25%;">
						<input type="button" id="notLeaveP" value="취소" style="width: 25%;">
					</div>
				</div>
			</c:if>
			<c:if test="${not empty loginCorpInfo }">
				<input type="hidden" id="c_idx" name="c_idx" value="${loginCorpInfo.c_idx}">
				<input type="hidden" id="c_id" name="c_id" value="${loginCorpInfo.c_id}">
				<div style="padding: 0px 95px 0px 95px; text-align: center;">
					<ul>
						<li class="information">
							<div class="wrap_lab">
								비밀번호
							</div>
							<div class="wrap_input">
								<input type="password" id="c_pw" name="c_pw"/>
							</div>
						</li>
						<li class="information">
							<div class="wrap_lab">
								비밀번호 확인
							</div>
							<div class="wrap_input">
								<input type="password" id="c_pw_check" name="c_pw_check"/>
							</div>
						</li>
					</ul>
					<div style="text-align: center;">
						<input type="button" id="memberLeave" name="memberLeave" value="회원탈퇴" style="width: 25%;">
						<input type="button" id="notLeaveC" value="취소" style="width: 25%;">
					</div>
				</div>
			</c:if>
		</div>
	</form>
</section>
<script type="text/javascript">

	$(function(){
		
		$("#notLeaveP").click(function () {
			location.href = "/Traveler/myPage";
			
		});
		$("#notLeaveC").click(function () {
			location.href = "/Partner/corpPage";
			
		});
		
		$("#memberLeave").on("click", function(){
			if($("#m_idx").val() != ""){
				if($("#m_pw").val()==""){
					alert("비밀번호를 입력해주세요");
					$("#m_pw").focus();
					return false
				}
				
				if($("#m_pw_check").val()==""){
					alert("비밀번호 확인을 입력해주세요");
					$("#m_pw_check").focus();
					return false
				}
				
				if ($("#m_pw").val() != $("#m_pw_check").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#m_pw").focus();
					 
					return false;
				}
				
				$.ajax({
					url : "/Member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#deleteForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("비밀번호를 확인해주세요.");
							return;
						}else{
							if(confirm("탈퇴하시겠습니까?")){
								$("#deleteForm").submit();
							}
							
						}
					}
				})
			}else{
				if($("#c_pw").val()==""){
					alert("비밀번호를 입력해주세요");
					$("#c_pw").focus();
					return false
				}
				
				if($("#c_pw_check").val()==""){
					alert("비밀번호 확인을 입력해주세요");
					$("#c_pw_check").focus();
					return false
				}
				
				if ($("#c_pw").val() != $("#c_pw_check").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#c_pw").focus();
					 
					return false;
				}
				
				$.ajax({
					url : "/Member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#deleteForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("비밀번호를 확인해주세요.");
							return;
						}else{
							if(confirm("탈퇴하시겠습니까?")){
								$("#deleteForm").submit();
							}
							
						}
					}
				})
			}
		});
	});
		

</script>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



