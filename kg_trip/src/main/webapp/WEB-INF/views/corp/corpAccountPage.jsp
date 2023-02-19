<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/bomin.css">
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

		<section class="cont2">
			<div class="all" style="display: flex;">
				<jsp:include page="/WEB-INF/views/include/corpMenuBar.jsp"></jsp:include>
				<div class="content_section" style="border: 1px solid #dddddd; width: 85%;">
					<div class="content" style=" margin : 10px; background-color: white;">
						<h1>계정관리</h1>
						<div class="public_account_inner" style="display: flex; flex-direction: column; align-items: center">
							<div class="Profile">
								<input type="hidden" value="${loginCorpInfo.c_idx }" name="c_idx" id="c_idx">
										<div id="image_div" class="image_div">
											<img alt="프로필이미지" src="/img/${loginCorpInfo.c_img }" style="width: 80px; height: 80px;
											border-radius: 70%; overflow: hidden; border: 1px solid black; position: relative;">
										</div>
								<!-- <label >수정</label> -->
								<label for="file" style=" z-index: 5; position: relative; left: 70px; top: -40px;"">
									<div class="btn-upload"><img alt="수정" src="/img/camera2.png" style="overflow: hidden; border: 1px solid; border-radius: 33px; position: relative;"></div>
								</label>
								<input type="file" name="c_img" class="file_upload" id="file">
							</div>
							<form id="public_account">
							<div style="display: flex; flex-direction: column;">
								<table class="corptable">
									<tr>
										<td>
											<input type="hidden" value="${loginCorpInfo.c_idx }" name="c_idx" id="c_idx">
											아이디 
										</td>
										<td colspan="2">
											${loginCorpInfo.c_id } 
										</td>
									</tr>
									<tr>
										<td> </td>
									</tr>
									<tr> 
										<td colspan="3">
											<h5>담당자 정보</h5>
										</td> 
									</tr>
									<tr>
										<td>
											이름 
										</td>
										<td colspan="2">
											${loginCorpInfo.c_dname }
										</td>
									</tr>
									<tr>
										<td>이메일 
										</td>
										<td colspan="2">${loginCorpInfo.c_demail }</td>
									</tr>
									<tr>
										<td>전화번호 
										</td>
										<td colspan="2">${loginCorpInfo.c_dphone } </td>
									</tr>
									<tr>
										<td> </td>
									</tr>
									<tr> 
										<td colspan="3">
											<h5>기업 정보</h5>
										</td> 
									</tr>
									
									<tr>
										<td> 기업명  </td>
										<td colspan="2">${loginCorpInfo.c_name } </td>
									</tr>
									<tr>
										<td> 사업자등록번호 </td>
										<td colspan="2">${loginCorpInfo.c_code }</td>
									</tr>
									<tr>
										<td rowspan="2">주소</td>
										<td>
											<input type="text" name="c_zipcode" id="c_zipcode" placeholder="우편번호" readonly="readonly" value="${loginCorpInfo.c_zipcode }"
													style="height: 20px; padding-left: 5px; border: none; font-size: 15px;">
											<input hidden="" id="find_zipcode" type="button" onclick="execDaumPostcode()"value="우편번호 찾기">
										</td>
										<td class="edit_button" id="edit_address" style="width: 40px;" rowspan="2">
											<div class="edit_1">
												<img alt="이미지" src="/img/pencil.png" style="width: 20px; height: 20px;">
											</div>
											<div class="edit_2" hidden="" style="width: 30px; text-align: center;">
												<a style="font-size: small; color: #28c3a5;">수정</a>
											</div>
										</td>
									</tr>
									<tr>
										<td id="all_address">
											<input type="text" name="address" id="address" placeholder="주소" readonly="readonly" value="${loginCorpInfo.c_address }" 
													style="width: 300px; border: none; height: 20px; padding-left: 5px; font-size: 15px;">
											<input hidden="" type="text" name="detailaddress" id="detailaddress" placeholder="상세주소">
										</td>
										</tr>
									<tr>
									</tr>
									<tr style="border: 1px solid #e9e9e9; margin-top: 10px;">
										<td>
											소개글
										</td>
										<td>		
											<textarea id="c_intro" name="c_intro" readonly="readonly" cols="70" rows="7" style="resize: none; border: none;">
												<c:if test="${not empty loginCorpInfo.c_intro }">${loginCorpInfo.c_intro }</c:if>
												<c:if test="${empty loginCorpInfo.c_intro }">소개글을 입력해주세요</c:if>
											</textarea>
										</td>
										<td class="edit_button" id="edit_intro">
											<div class="edit_1">
												<img alt="이미지" src="/img/pencil.png" style="width: 20px; height: 20px;">
											</div>
											<div class="edit_2" hidden="" style="width: 30px; text-align: center;">
												<a style="font-size: small; color: #41d4b8;">수정</a>
											</div>
										</td>
									</tr>
								</table>
								</div>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('c_zipcode').value = data.zonecode;
                document.getElementById("address").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailaddress").focus();
            }
        }).open();
    }
</script>
<<script type="text/javascript">
$("#edit_intro").on("click",function(){
	var c_intro = $("#c_intro").val();
	var c_idx = $('#c_idx').val();
	if($("#edit_intro .edit_2").css("display") == "none"){
		$("#edit_intro .edit_2").show();
		$("#edit_intro .edit_1").hide();
		$("#c_intro").attr("readonly",false);
	//	$("#m_intro").val().replace(/\r\n|\n/,"<br>");
	}else{
		//$("#m_intro").on("keydown",function () {
		//	$('#m_intro').val().replace("안", "r");
		//});
		
		if(c_intro == ""){
			alert("빈칸x");
			return false;
		}else{
			var param = {c_intro : c_intro, c_idx : c_idx}
			$.ajax({
				url : '${pageContext.request.contextPath}/Partner/introUpdate',
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
		$("#c_intro").attr("readonly",true);
	}
})

$("#edit_address").on("click",function(){
	var c_zipcode = $("#c_zipcode").val();
	var address = $("#address").val();
	var detailaddress = $("#detailaddress").val();
	var c_idx = $('#c_idx').val();
	if($("#edit_address .edit_2").css("display") == "none"){
		$("#edit_address .edit_2").show();
		$("#edit_address .edit_1").hide();
		$("#c_zipcode").attr("value","");
		$("#c_zipcode").css("border","1px solid #767676");
		$("#c_zipcode").css("border-radius","3px");
		$("#address").attr("value","");
		$("#address").css("border","1px solid #767676");
		$("#address").css("border-radius","3px");
		$("#detailaddress").show();
		$("#detailaddress").css("height","20px");
		$("#detailaddress").css("border","1px solid #767676");
		$("#detailaddress").css("border-radius","3px");
		$("#detailaddress").css("padding-left","5px");
		$("#find_zipcode").show();
		$()
	}else{
		var param = {c_zipcode : c_zipcode, c_idx : c_idx, address : address, detailaddress : detailaddress }
		
		if(detailaddress == ""){
			alert("상세주소");
			return false;
		}else{
			$.ajax({
				url : '${pageContext.request.contextPath}/Partner/addressUpdate',
				contentType:'application/json; charset=utf-8',
				data : JSON.stringify(param),
				type : 'post',
				success : function(data) {
					console.log(data);
						alert("주소 변경 완료");
						$("#all_address").html('<input type="text" name="address" id="address" placeholder="주소" readonly="readonly" value="'+ address +" "+ detailaddress +'">');
					}, error : function() {
					console.log("실패");
					}
				});
		$("#edit_address .edit_1").show();
		$("#edit_address .edit_2").hide();
		$("#detailaddress").hide();
		$("#find_zipcode").hide();
		}
	}
})

function showUploadImage(c_img){
     $("#image_div").html('<img alt="프로필이미지" src="/img/'+ c_img+'" style="width: 80px; height: 80px; border-radius: 70%; overflow: hidden; border: 1px solid black; position: relative;">');    
}
 
$("input[name='c_img']").change(function(){
	var formData = new FormData();
	var inputFile = $("input[name='c_img']")
	var fileList = inputFile[0].files;
	var files = fileList[0];
	var c_idx = $('#c_idx').val();
	console.log(fileList);
	console.log(files);
	console.log(c_idx);
	
	formData.append("uploadFile", files);
	formData.append("c_idx", c_idx);
	
   if(!fileCheck(files.name, files.size)){
         return false;
  }
	$.ajax({
			url : '${pageContext.request.contextPath}/Partner/imgUpdate',
			processData : false,
			contentType:false,
			data : formData,
			type : 'post',
			success : function(result) {
				let c_img = result.c_img;
					showUploadImage(c_img);
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

		
	
