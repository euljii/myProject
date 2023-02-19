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
	.infotable td{
		width: 100%;
		height: 100%;
		border-bottom: 1px solid #dddddd;
		padding: 20px 0 0 0;
	}
	.btn-upload {
	  width: 30px;
	  height: 30px;
	  background: #fff;
	  border-radius: 33px;
	  cursor: pointer;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	.public_account_inner{
		display: flex; 
		flex-direction: column; 
		align-items: center; 
		margin: 15px 0px 0px 0px;
	}

	#file {
	  display: none;
	}
	.pakageList{
		margin-top: 70px;
		border-bottom: 1px gray solid;
	}
</style>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

		<section class="cont2">
			<div class="all" style="display: flex;">
				<jsp:include page="/WEB-INF/views/include/publicMenuBar.jsp"></jsp:include>
				<div class="content_section">
					<div class="content">
						<div>
		            		<form action="/pakage/P_pakageList" method="get" id="actionForm">
		           			</form>
						</div>
						<input type="hidden" name="m_idx" value="${loginPublicInfo.m_idx}" >
						<h2>${loginPublicInfo.m_name}님의 위시리스트🎆</h2>
				<div class="pakageSection">
		        	<c:choose>
		        		<c:when test="${not empty wishlist }">
				             <c:forEach var="wish" items="${wishlist }">
						             <div class="pakageList">
						             		<div style="position: relative;">
						             			<a href="/pakage/P_get?p_num=${wish.p_num }">
						                   			<img alt="이미지" src="/img/${wish.p_mainimg }" width="280px" height="180px"/>
					                   			</a>
					                   			<div class="change">
						                   			<c:choose>
						                   				<c:when test="${empty loginPublicInfo.m_idx || empty heart}">
															<div style="position: absolute; top: 5px; right: 10px" class="heart1">
				                   								<img alt="이미지" src="/img/h2.svg" data-num="${wish.p_num}" class="wish" style="cursor: pointer;"/>
				                   							</div>
						                   				</c:when>
						                   				<c:otherwise>
						                   				<c:set var="loop_flag" value="false"/>
								                   			<c:forEach var="heart" items="${heart}">
																<c:if test="${wish.p_num eq heart.p_num}">
									                   				<c:if test="${not loop_flag }">
																			<div style="position: absolute; top: 5px; right: 10px" class="heart2">
								                   								<img alt="이미지" src="/img/h1.svg" data-num="${wish.p_num}" class="wish" style="cursor: pointer;"/>
								                   							</div>
								                   								<c:set var="loop_flag" value="true"/>
								                   					</c:if>
																</c:if>
																<c:if test="${wish.p_num ne heart.p_num}">
																	<c:if test="${not loop_flag }">
																		<div style="position: absolute; top: 5px; right: 10px" class="heart3">
							                   								<img alt="이미지" src="/img/h2.svg" data-num="${wish.p_num}" class="wish" style="cursor: pointer;"/>
							                   							</div>
							                   						</c:if>
																</c:if>
										           			</c:forEach>
						                   				</c:otherwise>
						                   			</c:choose>
					                   			</div>
						                    </div>
						                   	<div style="padding: 10px;">
					             			<a href="/pakage/P_get?p_num=${wish.p_num }">
						                 		<div style="color: gray"><c:out value="${wish.p_region2}"/></div>
						                 		<div style="height:50px; font-weight: bold;"><c:out value="${wish.p_name}"/></div>
						                 		<div><c:out value="${wish.p_period}"/></div>
												<c:choose>
					                             	 <c:when test="${wish.p_star gt 4.5}">
					                                          <span class="gold" style="color:#41d4b8;">★★★★★<c:out value="${wish.rcount}"/></span>
					                                 </c:when>
					                                 <c:when test="${wish.p_star gt 3.5}">
					                                          <span class="gold" style="color:#41d4b8">★★★★<c:out value="${wish.rcount}"/></span>
					                                 </c:when>
					                                 <c:when test="${wish.p_star gt 2.5}">
					                                          <span class="gold" style="color:#41d4b8">★★★<c:out value="${wish.rcount}"/></span>
					                                 </c:when>
					                                 <c:when test="${wish.p_star gt 1.5}">
					                                          <span class="gold" style="color:#41d4b8">★★<c:out value="${wish.rcount}"/></span>
					                                 </c:when>
					                                 <c:when test="${wish.p_star gt 0.5}">
					                                          <span class="gold" style="color:#41d4b8">★<c:out value="${wish.rcount}"/></span>
					                                 </c:when>
													<c:otherwise>
																<span class="gold" style="color:#41d4b8">후기 이벤트 진행중</span>
													</c:otherwise>
					                              </c:choose>
					                              <br>
						                 		<fmt:formatNumber value="${wish.p_fee }" pattern="#,###" />원 /1인
							                </a>
						                   </div>
					                 </div>
				             </c:forEach>
				          </c:when>
		 		          <c:otherwise>
								<h4 style="margin-top: 50px; margin-left: 20px">위시리스트가 존재하지 않습니다.</h4>
		 		          </c:otherwise>
		             </c:choose>
				</div>
					</div>
				</div>
			</div>
		</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<script type="text/javascript">

$(function(){
	
	
   	var m_idx = $("input[name=m_idx]").val();
   	var heart1 = $(".heart1") 
   	var heart2 = $(".heart2")
   	var heart3 = $(".heart3")
   	var change = $(".change")
   	
    $(heart1).on("click", "img",function(e){
    	
    	var actionForm = $("#actionForm");
    	var p_num = $(this).data("num");
       	
    	if(m_idx == ''){
    		alert("로그인 후 이용가능합니다.");
    		actionForm.attr("action", "/Member/login");
            actionForm.append("<input type='hidden' name='p_num' value='"+$(this).attr("href")+"'>");
            actionForm.submit();
    	}else{
    		
    		var param = {p_num:p_num, m_idx:m_idx};
    		var str = '';
    		
     		$.ajax({
        		type : 'post',
        		data : JSON.stringify(param),
        		url : '${pageContext.request.contextPath}/pakage/P_wishinsert',
        		contentType : 'application/json; charset=utf-8',
        		success :function(){
        			location.href = "/pakage/P_pakageMain";
        			document.location.reload();
        			history.go(0);		
        		}
        	}); 
    	}
    });
   	
    $(heart3).on("click", "img",function(e){
    	
    	var actionForm = $("#actionForm");
    	var p_num = $(this).data("num");
       	
    	if(m_idx == ''){
    		alert("로그인 후 이용가능합니다.");
    		actionForm.attr("action", "/Member/login");
            actionForm.append("<input type='hidden' name='p_num' value='"+$(this).attr("href")+"'>");
            actionForm.submit();
    	}else{
    		
    		var param = {p_num:p_num, m_idx:m_idx};
    		var str = '';
    		var p_num = $(this).data("num");
    		
     		$.ajax({
        		type : 'post',
        		data : JSON.stringify(param),
        		url : '${pageContext.request.contextPath}/pakage/P_wishinsert',
        		contentType : 'application/json; charset=utf-8',
        		success :function(){
        			location.href = "/pakage/P_pakageMain";
        			document.location.reload();
        			history.go(0);		
        		}
        	}); 
    	}
    });
    
    $(heart2).on("click", "img",function(e){
    	
    	
    	var actionForm = $("#actionForm");
    	var p_num = $(this).data("num");
       	
    	if(m_idx == ''){
    		alert("로그인 후 이용가능합니다.");
    		actionForm.attr("action", "/Member/login");
            actionForm.append("<input type='hidden' name='p_num' value='"+$(this).attr("href")+"'>");
            actionForm.submit();
    	}else{
    		
    		var param = {p_num:p_num, m_idx:m_idx};
    		var str = '';
    		var p_num = $(this).data("num");
    		
     		$.ajax({
        		type : 'post',
        		data : JSON.stringify(param),
        		url : '${pageContext.request.contextPath}/pakage/P_wishdelete',
        		contentType : 'application/json; charset=utf-8',
        		success :function(){
        			location.href = "/pakage/P_pakageMain";
        			document.location.reload();
        			history.go(0);		
        		}
        	}); 
    	}
    });
});

</script>				
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

		
	
