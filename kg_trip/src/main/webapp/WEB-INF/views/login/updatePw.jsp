<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/findIdPw.css">

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont" style="min-height: 550px;">

	<form action="/Member/pwUpdate" method="post" id="pwUpdateForm" name="pwUpdateForm">
		<div style="margin: 0 auto;">
			<h2>비밀번호 변경하기</h2>
		</div>
		<div style="padding: 100px 95px 100px 95px; border: 1px solid #e9e9e9; text-align: center; border-radius: 3px;margin-top: 5px;">
			<p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
			<br>
			<c:if test="${not empty loginPublicInfo}">
				<input type="hidden" id="m_idx" name="m_idx" value="${loginPublicInfo.m_idx}">
				<input type="hidden" id="m_id" name="m_id" value="${loginPublicInfo.m_id}">
				<div style="padding: 0px 95px 0px 95px; text-align: center;">
					<ul>
						<li class="information">
							<div class="wrap_lab">
								현재 비밀번호
							</div>
							<div class="wrap_input">
								<input type="password" name="m_pw" id="m_pw"/>
							</div>
						</li>
						<li class="information">
							<div class="wrap_lab">
								새 비밀번호
							</div>
							<div class="wrap_input">
								<input type="password" name="update_mpw" id="update_mpw"/>
							</div>
						</li>
						<li class="information">
							<div class="wrap_lab">
								새 비밀번호 확인
							</div>
							<div class="wrap_input">
								<input type="password" name="m_pw_check" id="m_pw_check"/>
							</div>
						</li>
					</ul>
					<div style="text-align: center;">
						<input type="button" id="pwUpdate" name="pwUpdate" value="비밀번호 변경" style="width: 25%;">
						<input type="button" id="notUpdateP" value="취소" style="width: 25%;">
					</div>
				</div>
			</c:if>
			<c:if test="${not empty loginCorpInfo}">
				<input type="hidden" id="c_idx" name="c_idx" value="${loginCorpInfo.c_idx}">
				<input type="hidden" id="c_id" name="c_id" value="${loginCorpInfo.c_id}">
				<div style="padding: 0px 95px 0px 95px; text-align: center;">
					<ul>
						<li class="information">
							<div class="wrap_lab">
								현재 비밀번호
							</div>
							<div class="wrap_input">
								<input type="password" name="c_pw" id="c_pw"/>
							</div>
						</li>
						<li class="information">
							<div class="wrap_lab">
								새 비밀번호
							</div>
							<div class="wrap_input">
								<input type="password" name="update_cpw" id="update_cpw"/>
							</div>
						</li>
						<li class="information">
							<div class="wrap_lab">
								새 비밀번호 확인
							</div>
							<div class="wrap_input">
								<input type="password" name="c_pw_check" id="c_pw_check"/>
							</div>
						</li>
					</ul>
					<div style="text-align: center;">
						<input type="button" id="pwUpdate" name="pwUpdate" value="비밀번호 변경" style="width: 25%;">
						<input type="button" id="notUpdateC" value="취소" style="width: 25%;">
					</div>
				</div>
			</c:if>
		</div>
	</form>

</section>

<script type="text/javascript">

	//비밀번호 정규식
	var pwJ = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	$(function(){
		
		$("#notUpdateP").click(function () {
			location.href = "/Traveler/myPage";
		});
		$("#notUpdateC").click(function () {
			location.href = "/Partner/corpPage";
		});
	
		$("#pwUpdate").on("click", function(){
			
			var m_idx = $("#m_idx").val();
			var c_idx = $("#c_idx").val();
			
			if(m_idx != null){
				if($("#m_pw").val()==""){
					alert("현재 비밀번호를 입력해주세요");
					$("#m_pw").focus();
					return false
				}
				if($("#update_mpw").val()==""){
					alert("새 비밀번호를 입력해주세요");
					$("#update_mpw").focus();
					return false
				}
				if(!pwJ.test($("#update_mpw").val())){
					alert($("#update_mpw").val());
					alert("비밀번호 양식");
					return false
				}
				if($("#m_pw").val() == $("#update_mpw").val()){
					alert("현재 비밀번호로 변경하실 수 없습니다.");
					return false
				}
				if($("#m_pw_check").val()==""){
					alert("새 비밀번호를 다시 한번 입력해주세요");
					$("#m_pw_check").focus();
					return false
				}
				if ($("#update_mpw").val() != $("#m_pw_check").val()) {
					alert("변경 비밀번호가 일치하지 않습니다.");
					$("#m_pw_check").focus();
					return false
				}	 
				
				$.ajax({
					url : "/Member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#pwUpdateForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert(data);
							alert("현재 비밀번호를 다시 확인해주세요.");
							return;
						}else{
							if(confirm("변경하시겠습니까?")){
								$("#pwUpdateForm").submit();
							}
						}
					}
				})
			}
			if(c_idx != null){
				if($("#c_pw").val()==""){
					alert("현재 비밀번호를 입력해주세요");
					$("#c_pw").focus();
					return false
				}
				if($("#update_cpw").val()==""){
					alert("새 비밀번호를 입력해주세요");
					$("#up_c_pw").focus();
					return false
				}
				if(!pwJ.test($("#update_cpw").val())){
					alert($("#update_cpw").val());
					alert("기업");
					alert("비밀번호 양식");
					return false
				}
				if($("#c_pw").val() == $("#update_cpw").val()){
					alert("현재 비밀번호로 변경하실 수 없습니다.");
					return false
				}
				if($("#c_pw_check").val()==""){
					alert("새 비밀번호를 다시 한번 입력해주세요");
					$("#c_pw_check").focus();
					return false
				}
				if ($("#update_cpw").val() != $("#c_pw_check").val()) {
					alert($("#update_cpw").val() + $("#c_pw_check").val());
					alert("변경 비밀번호가 일치하지 않습니다.");
					$("#c_pw_check").focus();
					return false
				}	 
				
				$.ajax({
					url : "/Member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#pwUpdateForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert(data);
							alert("현재 비밀번호를 다시 확인해주세요.");
							return;
						}else{
							if(confirm("변경하시겠습니까?")){
								$("#pwUpdateForm").submit();
							}
						}
					}
				})
				
			}
		})
	})
	</script>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



