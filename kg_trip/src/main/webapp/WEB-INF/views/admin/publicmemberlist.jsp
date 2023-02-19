<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/bomin.css">
<style>
	.publicInfoTable td{
	text-align: center;
	}
	/* .pinfo{
	width: 100px;
	text-align: center;
	border: none;
	font-size: 16px;
	} */
	.publicInfoTable tr{
		height: 45px;
		border-bottom: 1px solid #e9e9e9;
	}
	.publicInfoTable{
		font-size: 16px;
		border-collapse: collapse;
	}
	.i{
		width: 39px;
		height: 25px;
	}
</style>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont2">
	<form action="managePublic" method="get" id="actionForm">
	<div class="all" style="display: flex;">
		<jsp:include page="/WEB-INF/views/include/adminMenuBar.jsp"></jsp:include>
		<div class="content_section">
			<div class="content" style="margin: 10px; background-color: white;">
				<h1 style="border-bottom: 1px solid #e9e9e9;">개인 회원 관리</h1>
				<div style="width: 530px; height: 265px; margin: auto;">
					<div class ="chartjs">
						<div class ="plinechart"><canvas id="plinechart"></canvas></div>
					</div>
				</div>
				<br>
				<div style="display: flex; justify-content: space-between;">
					<h4>총 개인회원 수  ${total } </h4> 
					<div> <!-- 옵션 선택 -->
						<select id="cntPerPage" name="sel" onchange="selChange()" class="searchBox" style="width: 85px; height: 25px; border-radius: 3px; font-size: 13px;">
							<option value="5"
								<c:if test="${pageMaker.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
							<option value="10"
								<c:if test="${pageMaker.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
							<option value="15"
								<c:if test="${pageMaker.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
							<option value="20"
								<c:if test="${pageMaker.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
							</select>
					</div> <!-- 옵션선택 끝 -->
				</div>
				<div style="display: flex; justify-content: space-between; margin-top: 5px; margin-bottom: 10px;">
					<div>		
						<select name="searchType" class="searchBox" style="width: 100px; height: 25px;">
							<option value="m_id" ${pageMaker.searchType eq 'm_id' ? 'selected' : '' }>아이디</option>
							<option value="m_nickname" ${pageMaker.searchType eq 'm_nickname' ? 'selected' : '' }>닉네임</option>
							<option value="m_name" ${pageMaker.searchType eq 'm_name' ? 'selected' : '' }>이름</option> 
						</select>				
						<input type="text" name="searchName" class="searchBox" style="width: 150px; height: 21px; padding-left: 18px; padding-right: 18px;">
						<input type="submit" class="searchBtn" value=" 검색 " style="height: 25px;">
						<!-- <button type="submit" id="searchBtn" >검색</button> -->
					</div><!-- 검색 div end -->
					<div>
						<button id="authUpdate" class="i">변경</button>
						<button id="userDelete" class="i">삭제</button>
					</div>
				</div>
					<table style="background-color: white; width: 100%;" class="publicInfoTable" >
						<tr style="background: #41d4b8; color: white; font-weight: bold;">
							<td colspan="2" style="border-bottom-left-radius: 3px; border-top-left-radius: 3px;"><input type="checkbox" id="allcheckbox"></td>
							<td>아이디</td>
							<td>닉네임</td>
							<td>이름</td>
							<td>성별</td>
							<td>이메일</td>
							<td style="border-bottom-right-radius: 3px; border-top-right-radius: 3px;">휴대폰 번호</td>
						</tr>
						<c:choose>
							<c:when test="${not empty publicList }">
								<c:forEach var="publicList" items="${publicList }">
									<tr>
										<td><input type="hidden" name="array_midx" id="array_midx" ></td>
										<td><input type="checkbox" class="onecheckbox" name="m_idx" value="${publicList.m_idx}"></td>
										<td><c:out value="${publicList.m_id}"/></td>
										<td><c:out value="${publicList.m_nickname}"/></td>
										<td><c:out value="${publicList.m_name}"/></td>
										<td><c:out value="${publicList.m_gender}"/></td>
										<td><c:out value="${publicList.m_email}"/></td>
										<td><c:out value="${publicList.m_phone}"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h5>개인 회원이 없습니다.</h5>
							</c:otherwise>
						</c:choose>
					</table>
					<br>
					<div style="display: block; text-align: center; ">	
							<c:choose>
								<c:when test="${pageMaker.startPage != 1 && pageMaker.searchType eq ''}">
									<a href="managePublic?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}" >&lt;</a>
								</c:when>	
								<c:when test="${pageMaker.startPage != 1 && pageMaker.searchType ne ''  }">
									<a href="managePublic?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}
											&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}" >&lt;</a>
								</c:when>
							</c:choose>
							
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="p">
								<c:choose>
									<c:when test="${p == pageMaker.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != pageMaker.nowPage && pageMaker.searchType ne '' }">
										<a href="managePublic?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}
										&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}">
										${p }</a>
									</c:when>
									<c:when test="${p != pageMaker.nowPage && pageMaker.searchType eq '' }">
										<a href="managePublic?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${pageMaker.endPage != pageMaker.lastPage && pageMaker.searchType eq '' }">
									<a href="managePublic?nowPage=${pageMaker.endPage+1 }&cntPerPage=${pageMaker.cntPerPage}" >&gt;</a>
								</c:when>
								<c:when test="${pageMaker.endPage != pageMaker.lastPage && pageMaker.searchType ne '' }">
									<a href="managePublic?nowPage=${pageMaker.endPage+1 }&cntPerPage=${pageMaker.cntPerPage}
									&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}" >&gt;</a>
								</c:when>
							</c:choose>
						</div>	<!-- div paging end -->
						<input type="hidden" name="nowPage" value="${pageMaker.nowPage }"> 
						<input type="hidden" name="cntPage" value="${pageMaker.cntPage}">
						<input type="hidden" name="cntPerPage" value="${pageMaker.cntPerPage}">
				</div>
			</div>
		</div>
	</form>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#allcheckbox").click(function() {
		if($("#allcheckbox").is(":checked")) $(".onecheckbox").prop("checked", true);
		else $(".onecheckbox").prop("checked", false);
	});
	
	$(".onecheckbox").click(function() {
		var total = $(".onecheckbox").length;
		var checked = $(".onecheckbox:checked").length;
		
		if(total != checked) $("#allcheckbox").prop("checked", false);
		else $("#allcheckbox").prop("checked", true); 
	});
	
	$("#userDelete").click(function () {
		var checked = $(".onecheckbox:checked").length;
		var checkBoxArray = new Array();
		$("input:checkbox[name=m_idx]:checked").each(function () {
			checkBoxArray.push(this.value);
		});
		$("#array_midx").val(checkBoxArray);
		
		if($('.onecheckbox').is(':checked') == false){
			alert("선택된 회원이 없습니다.");
		}else{
			if(confirm("회원을 삭제하시겠습니까?") == true){
				$.ajax({
					url : "/Admin/pmemberDelete",
					type : "post",
					traditional : true,
					data : {"m_idx" : checkBoxArray},
					dataType: "json",
					success : function (data) {
						alert("회원을 삭제했습니다.");
						//location.reload();
						$(".publicInfoTable").load("${contextPath}/Admin/managePublic .publicInfoTable");
					}
				});
			}else{
				alert("삭제된 회원이 없습니다.");
			}
		}
	});
	
	$("#authUpdate").click(function () {
		var checked = $(".onecheckbox:checked").length;
		var checkBoxArray = new Array();
		$("input:checkbox[name=m_idx]:checked").each(function () {
			checkBoxArray.push(this.value);
		});
		$("#array_midx").val(checkBoxArray);
		
		if($('.onecheckbox').is(':checked') == false){
			alert("선택된 회원이 없습니다.");
		}else{
			if(confirm("관리자로 변경하시겠습니까?") == true){
				$.ajax({
					url : "/Admin/pmemberUpdate",
					type : "post",
					traditional : true,
					data : {"m_idx" : checkBoxArray},
					dataType: "json",
					success : function (data) {
						alert("관리자로 변경되었습니다.");
						//location.reload();
						$(".publicInfoTable").load("${contextPath}/Admin/managePublic .publicInfoTable");
					}
				});
			}else{
				alert("관리자로 변경된 회원이 없습니다.");
			}
		}
	});
	$("#searchBtn").click(function() {
		location.href = "managePublic?searchType=" + searchType + "&searchName=" + searchName
				+ "&nowPage=1&cntPerPage=" + sel;
				// + "&nowPage=${pageMaker.nowPage}&cntPerPage=" + sel;	// 7/8 검색시 무조건 1페이지로 가게
	})
});
$(document).ready(function(){ 
	getpGraph();
});

function getpGraph() {
	let m_regmonth = [];
	let m_joinSum = [];

	$.ajax({
		url : "${pageContext.request.contextPath}/Admin/countPmember",
		type : "get",
		dataType : "json",
		success : function (data) {
			for (let i = 0; i<data.length;i++){    				  
				console.log(data[i]);
				console.log(data[i].m_regmonth);
				console.log(data[i].m_joinSum);
				m_regmonth.push(data[i].m_regmonth);
				m_joinSum.push(data[i].m_joinSum);
		 	}
			new Chart(document.getElementById("plinechart"), {
				type: 'line',
				data: {
					labels: m_regmonth, //x축
					datasets:[{
						data: m_joinSum, //값
						label: "개인회원 가입 수",
						borderColor: "#41d4b8",
		    	        fill: false
						}]
				},
				options: {
		    	    title: {
		    	      display: true,
		    	      text: '월별 개인회원 가입 수'
		    	    }
		    	  }
		    	}); //그래프
		},
		error : function () {
			alert("실패");
		}
	})
	
}
function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href = "managePublic?&nowPage=1&cntPerPage="+sel;	// 7/8 cntPerPage 옵션 선택시 무조건 1페이지로 가기.

}

</script>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



