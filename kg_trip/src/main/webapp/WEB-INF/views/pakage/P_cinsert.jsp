<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<style>
	*{
	margin: 0px;
	padding: 0px;
	}
	.content_section{
		border: 1px solid #dddddd;
		width: 85%;
		padding: 30px 40px;
		border-radius : 5px;
	}
	.content{
		margin : 10px;
		background-color: white;
	}
	td{
		height:50px;
	}
</style>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

		<section class="content">
			<div class="all" style="display: flex;">
				<jsp:include page="/WEB-INF/views/include/corpMenuBar.jsp"></jsp:include>
				
				<div class="content_section">
					<div class="content">
				<div style="margin: auto;">
				<h1>패키지 등록</h1><br>
				<form action="uploadFormGo" method="post" enctype="multipart/form-data" class="mb-3" id="frm">
					<table style="background-color: white;">
						<tr>
							<td width="200px">
								패키지 번호
							</td>
							<td>
								<input type="text" name="p_num" id="p_num">
								<div class="check_font" id="pnum_check"></div>
							</td>
						</tr>
						<tr>
							<td width="200px">
								패키지 여행기간(yyyy.mm.dd ~ yyyy.mm.dd) 
							</td>
							<td>
								<input type="text" name="p_period1" id="p_period1"> ~ <input type="text" name="p_period2" id="p_period2">
								<div class="check_font" id="pperiod_check"></div>
							</td>
						</tr>
						<tr>
							<td width="200px">
								나라 
							</td>
							<td>
								<input type="text" name="p_country">
							</td>
						</tr>
						<tr>
							<td width="200px">
								지역1(ex)북아메리카,서유럽) 
							</td>
							<td>
								<input type="text" name="p_region1">
							</td>
						</tr>
						<tr>
							<td width="200px">
								지역2(나라명 or 지역명) 
							</td>
							<td>
								<input type="text" name="p_region2">
							</td>
						</tr>
						<tr>
							<td width="200px">
								패키지명 
							</td>
							<td>
								<input type="text" name="p_name">
							</td>
						</tr>
						<tr>
							<td width="200px">
								패키지 메인이미지 
							</td>
							<td>
								<input type="file" name="uploadFilea" multiple="multiple">
							</td>
						</tr>
						 <tr>
							<td width="200px">
								패키지 이미지1 
							</td>
							<td>
								<input type="file" name="uploadFileb" multiple="multiple">
							</td>
						</tr>
						<tr>
							<td width="200px">
								패키지 이미지2
							</td>
							<td>
								<input type="file" name="uploadFilec" multiple="multiple">
							</td>
						</tr>
						<tr>
							<td width="200px">
								패키지 이미지3
							</td>
							<td>
								<input type="file" name="uploadFiled" multiple="multiple">
							</td>
						</tr>
						<tr>
							<td width="200px">
								패키지 이미지4
							</td>
							<td>
								<input type="file" name="uploadFilee" multiple="multiple">
							</td>
						</tr>
						<tr>
							<td width="200px">
								상품 정보
							</td>
							<td>
								<input type="text" name="p_information" style="width:500px ;height:200px">
							</td>
						</tr>
						<tr>
							<td width="200px">
								이용 안내
							</td>
							<td>
								<input type="text" name="p_guide" style="width:500px ;height:200px">
							</td>
						</tr>
						<tr>
							<td width="200px">
								패키지 인원
							</td>
							<td>
								<input type="number" name="p_max">
							</td>
						</tr>
						<tr>
							<td width="200px">
								패키지 금액
							</td>
							<td>
								<input type="number" name="p_fee">
								<input type="hidden" name="p_division" value="등록완료">
							</td>
						</tr>
						<tr height="150px">
							<td colspan="2" style="text-align:center"><button style="width:200px;" id="buttonB">패키지 등록</button></td>
						</tr>			
					</table>
				</form>
			</div>
					</div>
					</div>
				</div>
		</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<script type="text/javascript">
$(function(){
	
	$("#p_num").blur(function() {
		var p_num = $('#p_num').val();
			$.ajax({url : '${pageContext.request.contextPath}/pakage/checkp_num?p_num='+ p_num,
						type : 'get',
						success : function(data) {
							console.log("1 = 중복o / 0 = 중복x : "+ data);
							if (data == 1) {
								// 1 : 아이디가 중복되는 문구
								$("#pnum_check").text("번호가  이미 존재합니다.");
								$("#pnum_check").val("false");
							}else{
								$("#pnum_check").text("");
								$("#pnum_check").val("true");
							}
						}
			});
		});
	
	$("#p_period1").blur(function() {
 			if ($('#p_period1').val().length == 10 && $('#p_period1').val().indexOf(".") == 4 && $('#p_period1').val().lastIndexOf(".") == 7) {
 				
 				$("#p_period2").blur(function() {
 		 			if ($('#p_period2').val().length == 10 && $('#p_period2').val().indexOf(".") == 4 && $('#p_period2').val().lastIndexOf(".") == 7) {
 				 			$("#pperiod_check").text("");
 							$("#pperiod_check").val("true");
 		 			}else{
 		 				$("#pperiod_check").text("yyyy.mm.dd 형식으로 작성해주십시오.");
 						$("#pperiod_check").val("false");
 		 			}	
 				});
 			}else{
 				$("#pperiod_check").text("yyyy.mm.dd 형식으로 작성해주십시오.");
				$("#pperiod_check").val("false");
 			}	
		});
	

	
	
	
	var buttonB = $("#buttonB")
	var frm = $("#frm")
	
    $(buttonB).click(function(e){
    	e.preventDefault();
       	 
    	if($("#pnum_check").val() == "false"){
    		alert("중복되지 않은 번호를 입력 부탁드립니다.");
            return;
    	}if($("#pperiod_check").val() == "false"){
    		alert("패키지 여행기간 입력이 잘못되었습니다.");
            return;
    	}if($('input[name=p_num]').val() == ''){
    		alert("패키지 번호 입력 부탁드립니다.");
            return;
    	}if($('input[name=p_period1]').val() == ''){
    		alert("패키지 여행 시작일자 입력 부탁드립니다.");
            return;
    	}if($('input[name=p_period2]').val() == ''){
    		alert("패키지 여행 끝일자 입력 부탁드립니다.");
            return;
    	}if($('input[name=p_country]').val() == ''){
    		alert("나라 입력 부탁드립니다.");
            return;
    	}if($('input[name=p_region1]').val() == ''){
    		alert("지역1 입력 부탁드립니다.");
            return;
    	}if($('input[name=p_region2]').val() == ''){
    		alert("지역2 입력 부탁드립니다.");
            return;
    	}if($('input[name=p_name]').val() == ''){
    		alert("패키지명 입력 부탁드립니다.");
            return;
    	}if($('input[name=uploadFilea]').val() == ''){
    		alert("패키지 메인이미지 입력 부탁드립니다.");
            return;
    	}if($('input[name=p_information]').val() == ''){
    		alert("상품정보 입력 부탁드립니다.");
            return;
    	}if($('input[name=p_guide]').val() == ''){
    		alert("이용안내 부탁드립니다.");
            return;
    	}if($('input[name=p_max]').val() == ''){
    		alert("패키지 인원 입력 부탁드립니다.");
            return;
    	}if($('input[name=p_fee]').val() == ''){
    		alert("패키지 금액 입력 부탁드립니다.");
            return;
    	}else{
    		frm.submit();
    	}
        	
   	});
	
});

</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

		
	
