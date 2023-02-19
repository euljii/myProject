<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/bomin.css">

<style>
	.corpInfoTable td{
	text-align: center;
	}
	
	.corpInfoTable tr{
		height: 45px;
		border-bottom: 1px solid #e9e9e9;
	}
	.corpInfoTable{
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
	<form action="manageCorp" method="get" id="actionForm">
		<div class="all" style="display: flex;">
			<jsp:include page="/WEB-INF/views/include/adminMenuBar.jsp"></jsp:include>
			<div class="content_section">
				<div class="content" style="margin: 10px; background-color: white;">
					<h1 style="border-bottom: 1px solid #e9e9e9;">기업 회원 목록</h1>
					<div style="width: 530px; height: 265px; margin: auto;">
						<div class ="chartjs">
							<div class ="clinechart"><canvas id="clinechart"></canvas></div>
						</div>
					</div>
					<div style="display: flex; justify-content: space-between;">
						<h3>총 기업회원 수  ${total } </h3> 
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
								<option value="c_id" ${pageMaker.searchType eq 'c_id' ? 'selected' : '' }>아이디</option>
								<option value="c_dname" ${pageMaker.searchType eq 'c_dname' ? 'selected' : '' }>담당자 이름</option>
								<option value="c_name" ${pageMaker.searchType eq 'c_name' ? 'selected' : '' }>기업명</option> 
							</select>				
							<input type="text" name="searchName" class="searchBox" style="width: 150px; height: 21px; padding-left: 18px; padding-right: 18px;">
							<input type="submit" class="searchBtn" value=" 검색 " style="height: 25px;">
							<!-- <button type="submit" id="searchBtn" >검색</button> -->
						</div><!-- 검색 div end -->	
						<div>
							<button id="userDelete" class="i">삭제</button>
						</div>
					</div>
					<div>
						<table style="background-color: white; width: 100%;" class="corpInfoTable">
							<tr style="background: #41d4b8; color: white; font-weight: bold;">
								<td colspan="2" style="border-bottom-left-radius: 3px; border-top-left-radius: 3px;"><input type="checkbox" id="allcheckbox"></td>
								<td>아이디</td>
								<td>기업명</td>
								<td>사업자등록번호</td>
								<td>담당자 이름</td>
								<td>담당자 이메일</td>
								<td style="border-bottom-right-radius: 3px; border-top-right-radius: 3px;">담당자 연락처</td>
							</tr>
							<c:choose>
								<c:when test="${not empty corpList }">
									<c:forEach var="corpList" items="${corpList }">
										<tr>
											<td><input type="hidden" name="array_cidx" id="array_cidx"></td>
											<td><input type="checkbox" class="onecheckbox" name="c_idx" value="${corpList.c_idx}"></td>
											<td><c:out value="${corpList.c_id}"></c:out></td>
											<td><c:out value="${corpList.c_name}"></c:out></td>
											<td><c:out value="${corpList.c_code}"></c:out></td>
											<td><c:out value="${corpList.c_dname}"></c:out></td>
											<td><c:out value="${corpList.c_demail}"></c:out></td>
											<td><c:out value="${corpList.c_dphone}"></c:out></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<h5>기업 회원이 없습니다.</h5>
								</c:otherwise>
							</c:choose>
						</table>
		<div style="display: block; text-align: center;">	
				<c:choose>
					<c:when test="${pageMaker.startPage != 1 && pageMaker.searchType eq ''}">
						<a href="manageCorp?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}" >&lt;</a>
					</c:when>	
					<c:when test="${pageMaker.startPage != 1 && pageMaker.searchType ne ''  }">
						<a href="manageCorp?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}
								&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}" >&lt;</a>
					</c:when>
				</c:choose>
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pageMaker.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != pageMaker.nowPage && pageMaker.searchType ne '' }">
							<a href="manageCorp?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}
							&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}">
							${p }</a>
						</c:when>
						<c:when test="${p != pageMaker.nowPage && pageMaker.searchType eq '' }">
							<a href="manageCorp?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pageMaker.endPage != pageMaker.lastPage && pageMaker.searchType eq '' }">
						<a href="manageCorp?nowPage=${pageMaker.endPage+1 }&cntPerPage=${pageMaker.cntPerPage}" >&gt;</a>
					</c:when>
					<c:when test="${pageMaker.endPage != pageMaker.lastPage && pageMaker.searchType ne '' }">
						<a href="manageCorp?nowPage=${pageMaker.endPage+1 }&cntPerPage=${pageMaker.cntPerPage}
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
		$("input:checkbox[name=c_idx]:checked").each(function () {
			checkBoxArray.push(this.value);
		});
		$("#array_cidx").val(checkBoxArray);
		
		if($('.onecheckbox').is(':checked') == false){
			alert("선택된 회원이 없습니다.");
		}else{
			if(confirm("회원을 삭제하시겠습니까?") == true){
				$.ajax({
					url : "/Admin/corpDelete",
					type : "post",
					traditional : true,
					data : {"c_idx" : checkBoxArray},
					dataType: "json",
					success : function (data) {
						alert("회원을 삭제했습니다.");
						//location.reload();
						$(".corpInfoTable").load("${contextPath}/Admin/manageCorp .corpInfoTable");
					}
				});
			}else{
				alert("삭제된 회원이 없습니다.");
			}
		}
	});
	$("#searchBtn").click(function() {
		location.href = "manageCorp?searchType=" + searchType + "&searchName=" + searchName
				+ "&nowPage=1&cntPerPage=" + sel;
				// + "&nowPage=${pageMaker.nowPage}&cntPerPage=" + sel;	// 7/8 검색시 무조건 1페이지로 가게
	})
});
$(document).ready(function(){ 
	getcGraph();
});
function getcGraph() {
	let c_regmonth = [];
	let c_joinSum = [];

	$.ajax({
		url : "${pageContext.request.contextPath}/Admin/countCmember",
		type : "get",
		dataType : "json",
		success : function (data) {
			for (let i = 0; i<data.length;i++){    				  
				console.log(data[i]);
				console.log(data[i].c_regmonth);
				console.log(data[i].c_joinSum);
				c_regmonth.push(data[i].c_regmonth);
				c_joinSum.push(data[i].c_joinSum);
		 	}
			new Chart(document.getElementById("clinechart"), {
				type: 'line',
				data: {
					labels: c_regmonth, //x축
					datasets:[{
						data: c_joinSum, //값
						label: "기업회원 가입 수",
						borderColor: "#41d4b8",
		    	        fill: false
						}]
				},
				options: {
		    	    title: {
		    	      display: true,
		    	      text: '월별 기업회원 가입 수'
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
	location.href = "manageCorp?&nowPage=1&cntPerPage="+sel;	// 7/8 cntPerPage 옵션 선택시 무조건 1페이지로 가기.

}
</script>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



