<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<style type="text/css">
	.left-view{
		width: 900px;
		float: left;
		background-color: white;
	}
	.left-width{
		width: 800px;
		border-width: 0px 0px 1px 0px;
		border-style: solid;
		border-color: gray;
		padding : 10px;
		padding-bottom: 100px;
	}
	.right-view{
		width: 300px;
		float: right;
		background-color: white;
	}
	.remote{
		width: 280px;
		height : 450px;
		background-color: white;
		position : fixed;
		top : 0;
		right : 0;
		margin-top: 200px;
		margin-right: 220px;
		border: 1px solid gray;
		border-radius: 5px;
		padding : 30px;
	}
	.review{
		border-width: 0px 0px 1px 0px;
		border-style: solid;
		border-color: gray;
		padding : 20px;
	}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
		<section class="cont">
			<div class="left-view">
				<div class="left-width1" style="width:800px; height:200px; padding : 10px;"><br>
					<h5 style="color: gray; ">🚩 ${board.p_region2 }</h5><br>
					<h1>${board.p_name }</h1><br><br>
					<c:choose>
                          <c:when test="${board.p_star gt 4.5}">
                                      <a href="#review"><span class="gold" style="color:#41d4b8"> 후기 ★★★★★(<c:out value="${board.rcount}"></c:out>)</span></a>
                             </c:when>
                             <c:when test="${board.p_star gt 3.5}">
                                      <a href="#review"><span class="gold" style="color:#41d4b8"> 후기 ★★★★(<c:out value="${board.rcount}"></c:out>)</span></a>
                             </c:when>
                             <c:when test="${board.p_star gt 2.5}">
                                      <a href="#review"><span class="gold" style="color:#41d4b8"> 후기 ★★★(<c:out value="${board.rcount}"></c:out>)</span></a>
                             </c:when>
                             <c:when test="${board.p_star gt 1.5}">
                                      <a href="#review"><span class="gold" style="color:#41d4b8"> 후기 ★★(<c:out value="${board.rcount}"></c:out>)</span></a>
                             </c:when>
                             <c:when test="${board.p_star gt 0.5}">
                                      <a href="#review"><span class="gold" style="color:#41d4b8"> 후기 ★(<c:out value="${board.rcount}"></c:out>)</span></a>
                             </c:when>
							<c:otherwise>
								<a href="#review"><span class="gold" style="color:#41d4b8"> 후기 이벤트 진행중 ➡️</span></a>
							</c:otherwise>
                    </c:choose>
				</div>
				<div class="left-width">
					<c:choose>
						<c:when test="${not empty board.p_img1 }">
							<img alt="이미지" src="/img/${board.p_img1 }" width="800px">
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${not empty board.p_img2 }">
							<img alt="이미지" src="/img/${board.p_img2 }" width="800px">
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${not empty board.p_img3 }">
							<img alt="이미지" src="/img/${board.p_img3 }" width="800px">
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${not empty board.p_img4 }">
							<img alt="이미지" src="/img/${board.p_img4 }" width="800px">
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>
				</div><br><br>
				<div class="left-width">
					<h1>상품 정보</h1><br>
					${board.p_information }
				</div><br><br>
				<div class="left-width">
					<h1>이용 안내</h1><br>
					${board.p_guide }
				</div><br><br>
				<div class="left-width">
					<h1>취소 및 환불 규정</h1><br>
				■■■ 특별약관 규정안내 ■■■<br><br>
				▶이 상품은 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 일부 선납해 놓은 상품으로, 취소시 별도의 취소료가 적용됨을 양해해 주시기 바랍니다.<br>
				<br>
				1) 여행자의 여행계약 해제 요청이 있는 경우(여행자의 취소 요청시)<br>
				- 여행출발일 ~50일전까지 취소 통보시 - 계약금 환급<br>
				- 여행출발일 49~30일 전까지 취소 통보시 - 여행 요금의 10% 배상<br>
				- 29~20일전까지 취소 통보시 - 여행요금의 20% 배상<br>
				- 여행출발일 19~10일전까지 취소 통보시 - 여행요금의 30% 배상<br>
				- 여행출발일 9~1일전 / 당일 취소까지 취소 통보시 - 여행요금의 60% 배상<br>
				- 여행 출발일 이후는 취소가 불가합니다.<br>
				</div><br><br>
				<a name="review">
				<div class="left-width">
					<h1>후기</h1><br>
		        	<c:choose>
		        		<c:when test="${not empty review }">
						<h1><fmt:formatNumber value="${star.p_star}" pattern=".0"/>점</h1><br><br>
						<hr>
				             <c:forEach var="re" items="${review }">
						             <div class="review">
						                   <div>
						                 		<c:choose>
					                              <c:when test="${re.p_star eq 5}">
					                                          <span class="gold" style="color:#28c3a5;">★★★★★</span>
					                                 </c:when>
					                                 <c:when test="${re.p_star eq 4}">
					                                          <span class="gold" style="color:#28c3a5;">★★★★</span>
					                                 </c:when>
					                                 <c:when test="${re.p_star eq 3}">
					                                          <span class="gold" style="color:#28c3a5;">★★★</span>
					                                 </c:when>
					                                 <c:when test="${re.p_star eq 2}">
					                                          <span class="gold" style="color:#28c3a5;">★★</span>
					                                 </c:when>
					                                 <c:when test="${re.p_star eq 1}">
					                                          <span class="gold" style="color:#28c3a5;">★</span>
					                                 </c:when>
					                                 <c:otherwise>
					                                 			 <span class="gold">후기를 남겨주세요😄</span>
					                                 </c:otherwise>
					                              </c:choose>
					                            / <c:out value="${re.m_nickname}"/> / 
						                 		<c:out value="${re.p_reviewdate}"/><br><br>
						                 		<c:out value="${re.p_reviewcontent}"/><br><br>
						                   </div>
						             		<div>
						             		<c:choose>
						             			<c:when test= "${not empty re.p_reviewimg }">
						                   			<img alt="이미지" src="/img/${re.p_reviewimg }" width="200px" height="150px">
						                   		</c:when>
						                   		<c:otherwise>
						                   			
						                   		</c:otherwise>
						                   </c:choose>
						                   </div>
					                 </div>
				             </c:forEach>
				          </c:when>
	 		          <c:otherwise>
							<h5>후기가 없습니다.</h5>
	 		          </c:otherwise>
	                </c:choose>
	                <a name="bottom"></a>
				</div>
				</a>

				
			</div>
			<div class="right-view">
				<div class="remote" style="height:350px">
					<h2><fmt:formatNumber value="${board.p_fee }" pattern="#,###" />원 / (1인)</h2><br>
					예약 가능 인원 : <c:out value="${board.p_available}"/>인
					<input type="hidden" name="p_available" value="${board.p_available }" readonly="readonly"><br>
					<form action="people" method="post" id="operForm">
						예약 인원 : <input type="number" value="1" name="people" style="width:60px">인
						<input type="hidden" name="p_num" value="${board.p_num }"><br>
						<input type="hidden" name="m_idx" value="${loginPublicInfo.m_idx }"><br>
						<input type="submit" value="예약하기" name="reser" id="buttonB" style="margin-bottom: 10px;">
					</form>
					<div class="wish1" id="buttonC">
						<c:choose>
							<c:when test="${empty heart.w_num }">
								<a class="WishIcon-module__container--AE7UW1" >
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
						    		<path fill="none" fill-rule="evenodd" stroke="#CED4DA" stroke-width="1.25" d="M15.876 4.625c1.205 0 2.41.46 3.33 1.379.918.92 1.378 2.124 1.378 3.33 0 1.204-.46 2.41-1.379 3.329h0l-7.1 7.1-7.101-7.1c-.92-.92-1.379-2.125-1.379-3.33s.46-2.41 1.379-3.329c.92-.92 2.124-1.379 3.33-1.379 1.204 0 2.41.46 3.329 1.379.161.162.309.332.442.51.133-.178.28-.349.442-.51.919-.92 2.124-1.379 3.329-1.379z"></path>
						    	</svg>
								위시리스트 담기
								</a>
							</c:when>
							<c:otherwise>
								<a class="WishIcon-module__container--AE7UW2">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
						    		<path fill="#FA5B4A" fill-rule="evenodd" stroke="#FA5B4A" stroke-width="1.25" d="M15.876 4.625c1.205 0 2.41.46 3.33 1.379.918.92 1.378 2.124 1.378 3.33 0 1.204-.46 2.41-1.379 3.329h0l-7.1 7.1-7.101-7.1c-.92-.92-1.379-2.125-1.379-3.33s.46-2.41 1.379-3.329c.92-.92 2.124-1.379 3.33-1.379 1.204 0 2.41.46 3.329 1.379.161.162.309.332.442.51.133-.178.28-.349.442-.51.919-.92 2.124-1.379 3.329-1.379z"></path>
						    	</svg>
								위시리스트에 추가됨
								</a>
							</c:otherwise>
						</c:choose>
					</div><br><br>
					<div style="text-align: center; width: 280px">
						<a href = "#top" style="color: gray">맨 위로 🔼</a><br><br>
						<a href = "#bottom" style="color: gray">맨 아래로 🔽</a>
					</div>
				</div>
			</div>
				<form action="/pakage/P_pakageList" method="get" id="actionForm">
	            </form>
		</section>
		
<script type="text/javascript">
$(function(){
	
   	var m_idx = $("input[name=m_idx]").val();
    var p_num = $("input[name=p_num]").val();
   	var heart1 = $(".WishIcon-module__container--AE7UW1");
   	var heart2 = $(".WishIcon-module__container--AE7UW2");
   	var wish1 = $(".wish1");
   	
    $(heart1).on("click",function(e){
    	
    	var actionForm = $("#actionForm");
       	
    	if(m_idx == ''){
    		alert("로그인 부탁드립니다.");
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
        		success : function(){
        			location.href = "/pakage/P_get?p_num="+p_num;
        			document.location.reload();
        			history.go(0);		
        		}
        	}); 
    	}
    });
   	
    $(heart2).on("click",function(e){
    	
    	var actionForm = $("#actionForm");
       	
    	if(m_idx == ''){
    		alert("로그인 부탁드립니다.");
    		actionForm.attr("action", "/Member/login");
            actionForm.append("<input type='hidden' name='p_num' value='"+$(this).attr("href")+"'>");
            actionForm.submit();
    	}else{
    		
    		var param = {p_num:p_num, m_idx:m_idx};
   			var str = '';
    		
     		$.ajax({
        		type : 'post',
        		data : JSON.stringify(param),
        		url : '${pageContext.request.contextPath}/pakage/P_wishdelete',
        		contentType : 'application/json; charset=utf-8',
        		success : function(){
        			location.href = "/pakage/P_get?p_num="+p_num;
        			document.location.reload();
        			history.go(0);		
        		}
        	}); 
    	}
    });
   	
   	
    
    
    
    
   	
    var operForm=$("#operForm");
    
    $('input[name=reser]').click(function(e){
    	
    	var pe = parseInt($('input[name=people]').val());
    	var av = parseInt($("input[name=p_available]").val());
    	
    	console.log(pe);
    	
    	if(pe < 1 || pe === ""){
	    	e.preventDefault();
    		alert("1명 이상 선택해주세요.");
    		return;
    	}
    	
    	if(pe > av){
	    	e.preventDefault();
    		alert("예약 가능한 인원보다 많습니다.");
    		return;
    	}
    	
    	
    	
    });
 });
 


</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>