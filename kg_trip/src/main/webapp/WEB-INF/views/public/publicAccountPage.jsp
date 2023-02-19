<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/bomin.css">
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

		<section class="cont2">
			<div class="all" style="display: flex;">
				<jsp:include page="/WEB-INF/views/include/publicMenuBar.jsp"></jsp:include>
				<div class="content_section">
					<div class="content">
						<h2>계정관리</h2>
						<div class="public_account_inner">
							<div class="Profile">
								<input type="hidden" value="${loginPublicInfo.m_idx }" name="m_idx" id="m_idx">
									<div id="image_div" class="image_div">
										<img alt="프로필이미지" src="/img/${loginPublicInfo.m_img }" style="width: 80px; height: 80px;
										border-radius: 70%; overflow: hidden; border: 1px solid black; position: relative;">
									</div>
								<!-- <label >수정</label> -->
								<label for="file" style=" z-index: 5; position: relative; left: 70px; top: -40px;">
									<div class="btn-upload">
										<img alt="수정" src="/img/camera2.png" style="overflow: hidden; border: 1px solid; border-radius: 33px; position: relative;">
									</div>
								</label>
								<input type="file" name="m_img" class="file_upload" id="file">
							</div>
							<form id="public_account">
								<table class="infotable">
									<tr>
										<td>
											<input type="hidden" value="${loginPublicInfo.m_idx }" name="m_idx" id="m_idx">
											아이디
										</td>
										<td colspan="2">  
											${loginPublicInfo.m_id } 
										</td>
									<tr>
									<tr>
										<td>닉네임 
										</td>
										<td>
											<input id="m_nickname" name="m_nickname" value="${loginPublicInfo.m_nickname }" readonly="readonly" onfocus="this.blur()" style="border: none; width: 200px; font-size: medium;">
											<input id="m_nickname_up" name="m_nickname" type="hidden" style="border: none; width: 200px; height:22px; font-size: medium;">
										</td>
										<td class="edit_button" id="edit_nickname">
											<div class="edit_1" style="width: 30px; text-align: center;">
												<img alt="이미지" src="/img/pencil.png" style="width: 20px; height: 20px;">
											</div>
											<div class="edit_2" hidden="" style="width: 30px; text-align: center;">
												<a style="font-size: small; color: #28c3a5;">수정</a>
											</div>
										</td>
									</tr>
									<tr>
										<td id="hidden_nick" hidden="" style="border: none;" colspan="3"> 
											<div class="check_font" id="nickname_check"></div>
										</td>
									</tr>
									<tr><td>이름 
									</td>
										<td colspan="2">${loginPublicInfo.m_name }</td></tr>
									<tr>
										<td>
											생년월일 
											</td>
										<td> 
											<input id="birthYear" name="birthYear" value="${birthYear}" readonly="readonly" 
													style="width: 50px; height:20px; border: none; font-size: 16px; padding-left: 5px; padding-right:5px;">&nbsp;년&nbsp;
											<input id="birthMonth" name="birthMonth" value="${birthMonth}" readonly="readonly" onfocus="this.blur()" 
													style="width: 40px; border: none; font-size: 16px; text-align: right;">
											<select id="birthMonth_up" name="birthMonth" hidden="" style="font-size: 16px;">
												<option value="">&nbsp;월&nbsp;
												<option value="01">01
												<option value="02">02
												<option value="03">03
												<option value="04">04
												<option value="05">05
												<option value="06">06
												<option value="07">07
												<option value="08">08
												<option value="09">09
												<option value="10">10
												<option value="11">11
												<option value="12">12
											</select>
											&nbsp;월&nbsp;
											<input id="birthDate" name="birthDate" value="${birthDate}" readonly="readonly" onfocus="this.blur()" 
													style="width: 40px; border: none; font-size: 16px; text-align: right;">
											<select id="birthDate_up" name="birthDate" hidden="" style="font-size: 16px;">
												<option value="">&nbsp;일&nbsp;
											</select>
											&nbsp;일&nbsp;
										</td>
										<td class="edit_button" id="edit_birth">
											<div class="edit_1" style="width: 30px; text-align: center;">
												<img alt="이미지" src="/img/pencil.png" style="width: 20px; height: 20px;">
											</div>
											<div class="edit_2" hidden="" style="width: 30px; text-align: center;">
												<a style="font-size: small; color: #28c3a5;">수정</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>성별 </td>
										<td> 
											<c:if test="${loginPublicInfo.m_gender == '여성' }">
												<input id="m_gender" name="m_gender" value="여성" readonly="readonly" onfocus="this.blur()" 
														style="border: none; font-size: 16px;">
											</c:if>
											<c:if test="${loginPublicInfo.m_gender == '남성' }">
												<input id="m_gender" name="m_gender" value="남성" readonly="readonly" onfocus="this.blur()" 
														style="border: none; font-size: 16px;">
											</c:if>
											<select id="m_gender_up" name="m_gender" hidden="" style="font-size: 15px;">
												<option value="">성별
												<option value="남성">남성
												<option value="여성">여성
											</select>
										</td>
										<td class="edit_button" id="edit_gender">
											<div class="edit_1" style="width: 30px; text-align: center;">
												<img alt="이미지" src="/img/pencil.png" style="width: 20px; height: 20px;">
											</div>
											<div class="edit_2" hidden="" style="width: 30px; text-align: center;">
												<a style="font-size: small; color: #28c3a5;">수정</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>이메일 </td>
										<td colspan="2"> ${loginPublicInfo.m_email }</td>
									</tr>
									<tr>
										<td>전화번호 </td>
										<td colspan="2"> ${loginPublicInfo.m_phone } </td>
									</tr>
									<tr style="border: 1px solid #e9e9e9;">
										<td>
											소개글
										</td>
										<td >		
											<textarea id="m_intro" name="m_intro" readonly="readonly" cols="70" rows="7" style="resize: none; border: none; overflow:hidden;">
												<c:if test="${not empty loginPublicInfo.m_intro }">${loginPublicInfo.m_intro }</c:if>
												<c:if test="${empty loginPublicInfo.m_intro }">소개글을 입력해주세요</c:if>
											</textarea>
										</td>
										<td class="edit_button" id="edit_intro" style="width: 30px; text-align: center;">
											<div class="edit_1">
												<img alt="이미지" src="/img/pencil.png" style="width: 20px; height: 20px;">
											</div>
											<div class="edit_2" hidden="" style="width: 30px; text-align: center;">
												<a style="font-size: small; color: #28c3a5;">수정</a>
											</div>
										</td>
									</tr>
								</table>
							</form>
							<div class="setting" style="display: flex; justify-content: center;">
								<div style=" margin-right: 10px;">
									<button id="delete" class="btn03">회원탈퇴</button>
								</div>
								<div style=" margin-left: 10px;">
									<button id="updatePw" class="btn03">비밀번호 변경</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<script type="text/javascript">
	
function showUploadImage(m_img){
     $("#image_div").html('<img alt="프로필이미지" src="/img/'+ m_img+'" style="width: 80px; height: 80px; border-radius: 70%; overflow: hidden; border: 1px solid black; position: relative;">');    
 }   
	
	$("#edit_nickname").click(function () {
		var m_nickname = $('#m_nickname').val();
		
		var m_idx = $('#m_idx').val();
		
		if($("#edit_nickname .edit_2").css("display") == "none"){
			$("#edit_nickname .edit_2").show();
			$("#edit_nickname .edit_1").hide();
			$('#m_nickname').hide();
			$('#m_nickname_up').show();
			$('#m_nickname_up').css("border","1px solid #767676");
			$("#m_nickname_up").css("border-radius","3px");
			$("#m_nickname_up").css("padding-left","10px");
			$('#hidden_nick').show();
			$('#m_nickname_up').attr("type","text");
			
			$('#m_nickname_up').on("keyup",function(){
				var m_nickname_upda = $(this).val();
				console.log(m_nickname_upda);
				$('#m_nickname_up').attr('value',m_nickname_upda)
			$.ajax({
				url : '${pageContext.request.contextPath}/Member/public/nicknameCheckP?m_nickname='+ m_nickname_upda,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#nickname_check").text("사용중인 닉네임입니다.");
							$("#nickname_check").css("color", "red");
						} else {
							if(m_nickname_upda == ""){
								$('#nickname_check').text('닉네임을 입력해주세요.');
								$('#nickname_check').css('color', 'red');
							}else{
								$("#nickname_check").text("사용가능한 닉네임입니다.");
								$("#nickname_check").css("color","#28c3a5");
							}
						}
				}, error : function() {
						console.log("실패2");
				}
			});
			});
		}else{
			var m_value = $("#m_nickname_up").val();

			if(m_value == ""){
				alert("빈칸x")
				return false;
			}else{
				$.ajax({
					url : '${pageContext.request.contextPath}/Traveler/nicknameUpdate?m_nickname='+ m_value +'&m_idx='+m_idx,
					type : 'get',
					success : function(data) {
						console.log(data);
							alert("닉네임 변경 완료");
							$("#nickname_check").text('');
							$('#m_nickname_up').hide();
							$('#m_nickname').val(m_value);
							$('#m_nickname').show()
							$('#hidden_nick').hide();
						}, error : function() {
							alert("닉네임 변경 실패");
						console.log("실패");
						$("#nickname_check").text('');
						$("#m_nickname_up").val('');
						$('#m_nickname_up').hide();
						$('#m_nickname').show()
						}
				});
				$("#edit_nickname .edit_1").show();
				$("#edit_nickname .edit_2").hide();
			}
		}
	});
	
	$("#edit_intro").on("click",function(){
		var m_intro = $("#m_intro").val();
		var m_idx = $('#m_idx').val();
		if($("#edit_intro .edit_2").css("display") == "none"){
			$("#edit_intro .edit_2").show();
			$("#edit_intro .edit_1").hide();
			$("#m_intro").attr("readonly",false);
		//	$("#m_intro").val().replace(/\r\n|\n/,"<br>");
		}else{
			//$("#m_intro").on("keydown",function () {
			//	$('#m_intro').val().replace("안", "r");
			//});
			
			if(m_intro == ""){
				alert("빈칸x");
				return false;
			}else{
				var param = {m_intro : m_intro, m_idx : m_idx}
				$.ajax({
					url : '${pageContext.request.contextPath}/Traveler/introUpdate',
					contentType:'application/json; charset=utf-8',
					data : JSON.stringify(param),
					type : 'post',
					success : function(data) {
						console.log(data);
							alert("소개글 변경 완료");
						}, error : function() {
						console.log("실패");
						}
					});
			}
			$("#edit_intro .edit_1").show();
			$("#edit_intro .edit_2").hide();
			$("#m_intro").attr("readonly",true);
		}
	})
	$("#edit_birth").on("click",function(){
		if($("#edit_birth .edit_2").css("display") == "none"){
			$("#edit_birth .edit_2").show();
			$("#edit_birth .edit_1").hide();
			$("#birthYear").attr("readonly",false);
			$("#birthYear").css("border","1px solid #767676");
			$("#birthYear").css("border-radius","3px");
			$('#birthMonth').hide();
			$('#birthMonth_up').show();
			$('#birthDate').hide();
			$('#birthDate_up').show();
			$("#birthYear").val("");
			$("#birthMonth_up,#birthYear").on("change",function(){
				var str = "";
				var birthyear = $("#birthYear").val();
				var birthmonth = $("#birthMonth_up").val();
				var birthdate = $("#birthDate_up").val();
				var today = new Date(); // 날짜 변수 선언
				var yearNow = today.getFullYear(); // 올해 연도 가져옴
				
				if(birthyear == ""){
					birthdate = "";
				}else if(birthmonth == ""){
					birthdate = "";
				}else{
					if (1900 > birthyear || birthyear > yearNow){
						birthdate = "";
					} else if (birthmonth < 1 || birthmonth > 12) {
						birthdate = "";
						
					} else if ((birthmonth==04 || birthmonth==06 || birthmonth==09 || birthmonth==11)) {
						str += "<option value=''>일";
						for(var i=1; i<31; i++){
							if(i < 10){
								str += "<option value="+0+i+">"+0+i;
							}else{
								str += "<option value="+i+">"+i;
							}
						}
					}else if (birthmonth == 2) {
						var isleap = (birthyear % 4 == 0 && (birthyear % 100 != 0 || birthyear % 400 == 0));
						if (isleap) {
							str += "<option value=''>일";
							for(var i=1; i<30; i++){
								str += "<option value="+i+">"+i;
							}
						} else {
							str += "<option value=''>일";
							for(var i=1; i<29; i++){
								str += "<option value="+i+">"+i;
							}
						} 
					} else {
						str += "<option value=''>일";
						for(var i=1; i<32; i++){
							if(i < 10){
								str += "<option value="+0+i+">"+0+i;
							}else{
								str += "<option value="+i+">"+i;
							}
						}
					}
					$("#birthDate_up").html(str);
				}
			});
		}else{
			var m_idx = $('#m_idx').val();
			var birthYear = $("#birthYear").val();
			var birthMonth = $("#birthMonth_up").val();
			var birthDate = $("#birthDate_up").val();
			
			var param = {m_idx : m_idx, birthYear : birthYear ,birthMonth : birthMonth,birthDate : birthDate }
			
			console.log(param.m_idx+param.birthYear+param.birthMonth+param.birthDate);
			
			if(birthYear == "" || birthMonth == "" || birthDate == ""){
				alert("빈칸 x");
				return false;
			}else{
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/Traveler/birthUpdate',
					data : JSON.stringify(param),
					contentType:'application/json; charset=utf-8',
					success : function(data) {
						console.log(data);
							alert("생년월일 변경 완료");
						}, error : function() {
						alert("닉네임 변경 실패");
						console.log("실패");
						}
					});
				$('#birthMonth').val(birthMonth);
				$('#birthDate').val(birthDate);
			}
			$("#edit_birth .edit_1").show();
			$("#edit_birth .edit_2").hide();
			$('#birthMonth').show();
			$('#birthMonth_up').hide();
			$('#birthDate').show();
			$('#birthDate_up').hide();
		}
	})
	$("#edit_gender").on("click",function(){
		if($("#edit_gender .edit_2").css("display") == "none"){
			$("#edit_gender .edit_2").show();
			$("#edit_gender .edit_1").hide();
			$('#m_gender').hide();
			$('#m_gender_up').show();
		}else{
			var m_idx = $('#m_idx').val();
			var m_gender = $("#m_gender_up").val();
			
			var param = {m_idx : m_idx, m_gender : m_gender}
			
			console.log(param.m_idx+param.m_gender);
			
			if(m_gender == ""){
				alert("빈칸x");
				return false;
			}else{
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/Traveler/genderUpdate',
				data : JSON.stringify(param),
				contentType:'application/json; charset=utf-8',
				success : function(data) {
					console.log(data);
						alert("성별 변경 완료");
					}, error : function() {
					console.log("실패");
					}
				});
			$("#edit_gender .edit_1").show();
			$("#edit_gender .edit_2").hide();
			$('#m_gender').show();
			$('#m_gender_up').hide();
			$("#m_gender").val(m_gender);
			}
		}
	})
	$("input[name='m_img']").change(function(){
		var formData = new FormData();
		var inputFile = $("input[name='m_img']")
		var fileList = inputFile[0].files;
		var files = fileList[0];
		var m_idx = $('#m_idx').val();
		console.log(fileList);
		console.log(files);
		console.log(m_idx);
		
		formData.append("uploadFile", files);
		formData.append("m_idx", m_idx);
		
	   if(!fileCheck(files.name, files.size)){
	         return false;
      }
         $.ajax({
				url : '${pageContext.request.contextPath}/Traveler/imgUpdate',
				processData : false,
				contentType:false,
				data : formData,
				type : 'post',
				success : function(result) {
					let m_img = result.m_img;
						showUploadImage(m_img);
					}, error : function(result) {
					console.log("실패");
					alert(result);
					}
				}); 
 	});
	 
	   let regex = new RegExp("(.*?)\.(jpg|png)$");
	   let maxSize = 10485760; //1MB
	   

	   
	   function fileCheck(fileName, fileSize){

	      if(fileSize >= maxSize){
	         alert("파일 사이즈 초과");
	         $('input[name="uploadFile"]').val("");
	         return false;
	      }
	           
	      if(!regex.test(fileName)){
	         alert("해당 종류의 파일은 업로드할 수 없습니다.");
	         $('input[name="uploadFile"]').val("");
	         return false;
	      }
	      
	      return true;      
	      
	   }
	   
	   	$(function () {
		   $("#delete").click(function() {
				location.href = "/Member/delete";
			});
		   $("#updatePw").click(function() {
				location.href = "/Member/updatePw";
			});
		})
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

		
	
