<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/eulji.css">

<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont2">
	<div class="all" style="display: flex;">
		<jsp:include page="/WEB-INF/views/include/publicMenuBar.jsp"></jsp:include>
		<div class="content_section" style="border: 1px solid black; width: 85%; padding: 25px; background-color: white;">
		<!-- 여기부터 쓰면 됨 -->
			<br>
			<!-- <div class="content" style="margin: 10px; background-color: white;"> -->
				<form action="list" method="get" id="actionForm">
			 
					<h3 style="float: left;">총 글수  ${total } </h3> 
				<div style="float: right;"> <!-- 옵션 선택 -->
				<select id="cntPerPage" name="sel" onchange="selChange()" class="searchBox">
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
				<br><br><br>
	
				<table class="eTbl">
					<thead>
					  <tr>
					    <th>글번호</th>
					    <th>카테고리</th>
					    <th>제목</th>
					    <th>등록일</th>
					  </tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="obo" items="${list }">
							  <tr>
								<td class="tdCenter"><c:out value="${obo.o_num }"></c:out></td>
								<td class="tdCenter"><c:out value="${obo.o_cat }"></c:out></td>
								<td ><a class="move" href="${obo.o_num }">
									<c:out value="${obo.o_title }"></c:out></a></td>
								<td class="tdCenter"><fmt:formatDate value="${obo.o_regDate}"
													pattern="yyyy년 MM월 dd일" /></td>				
							  </tr>
						  	</c:forEach>
						</c:when>
						<c:otherwise>
							작성한 글이 이 세상에 존재하지 않습니다.
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			<br>
	
			<div style="display: block; text-align: center;">	
				<c:choose>
					<c:when test="${pageMaker.startPage != 1}">
						<a href="oboList?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}" >&lt;</a>
					</c:when>	
					
				</c:choose>
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pageMaker.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != pageMaker.nowPage }">
							<a href="oboList?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}">${p }</a>
						</c:when>
						<c:otherwise>
							페이징!!!!!!!!!
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pageMaker.endPage != pageMaker.lastPage }">
						<a href="oboList?nowPage=${pageMaker.endPage+1 }&cntPerPage=${pageMaker.cntPerPage}" >&gt;</a>
					</c:when>
					
				</c:choose>
			</div>	<!-- div paging end -->

			<input type="hidden" name="nowPage" value="${pageMaker.nowPage }"> 
			<input type="hidden" name="cntPage" value="${pageMaker.cntPage}">
			<input type="hidden" name="cntPerPage" value="${pageMaker.cntPerPage}">
				
			</form>
			<!-- </div> -->
		</div>
	</div>
</section>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "oboList?&nowPage=1&cntPerPage="+sel;	// 7/8 cntPerPage 옵션 선택시 무조건 1페이지로 가기.
	}
	
	$(function() {
		
		var actionForm = $("#actionForm");
		
		// 조회시 이동
		$(".move").click(function(e) {
			e.preventDefault();		 
			actionForm.append("<input type='hidden' name='o_num' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/obo/view");
			actionForm.submit();
		});
	})
	
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>