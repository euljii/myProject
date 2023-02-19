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
	<form>
	<div class="all" style="display: flex;">
		<jsp:include page="/WEB-INF/views/include/adminMenuBar.jsp"></jsp:include>
		<div class="content_section">
			<div class="content" style="margin: 10px; background-color: white;">
				<h1 style="border-bottom: 1px solid #e9e9e9;">관리자 목록</h1>
				<div style="display: flex;justify-content: flex-end;">
					<div style="margin-top: 5px; margin-bottom: 5px;">
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
							<td style="border-bottom-right-radius: 3px; border-top-right-radius: 3px;">이메일</td>
						</tr>
						<c:choose>
							<c:when test="${not empty publicList }">
								<c:forEach var="publicList" items="${publicList }">
									<c:if test="${publicList.m_auth == 'admin'}">
									<tr>
										<td><input type="hidden" name="array_midx" id="array_midx" ></td>
										<td><input type="checkbox" class="onecheckbox" name="m_idx" value="${publicList.m_idx}"></td>
										<td><c:out value="${publicList.m_id}"/></td>
										<td><c:out value="${publicList.m_nickname}"/></td>
										<td><c:out value="${publicList.m_name}"/></td>
										<td><c:out value="${publicList.m_gender}"/></td>
										<td><c:out value="${publicList.m_email}"/></td>
									</tr>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h5>개인 회원이 없습니다.</h5>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
		</div>
	</div>
	</form>
</section>
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
			alert("선택된 관리자가 없습니다.");
		}else{
			if(confirm("관리자를 삭제하시겠습니까?") == true){
				$.ajax({
					url : "/Admin/pmemberDelete",
					type : "post",
					traditional : true,
					data : {"m_idx" : checkBoxArray},
					dataType: "json",
					success : function (data) {
						alert("관리자를 삭제했습니다.");
						//location.reload();
						$(".publicInfoTable").load("${contextPath}/Admin/manageAdmin .publicInfoTable");
					}
				});
			}else{
				alert("삭제된 관리자가 없습니다.");
			}
		}
	});
	
});

</script>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />



