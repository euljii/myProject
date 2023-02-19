<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/eulji.css">

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
	<div class="contents">
		<form method="get">
			<table class="eTblView">
				<thead>
					<tr>
						<th  class="tdCenter">제목</th>
						<th><c:out value="${notice.n_title }" /></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tdCenter">글번호</td>
						<td><c:out value="${notice.n_num }" /></td>
					</tr>
					<tr>
						<td class="tdCenter">내용</td>
 						<td>
 							${notice.n_content } 
 							<br><br>
 							<c:if test="${ not empty notice.n_file && notice.n_file ne ',' }">
								<img src="/img/${notice.n_file }" name="${notice.n_file }" style="max-width: 800px; max-height: 500px;">
							</c:if>
							<c:choose>
								<c:when test="${ empty notice.n_file }">
								</c:when>
							</c:choose>
 						
 						</td>
					</tr>
					<tr>
						<td class="tdCenter">파일</td>
						<td>
							<c:if test="${ not empty notice.n_file && notice.n_file ne ',' }">
							    ${ notice.n_file} <br>
							</c:if>
							<c:choose>
								<c:when test="${ empty notice.n_file }">
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td class="tdCenter">최근 수정일</td>
						<td>
							<c:if test="${ not empty notice.n_updDate }">
							   <fmt:formatDate value="${notice.n_updDate}"
										pattern="yyyy년 MM월 dd일" />
							</c:if>
							<c:choose>
								<c:when test="${ empty notice.n_updDate }">
									<fmt:formatDate value="${notice.n_regDate}"
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
								<button data-oper="modify" class="searchBtn">글 수정</button>
								<button data-oper="remove" class="searchBtn" >글 삭제</button> 
							</c:if>
							<button data-oper="list" class="searchBtn" >목록</button> 
							
							<input type="hidden" id="n_num" name="n_num" value='<c:out value="${notice.n_num }"/>' />
							<br><br>
							도움이 더 필요하십니까?
							<button data-oper="letsGoObo" class="searchBtn" >문의하기</button> 
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>	<!-- div contents end -->
</section>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<script type="text/javascript">
$(function() {

	var formObj = $("form");
	$("button").on("click", function(e) {

		e.preventDefault();

		var operation = $(this).data("oper");

		if (operation == 'modify') {
			formObj.attr("action", "/notice/ntModify"); 

			var nowPageTag = $("input[name='nowPage']").clone();
			var cntPageTag = $("input[name='cntPage']").clone();

		}else if(operation == 'remove'){
			formObj.attr("action", "/notice/ntRemove"); 
			formObj.attr("method", "post"); 		//메소드를 get방식으로 변경
			
		}else if (operation == 'list') {
			formObj.attr("action", "/notice/ntList"); //리스트로 보냄

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
<jsp:include page="/WEB-INF/views/include/footer.jsp" />