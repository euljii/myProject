<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<style>
	*{
	margin: 0px;
	padding: 0px;
	}
	.content_section{
		border: 1px solid #dddddd;
		width: 85%;
		padding: 30px 40px;
		border-radius : 5px;
	}
	.content{
		margin : 10px;
		background-color: white;
	}
 	table {
        width: 100%;
        border-collapse: collapse;
      }
      td {
        border-bottom: 1px solid #444444;
        padding: 10px;
        text-align: center;
      }

</style>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

		<section class="content">
			<div class="all" style="display: flex;">
			<jsp:include page="/WEB-INF/views/include/corpMenuBar.jsp"></jsp:include>
			<div class="content_section">
			<div class="content">
			<h2>${loginCorpInfo.c_dname}님의 패키지 목록</h2>
			<br>
             <div>
             	<table style="background-color: white; text-align:center">
					<c:choose>
		        		<c:when test="${not empty clist }">
		             		<tr>
		             			<td width=100px style="background-color:#41d4b8; color:white;">패키지번호</td>
		             			<td width=100px style="background-color:#41d4b8; color:white;"></td>
		             			<td width=100px style="background-color:#41d4b8; color:white;">지역</td>
		             			<td width=200px style="background-color:#41d4b8; color:white;">패키지명</td>
		             			<td width=100px style="background-color:#41d4b8; color:white;">패키지 기간</td>
		             			<td width=100px style="background-color:#41d4b8; color:white;">별점</td>
		             			<td width=100px style="background-color:#41d4b8; color:white;">가격(인)</td>
		             			<td width=100px style="background-color:#41d4b8; color:white;">구분</td>
		             			<td width=150px style="background-color:#41d4b8; color:white;">수정 /삭제</td>
		             		</tr>
				             <c:forEach var="clist" items="${clist }">
			             		<tr>
			             			<td>
			             				<c:out value="${clist.p_num}"></c:out>
			             			</td>
			                   		<td>
			                   			<img alt="이미지" src="/img/${clist.p_mainimg }" width="130px" height="100px">
		                   			</td>
		                   			<td>
			                 			<c:out value="${clist.p_region2}"></c:out>
		                 			</td>
		                 			<td>
	         						    <a href="/pakage/P_get?p_num=${clist.p_num }">
				                 			<c:out value="${clist.p_name}"></c:out>
		                 				</a>
		                 			</td>
		                 			<td>
				                 		<c:out value="${clist.p_period}"></c:out>
		                 			</td>
		                 			<td>
				                 		<c:choose>
			                              <c:when test="${clist.p_star == 0.0}">
                                    			후기 없음
			                                 </c:when>
											<c:otherwise>
												<c:out value="${clist.p_star}"></c:out>
											</c:otherwise>
			                              </c:choose>
		                 			</td>
		                 			<td>
				                 		<fmt:formatNumber value="${clist.p_fee }" pattern="#,###" />원
		                 			</td>
		                 			<td>
		                 				<c:out value="${clist.p_division}"></c:out>
		                 			</td>
		                 			<td>
		                 				  <a href="/pakage/P_cmodify?p_num=${clist.p_num }">수정</a>
		                 				 /
		                 				 <a href="/pakage/P_cdelete?p_num=${clist.p_num }"> 삭제</a>
		                 			</td>
			             			</tr>
					             </c:forEach>
					          </c:when>
			 		          <c:otherwise>
									<h5>&nbsp;&nbsp;등록된 패키지 상품이 없습니다.</h5>
			 		          </c:otherwise>
			             </c:choose>
		             		</table>
		                 </div>
					</div>
					</div>
				</div>
			</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

		
	
