<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/eulji.css">

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

	<section class="cont">
		<div class="contents" style="display: flex; justify-content: center;">
			<form action="ntList" method="get" id="actionForm">
				<div style="display: block; text-align: center;">		
					<select name="searchType" class="searchBox" style="text-align: center;">
						<option value="title" ${pageMaker.searchType eq 'title' ? 'selected' : '' }>제목</option>
						<option value="content" ${pageMaker.searchType eq 'content' ? 'selected' : '' }>내용</option>
						<option value="ticont" ${pageMaker.searchType eq 'ticont' ? 'selected' : '' }>제목+내용</option> 
					</select>				
					<input type="text" name="searchName" class="searchBox">
					<input type="submit" class="searchBtn" value=" 검색 ">
					<!-- <button type="submit" id="searchBtn" >검색</button> -->
				</div><!-- 검색 div end -->
				<br>
			 
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
		
					<!-- session에 a_auth가 admin일 때 등록 버튼 보이도록 -->
					<c:if test="${loginPublicInfo.m_auth == 'admin' }">
						<input type="button" id="regBtn" value="새 게시물 등록" class="searchBtn">
					</c:if>
					<br><br>
				</div> <!-- 옵션선택 끝 -->
				<!-- <br><br> -->
	
				<table class="eTbl">
					<thead>
					  <tr>
					    <th>글번호</th>
					    <th>제목</th>
					    <th>등록일</th>
					  </tr>
					</thead>
					<tbody>
						<c:forEach var="notice" items="${list }">
						  <tr>
							<td class="tdCenter"><c:out value="${notice.n_num }"></c:out></td>
							<td><a class="move" href="${notice.n_num }">
								<c:out value="${notice.n_title }"></c:out></a></td>
							<td class="tdCenter"><fmt:formatDate value="${notice.n_regDate}"
												pattern="yyyy년 MM월 dd일" /></td>				
						  </tr>
					  	</c:forEach>
					</tbody>
				</table>
			<br><br>
	
			<div style="display: block; text-align: center;">	
				<c:choose>
					<c:when test="${pageMaker.startPage != 1 && pageMaker.searchType eq ''}">
						<a href="ntList?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}" >&lt;</a>
					</c:when>	
					<c:when test="${pageMaker.startPage != 1 && pageMaker.searchType ne ''  }">
						<a href="ntList?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}
						&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}" >&lt;</a>
					</c:when>
				</c:choose>
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pageMaker.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != pageMaker.nowPage && pageMaker.searchType ne '' }">
							<a href="ntList?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}&searchType=${pageMaker.searchType}
							&searchName=${pageMaker.searchName}">
							${p }</a>
						</c:when>
						<c:when test="${p != pageMaker.nowPage && pageMaker.searchType eq '' }">
							<a href="ntList?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pageMaker.endPage != pageMaker.lastPage && pageMaker.searchType eq '' }">
						<a href="ntList?nowPage=${pageMaker.endPage+1 }&cntPerPage=${pageMaker.cntPerPage}" >&gt;</a>
					</c:when>
					<c:when test="${pageMaker.endPage != pageMaker.lastPage && pageMaker.searchType ne '' }">
						<a href="ntList?nowPage=${pageMaker.endPage+1 }&cntPerPage=${pageMaker.cntPerPage}
						&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}" >&gt;</a>
					</c:when>
				</c:choose>
			</div>	<!-- div paging end -->

		
			<input type="hidden" name="nowPage" value="${pageMaker.nowPage }"> 
			<input type="hidden" name="cntPage" value="${pageMaker.cntPage}">
			<input type="hidden" name="cntPerPage" value="${pageMaker.cntPerPage}">
		</form>
	</div>	<!-- div contents end -->
</section>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "ntList?&nowPage=1&cntPerPage="+sel;	// 7/8 cntPerPage 옵션 선택시 무조건 1페이지로 가기.

	}
	
	$(function() {
		
		$("#searchBtn").click(function() {
			location.href = "ntList?searchType=" + searchType + "&searchName=" + searchName
					+ "&nowPage=1&cntPerPage=" + sel;
					// + "&nowPage=${pageMaker.nowPage}&cntPerPage=" + sel;	// 7/8 검색시 무조건 1페이지로 가게
		})
		
		$("#regBtn").click(function() {
			location.href = '/notice/ntRegister';
		});
	
		var actionForm = $("#actionForm");
		
		// 조회시 이동
		$(".move").click(function(e) {
			// <a> 클릭 시 페이지 이동이 이루어지지 않게 하기 위해
			// e.preventDefault()를 이용.
			e.preventDefault();		 
			actionForm.append("<input type='hidden' name='n_num' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/notice/ntView");
			actionForm.submit();
		});
	})
</script>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
