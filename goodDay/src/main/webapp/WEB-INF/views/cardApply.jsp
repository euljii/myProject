<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>입회신청 페이지</h1>
	<form id="frm_crd" action="crdApply" method="post">
	
		<div>	<!-- 조회 -->
<!-- 		주민번호 <input type="text" name="ssn">
			접수일자 <input type="text" name="rcv_d">
			접수 일련번호 <input type="text" name="rcv_seq_no">
			
			<button id="crdCheck">조회</button> -->
			<table id="tbl_crd">
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="SSN"></td>
					<td>접수일자</td>
					<td><input type="text" name="RCV_D"></td>
					<td>접수 일련번호</td>
					<td><input type="text" name="RCV_SEQ_NO">
						<button id="infoCheck" type="button">조회</button>
					</td>
				</tr>
				<tr>
					<td colspan="6">　</td>
				</tr>
				<tr>
					<td>신청일자</td>	<!-- ej 달력 형태로 넣을 것 -->
					<td><input type="text" name="APPL_D"></td>
					<td>신청구분</td>
					<td><select name="APPL_CLAS"> <!-- list -->
							<c:forEach var="applClasList" items="${applClasList}">
								<option value="${applClasList.CODE}">${applClasList.CODE_NM}</option>
							</c:forEach>
						
						</select>
					</td>
					<td>브랜드</td>
					<td><select name="BRD"> <!-- list -->
							<c:forEach var="brdList" items="${brdList}">
								<option value="${brdList.CODE}">${brdList.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>성명(한글)</td>
					<td><input type="text" name="HG_NM"></td>
					<td>성명(영문)</td>
					<td><input type="text" name="ENG_NM"></td>
					<td>생년월일</td>
					<td><input type="text" name="BIRTH_D"></td>
				</tr>
				<tr>
					<td>결제일자</td>
					<td><select name="STL_DD"> <!-- list -->
							<c:forEach var="stlDdList" items="${stlDdList}">
								<option value="${stlDdList.CODE}">${stlDdList.CODE_NM}</option>
							</c:forEach>
						
						</select>
					</td>
					<td>결제방법</td>
					<td><select name="STL_MTD"> <!-- list -->
							<c:forEach var="stlMtdList" items="${stlMtdList}">
								<option value="${stlMtdList.CODE}">${stlMtdList.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<td>결제은행</td>
					<td><select name="BNK_CD"> <!-- list -->
							<c:forEach var="bnkCdList" items="${bnkCdList}">
								<option value="${bnkCdList.CODE}">${bnkCdList.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>결제계좌</td>
					<td colspan="5">
						 <input type="text" name="STL_ACT">
					</td>
				</tr>
				<tr>
					<td colspan="2">청구서 발송방법
						<select name="STMT_SND_MTD"> <!-- list -->
							<c:forEach var="stmtSndMtdList" items="${stmtSndMtdList}">
								<option value="${stmtSndMtdList.CODE}">${stmtSndMtdList.CODE_NM}</option>
							</c:forEach>
						</select>
						
					<td>우편번호</td>
					<td colspan="3">
						<input type="text" name="BILLADR_ZIP">
						<input type="button" id="daumAddrBtn" value="우편번호 찾기">
						<input type="text" name="BILLADR_ADR1">
						<input type="text" name="BILLADR_ADR2"><!-- 상세주소 -->
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="EMAIL_ADR"></td>
					<td>핸드폰 번호</td>
					<td><input type="text" name="HDP_NO"></td>
					<td>비밀번호</td>
					<td><input type="password" name="SCRT_NO"></td>
				</tr>
				<tr>
					<td>불능 구분</td>
<!-- 				ej) 불능처리 ~ 나중에 readonly로 바꿀 것 -->
					<td><input type="text" name="IMPSB_CLAS" ></td>
					<td>불능 사유명</td>
					<td colspan="3"><input type="text" name="IMPSB_CD"></td>
				</tr>
			</table>
		</div>
	</form>
	
	<br><br>
	
	<button id="btn_apply">등록</button>
	<button>수정</button>
	<input type="reset" value="초기화">

</body>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 다음 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	$(function() {
		
		$("#daumAddrBtn").click(function() {	// infoCheck 버튼 누르면 실행되는 애 
		    
			new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                /* document.getElementsByName("BILLADR_ZIP").value = data.zonecode; // 주소 넣기
	                document.getElementsByName("BILLADR_ADR1").value = data.address; // 주소 넣기
	                document.getElementsByName("BILLADR_ADR2").value = data.address; // 주소 넣기 */
	                
	            	$("input[name='BILLADR_ZIP']").val(data.zonecode);
	            	$("input[name='BILLADR_ADR1']").val(data.address);
					$("input[name='BILLADR_ADR2']").focus();
	            }
	        }).open();
		});
		
		// 조회 btn
		$("#infoCheck").click(function() {	// infoCheck 버튼 누르면 실행되는 애 
			
			// var 변수에 담아준다
			var SSN = $("input[name='SSN']").val();
			var RCV_D = $("input[name='RCV_D']").val();
			var RCV_SEQ_NO = $("input[name='RCV_SEQ_NO']").val();
			
			// 20세기와 21세기 탄생 구분
 			if(SSN.substr(6,1)=='1' || SSN.substr(6,1)=='2'){
				var BIRTH = 19+SSN.substr(0,6);
			}else if(SSN.substr(6,1)=='3' || SSN.substr(6,1)=='4'){
				var BIRTH = 20+SSN.substr(0,6);
				
			}

			$("input[name='BIRTH_D']").val(BIRTH);
			
			$.ajax({				
				url : "/W2_card/selectBtn",	
				type : 'POST',
				dataType : "json",			
				data : {			// data : 보낼 데이터
					SSN : SSN,
					RCV_D : RCV_D,
					RCV_SEQ_NO : RCV_SEQ_NO
				}, 
				success : function(result) {	// 성공하면 타는 넘
					console.log(result);		// 필요한 값이 잘 받아졌는지 console에 찍어보기
					
					var hg_nm = result.hg_NM;	
					var eng_nm = result.eng_NM;	
					var STL_MTD = result.STL_MTD;	
					var STL_ACT = result.stl_ACT;	
					var BNK_CD = result.BNK_CD;	
					var STL_DD = result.STL_DD;	
					var STMT_SND_MTD = result.STMT_SND_MTD;	
					var BILLADR_ZIP = result.billadr_ZIP;	
					var BILLADR_ADR1 = result.billadr_ADR1;	
					var BILLADR_ADR2 = result.billadr_ADR2;	
					var email = result.email_ADR;	
					var HDP_NO = result.hdp_NO;	
					
					console.log()

					// ~랜더링~ 
					$("input[name='HG_NM']").val(hg_nm);
					$("input[name='ENG_NM']").val(eng_nm);
					
					$("input[name='STL_MTD']").val(STL_MTD);
					$("input[name='STL_ACT']").val(STL_ACT);
					$("input[name='BNK_CD']").val(BNK_CD);
					$("input[name='STL_DD']").val(STL_DD);
					$("input[name='STMT_SND_MTD']").val(STMT_SND_MTD);
					$("input[name='BILLADR_ADR1']").val(BILLADR_ADR1);
					$("input[name='BILLADR_ADR2']").val(BILLADR_ADR2);
					$("input[name='BILLADR_ZIP']").val(BILLADR_ZIP);
					$("input[name='HDP_NO']").val(HDP_NO);
					$("input[name='EMAIL_ADR']").val(email);
					
				},
				error : function() {
					alert("이전 기록이 없습니다.");
				}
			});

		});
		
		$("#btn_apply").click(function() {
			
			var SSN = $("input[name='SSN']").val();
			var SCRT_NO = $("input[name='SCRT_NO']").val();
			
			// 빈값 체크
			if(SSN == ""){
				alert("주민번호를 입력하세요.");
				return;
			}
			
			var alpaBig= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";    
			var alpaSmall= "abcdefghijklmnopqrstuvwxyz";    
			var num = "01234567890";

			// 등록한 비밀번호가 연속된숫자, 핸드폰번호와 동일,동일숫자입력,생년월일과 동일한경우
			//if(SCRT_NO == )
			
			
			
			
			$("#frm_crd").submit();
		});
		
		
	});
</script>
</html>