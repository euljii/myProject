<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
마이페이지여요.
	<div class="all" style="display: flex;">
		<jsp:include page="/WEB-INF/views/include/adminMenuBar.jsp"></jsp:include>
		<div class="content_section" style="border: 1px solid black; width: 85%; background-color: #E8EFFF;">
			<div class="content" style="margin: 10px; background-color: white;">
			
				<div class="contents" style="display: flex; justify-content: center;">
					<form action="ntList" method="get" id="actionForm">
						<div class="search" style="display: block; text-align: center;">		
							<select name="searchType">
								<option value="title" ${pageMaker.searchType eq 'title' ? 'selected' : '' }>제목</option>
								<option value="content" ${pageMaker.searchType eq 'content' ? 'selected' : '' }>내용</option>
								<option value="ticont" ${pageMaker.searchType eq 'ticont' ? 'selected' : '' }>제목+내용</option> 
							</select>				
							<input type="text" name="searchName">
							<button type="submit" id="searchBtn">검색</button>
						</div>
					 
						<h3 style="float: left;">총 글수  ${total } </h3> 
						<br><br>
			
						<table class="boardTbl">
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
									<td><c:out value="${notice.n_num }"></c:out></td>
									<td><a class="move" href="${notice.n_num }">
										<c:out value="${notice.n_title }"></c:out></a></td>
									<td><fmt:formatDate value="${notice.n_regDate}"
														pattern="yyyy년 MM월 dd일" /></td>				
								  </tr>
							  	</c:forEach>
							</tbody>
						</table>
						<br>
			
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
										<a href="ntList?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}">
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
			</div>
		</div>
	</div>
</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<script>
$(function() {
	
	// 조회시 이동
	$(".move").click(function(e) {
		// <a> 클릭 시 페이지 이동이 이루어지지 않게 하기 위해
		// e.preventDefault()를 이용.
		e.preventDefault();		 
		actionForm.append("<input type='hidden' name='n_num' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/mypage/ntView");
		actionForm.submit();
	});
	
});

</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp"/>