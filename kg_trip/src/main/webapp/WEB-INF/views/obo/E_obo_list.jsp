<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/eulji.css">

<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
	<div class="contents" style="display: flex; justify-content: center;">
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
	
				<input type="button" id="regBtn" value="새 게시물 등록" class="searchBtn">
				
				<%-- <c:if test="${loginPublicInfo.m_auth == 'admin' || loginPublicInfo.m_auth == 'public' }">
					<input type="button" id="regBtn" value="새 게시물 등록" class="searchBtn">
				</c:if>
				<c:choose>
					<c:when test="${loginCorpInfo.c_auth == 'corp'}">
					<input type="button" id="NoRegBtn" value="새 게시물 등록" class="searchBtn">
					</c:when>
				</c:choose> --%>
				
				
				<br><br>
			</div> <!-- 옵션선택 끝 -->
	
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
					 <%-- <c:forEach var="obo" items="${list }">
					  <tr>
						<td class="tdCenter"><c:out value="${obo.o_num }"></c:out></td>
						<td class="tdCenter"><c:out value="${obo.o_cat }"></c:out></td>
						<td><a class="move" href="${obo.o_num }">
							<c:out value="${obo.o_title }"></c:out></a></td>
				            <img src="/img/padlock.png" name="padlock.png" alt="비밀글" style="width: 15px;">
						<td class="tdCenter"><fmt:formatDate value="${obo.o_regDate}"
											pattern="yyyy년 MM월 dd일" /></td>				
					  </tr>
				  	</c:forEach>  --%>
					<c:forEach var="obo" items="${list }">
						<tr>
							<td class="tdCenter"><c:out value="${obo.o_num }"></c:out></td>
							<td class="tdCenter"><c:out value="${obo.o_cat }"></c:out></td>
							
							<td>
								<c:choose>
									<c:when test="${obo.o_dataOpen eq 'Y'}" >
							        	<td>
								            <a class="move" href="${obo.o_num }">
											<c:out value="${obo.o_title }"></c:out></a>
										</td>
							        </c:when>
									<c:otherwise>
									<%-- <c:when test="${obo.o_dataOpen eq 'N' || obo.o_dataOpen eq '' || loginPublicInfo.m_idx eq ''}"> --%>
							            <c:choose>
							                <c:when test="${loginPublicInfo.m_idx == obo.o_OriginM_idx || loginPublicInfo.m_auth == 'admin' }">
							                <%-- <c:when test="${loginPublicInfo.m_idx == obo.m_idx || loginPublicInfo.m_auth == 'admin' 
							                || loginPublicInfo.m_idx == obo.o_OriginM_idx }"> --%>
							                    <a class="move" href="${obo.o_num }">
											<c:out value="${obo.o_title }"></c:out></a>
							                </c:when>
							                <c:otherwise>
							            		<img src="/img/padlock.png" name="padlock.png" alt="비밀글" style="width: 15px;">
							                	<span style="color:gray">비밀글은 작성자와 관리자만 볼 수 있습니다.</span>
						                	</c:otherwise>
							            </c:choose>
									</c:otherwise>
							        
								</c:choose>
					        </td>
					        
					        <td class="tdCenter">
					        	<fmt:formatDate value="${obo.o_regDate}" pattern="yyyy년 MM월 dd일" />
					        </td>
					  	</tr>
			        </c:forEach>
				</tbody>
			</table>
		<br><br>
	
		<div style="display: block; text-align: center;">	
			<c:choose>
				<c:when test="${pageMaker.startPage != 1 && pageMaker.searchType eq ''}">
					<a href="list?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}" >&lt;</a>
				</c:when>
				<c:when test="${pageMaker.startPage != 1 && pageMaker.searchType ne ''  }">
					<a href="list?nowPage=${pageMaker.startPage - 1 }&cntPerPage=${pageMaker.cntPerPage}
					&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}" >&lt;</a>
				</c:when>
			</c:choose>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="p">
				<c:choose>
					<c:when test="${p == pageMaker.nowPage }">
						<b>${p }</b>
					</c:when>
					
					<c:when test="${p != pageMaker.nowPage && pageMaker.searchType ne '' }">
						<a href="list?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}&searchType=${pageMaker.searchType}
						&searchName=${pageMaker.searchName}">
						${p }</a>
					</c:when>
				
					<c:when test="${p != pageMaker.nowPage && pageMaker.searchType eq '' }">
						<a href="list?nowPage=${p }&cntPerPage=${pageMaker.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			
			
				<c:choose>
				<c:when test="${pageMaker.endPage != pageMaker.lastPage && pageMaker.searchType eq '' }">
					<a href="list?nowPage=${pageMaker.endPage+1 }&cntPerPage=${pageMaker.cntPerPage}" >&gt;</a>
				</c:when>
				<c:when test="${pageMaker.endPage != pageMaker.lastPage && pageMaker.searchType ne '' }">
					<a href="list?nowPage=${pageMaker.endPage+1 }&cntPerPage=${pageMaker.cntPerPage}
					&searchType=${pageMaker.searchType}&searchName=${pageMaker.searchName}" >&gt;</a>
				</c:when>
			</c:choose>
		</div>	<!-- div paging end -->
	
		<input type="hidden" name="nowPage" value="${pageMaker.nowPage }"> 
		<input type="hidden" name="cntPage" value="${pageMaker.cntPage}">
		<input type="hidden" name="cntPerPage" value="${pageMaker.cntPerPage}">
		
		<!-- 등록btn 스크립트 처리 위해서  -->
		<input type="hidden" name="m_auth" value="${loginPublicInfo.m_auth}">
		<input type="hidden" name="c_auth" value="${loginCorpInfo.c_auth}">
		
	</form>
	</div>	<!-- div contents end -->	

</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<!-- 스크립트 -->
<script>

	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "list?&nowPage=1&cntPerPage="+sel;	// 7/8 cntPerPage 옵션 선택시 무조건 1페이지로 가기.
	}

	$(function() {
		
		var m_auth = $("input[name='m_auth']").val();	/* 개인회원 권한 */
		var c_auth = $("input[name='c_auth']").val();	/* 기업회원 권한 */
		
		$("#regBtn").click(function() {
			
			if(m_auth.trim() == 'admin' || m_auth.trim() == 'public'){
				location.href = '/obo/register';
				
			}else if(c_auth.trim() != ''){
				alert("개인회원으로 로그인하세요.");
				
			}else{
				alert("로그인하세요.");
				location.href = '/Member/login';
				
			}
		});
		
		/* $("#NoRegBtn").click(function() {
			alert("개인회원으로 로그인하세요.");
		}); */
		
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

		
	
