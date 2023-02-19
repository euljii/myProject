<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/eulji.css">

<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
	<div class="contents">
		<form method="get">
			<table class="eTblView" style="width: 100%;">
				<thead>
					<tr>
						<th class="tdCenter">제목</th>
						<th>${obo.o_title }</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tdCenter">글번호</td>
						<td>${obo.o_num }</td>
					</tr>
					<tr>
						<td class="tdCenter">카테고리</td>
						<td>${obo.o_cat }</td>
					</tr>
					<tr>
						<td class="tdCenter">작성자</td>
						<!-- 나중에 m_idx 통해서 작성자 이름/닉네임 가져올 예정 -->
						<td>
							<c:choose>
								<c:when test="${ loginPublicInfo.m_auth == 'admin' }"> 
									관리자
								</c:when>
								<c:otherwise>
									${nick }
								</c:otherwise>
							</c:choose>						
						</td>
					</tr>
					<tr>
						<td class="tdCenter">내용</td>
 						<td>
 							${obo.o_content } 
 							<br><br>
 							<c:if test="${ not empty obo.o_file }">
								<img src="/img/${obo.o_file }" name="${obo.o_file }" style="max-width: 800px; max-height: 500px;">
							</c:if>
							<c:choose>
								<c:when test="${ empty obo.o_file }"> 
								</c:when>
							</c:choose>
 						
 						</td>
					</tr>
					<tr>
						<td class="tdCenter">파일</td>
						<td>
							<c:if test="${ not empty obo.o_file }">
							    ${ obo.o_file} <br>
							</c:if>
							<c:choose>
								<c:when test="${ empty obo.o_file }">
								</c:when>
							</c:choose>
						
						</td>
					</tr>
					<tr>
						<td class="tdCenter">최근 수정일</td>
						<td>
							<c:if test="${ not empty obo.o_updDate }">
							   <fmt:formatDate value="${obo.o_updDate}"
										pattern="yyyy년 MM월 dd일" />
							</c:if>
							<c:choose>
								<c:when test="${ empty obo.o_updDate }">
									<fmt:formatDate value="${obo.o_regDate}"
										pattern="yyyy년 MM월 dd일" />
								</c:when>
							</c:choose>			
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="tdCenter">
							<!-- session에 a_auth가 admin일 때 등록 버튼 보이도록 --> 
							<c:if test="${loginPublicInfo.m_auth == 'admin' }">
								<button data-oper="reply" class="searchBtn" >답글 작성</button>
								<button data-oper="modify" class="searchBtn" >글 수정</button>
								<button data-oper="remove" class="searchBtn" >글 삭제</button> 
							</c:if>
								
							<!-- session에 a_auth가 admin일 때 등록 버튼 보이도록 -->
							<c:choose>
								<c:when test="${loginPublicInfo.m_idx == obo.m_idx && loginPublicInfo.m_auth != 'admin' }">
									<button data-oper="modify" class="searchBtn" >글 수정</button>
									<button data-oper="remove" class="searchBtn" >글 삭제</button>
								</c:when>
								<c:when test="${loginPublicInfo.m_idx != obo.m_idx }">
								</c:when>
							</c:choose>
								
							<button data-oper="list"  class="searchBtn">목록</button> 
							<br><br>
							도움이 더 필요하십니까?
							<button data-oper="letsGoObo" class="searchBtn" >문의하기</button> 
							<input type="hidden" id="o_num" name="o_num" value='<c:out value="${obo.o_num }"/>' />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>	<!-- div contents end -->

</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<script type="text/javascript" src="/resources/js/E_obo.js"></script>
<script type="text/javascript">
$(function() {

	var formObj = $("form");
	$("button").on("click", function(e) {

		e.preventDefault();

		var operation = $(this).data("oper");
		
		if (operation == 'modify') {
			formObj.attr("action", "/obo/modify"); 

			var nowPageTag = $("input[name='nowPage']").clone();
			var cntPageTag = $("input[name='cntPage']").clone();
			
			formObj.append(nowPageTag);
			formObj.append(cntPageTag);

		}else if (operation == 'reply') {
			formObj.attr("action", "/obo/registerRe"); 

			var nowPageTag = $("input[name='nowPage']").clone();
			var cntPageTag = $("input[name='cntPage']").clone();
			
		}else if(operation == 'remove'){
			
			/* 
			// ajax 안 타면 이거 두 줄 쓰면 됨.
			formObj.attr("action", "/obo/remove"); 
			formObj.attr("method", "post"); */ 		
			
			console.log("버튼 누르면 이거 타는지?");
			var o_numValue = '<c:out value="${obo.o_num }"/>';

			oboService.remove(o_numValue,function(result) {
				console.log("버튼 누르면 이거 타는지?222");
				console.log("result 값 ? >> " + result);
			});	
			
			formObj.attr("action", "/obo/list"); //리스트로 보냄

		}else if (operation == 'list') {
			formObj.attr("action", "/obo/list"); //리스트로 보냄

			var nowPageTag = $("input[name='nowPage']").clone();
			var cntPageTag = $("input[name='cntPage']").clone();

			formObj.empty(); //form 안에있는 모든 데이터들을 다 날려버림

			formObj.append(nowPageTag);
			formObj.append(cntPageTag);
			
		}else if(operation == 'letsGoObo'){
			formObj.attr("action", "/obo/register");
		}
		formObj.submit();
	});
});
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
