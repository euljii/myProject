<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />

    <!-- Demo styles -->
    <style>

      .swiper {
        width: 700px;
        height: 300px;
      }

      .swiper-slide {
        text-align: center;
        font-size: 10px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 700px;;
        height: 300px;
        object-fit: cover;
      }
    </style>
<style type="text/css">
	.searchSection{
		width: 1200px;
		height : 800px;
		background-color: white;
	}
	.pakageSection{
		width: 1200px;
	}
	.pakageList{
		width: 280px;
		height: 380px;
		float: left;
		background-color: white;
		border: 1px;
		border-style: solid;
		border-color: gray;
		border-radius: 5px;
		margin: 6px;
	}
	.pakageList:hover{
		box-shadow: 1px 1px 20px #ddd;
	}

</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

		<section class="cont">
			
			<div class="searchSection" style="width:1200px; height:340px;">
				<div style="width:700px; height:300px; float: left;">
					<!-- Main Swiper1 -->
				    <div class="swiper mySwiper">
				      <div class="swiper-wrapper">
				        <div class="swiper-slide"><a href="/pakage/P_get?p_num=tok001"><img alt="이미지" src="/img/pmain1.jpg"></a></div>
				        <div class="swiper-slide"><a href="/pakage/P_get?p_num=eng001"><img alt="이미지" src="/img/pmain2.jpg"></a></div>
				        <div class="swiper-slide"><a href="/pakage/P_get?p_num=dan001"><img alt="이미지" src="/img/pmain3.jpg"></a></div>
				        <div class="swiper-slide"><a href="/pakage/P_get?p_num=haw001"><img alt="이미지" src="/img/pmain4.jpg"></a></div>
				        <div class="swiper-slide"><a href="/pakage/P_get?p_num=sai001"><img alt="이미지" src="/img/pmain5.jpg"></a></div>
				      </div>
				      <div class="swiper-button-next"></div>
				      <div class="swiper-button-prev"></div>
				      <div class="swiper-pagination"></div>
				    </div>
				
				    <!-- Swiper JS -->
				    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
				
				    <!-- Initialize Swiper -->
				    <script>
				      var swiper = new Swiper(".mySwiper", {
				        spaceBetween: 30,
				        centeredSlides: true,
				        autoplay: {
				          delay: 2500,
				          disableOnInteraction: false,
				        },
				        pagination: {
				          el: ".swiper-pagination",
				          clickable: true,
				        },
				        navigation: {
				          nextEl: ".swiper-button-next",
				          prevEl: ".swiper-button-prev",
				        },
				      });
				    </script>
				</div>
				<div style="height:100px; float: right; width:500px; object-fit: cover; text-align: center;">
					<a href="/pakage/P_allList"><img alt="이미지" src="/img/psidemenu.png" height="300px"></a>
				</div>
			</div>
			<input type="hidden" name="m_idx" value="${loginPublicInfo.m_idx}" >
			<br><br><br>
			<!------------------------->
			<div style="height:450px">
				<h1>✈️  Best 유럽여행지 특가!</h1>
				<div class="pakageSection">
		        	<c:choose>
	        		<c:when test="${not empty listWeu }">
			             <c:forEach var="weu" items="${listWeu }">
					             <div class="pakageList">
					             		<div style="position: relative;">
					             			<a href="/pakage/P_get?p_num=${weu.p_num }">
					                   			<img alt="이미지" src="/img/${weu.p_mainimg }" width="280px" height="180px"/>
				                   			</a>
				                   			<div class="change">
					                   			<c:choose>
					                   				<c:when test="${empty loginPublicInfo.m_idx || empty heart}">
														<div style="position: absolute; top: 5px; right: 10px" class="heart1">
			                   								<img alt="이미지" src="/img/h2.svg" data-num="${weu.p_num}" class="wish" style="cursor: pointer;"/>
			                   							</div>
					                   				</c:when>
					                   				<c:otherwise>
					                   				<c:set var="loop_flag" value="false"/>
							                   			<c:forEach var="heart" items="${heart}">
															<c:if test="${weu.p_num eq heart.p_num}">
								                   				<c:if test="${not loop_flag }">
																		<div style="position: absolute; top: 5px; right: 10px" class="heart2">
							                   								<img alt="이미지" src="/img/h1.svg" data-num="${weu.p_num}" class="wish" style="cursor: pointer;"/>
							                   							</div>
							                   								<c:set var="loop_flag" value="true"/>
							                   					</c:if>
															</c:if>
															<c:if test="${weu.p_num ne heart.p_num}">
																<c:if test="${not loop_flag }">
																	<div style="position: absolute; top: 5px; right: 10px" class="heart3">
						                   								<img alt="이미지" src="/img/h2.svg" data-num="${weu.p_num}" class="wish" style="cursor: pointer;"/>
						                   							</div>
						                   						</c:if>
															</c:if>
									           			</c:forEach>
					                   				</c:otherwise>
					                   			</c:choose>
				                   			</div>
					                    </div>
					                   	<div style="padding: 10px;">
				             			<a href="/pakage/P_get?p_num=${weu.p_num }">
					                 		<div style="color: gray"><c:out value="${weu.p_region2}"/></div>
					                 		<div style="height:50px; font-weight: bold;"><c:out value="${weu.p_name}"/></div><br>
					                 		<div><c:out value="${weu.p_period}"/></div><br>
											<c:choose>
				                             	 <c:when test="${weu.p_star gt 4.5}">
				                                          <span class="gold" style="color:#28c3a5;">★★★★★<c:out value="${weu.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${weu.p_star gt 3.5}">
				                                          <span class="gold" style="color:#28c3a5">★★★★<c:out value="${weu.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${weu.p_star gt 2.5}">
				                                          <span class="gold" style="color:#28c3a5">★★★<c:out value="${weu.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${weu.p_star gt 1.5}">
				                                          <span class="gold" style="color:#28c3a5">★★<c:out value="${weu.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${weu.p_star gt 0.5}">
				                                          <span class="gold" style="color:#28c3a5">★<c:out value="${weu.rcount}"/></span>
				                                 </c:when>
												<c:otherwise>
															<span class="gold" style="color:#28c3a5">후기 이벤트 진행중</span>
												</c:otherwise>
				                              </c:choose>
				                              <br>
					                 		<fmt:formatNumber value="${weu.p_fee }" pattern="#,###" />원 /1인
						                </a>
					                   </div>
				                 </div>
			             </c:forEach>
			          </c:when>
	 		          <c:otherwise>
							<h5>게시물이 없습니다.</h5>
	 		          </c:otherwise>
	             </c:choose>
				</div>
			</div>
			<br><br><br>
			<div style="height:450px">
				<h1>👩‍❤️‍👨 우리가 찾던 허니문</h1>
				<div class="pakageSection">
		        	<c:choose>
	        		<c:when test="${not empty listSai }">
			             <c:forEach var="sai" items="${listSai }">
					             <div class="pakageList">
					             		<div style="position: relative;">
					             			<a href="/pakage/P_get?p_num=${sai.p_num }">
					                   			<img alt="이미지" src="/img/${sai.p_mainimg }" width="280px" height="180px"/>
				                   			</a>
				                   			<div class="change">
					                   			<c:choose>
					                   				<c:when test="${empty loginPublicInfo.m_idx || empty heart}">
														<div style="position: absolute; top: 5px; right: 10px" class="heart1">
			                   								<img alt="이미지" src="/img/h2.svg" data-num="${sai.p_num}" class="wish" style="cursor: pointer;"/>
			                   							</div>
					                   				</c:when>
					                   				<c:otherwise>
					                   				<c:set var="loop_flag" value="false"/>
							                   			<c:forEach var="heart" items="${heart}">
															<c:if test="${sai.p_num eq heart.p_num}">
								                   				<c:if test="${not loop_flag }">
																		<div style="position: absolute; top: 5px; right: 10px" class="heart2">
							                   								<img alt="이미지" src="/img/h1.svg" data-num="${sai.p_num}" class="wish" style="cursor: pointer;"/>
							                   							</div>
							                   								<c:set var="loop_flag" value="true"/>
							                   					</c:if>
															</c:if>
															<c:if test="${sai.p_num ne heart.p_num}">
																<c:if test="${not loop_flag }">
																	<div style="position: absolute; top: 5px; right: 10px" class="heart3">
						                   								<img alt="이미지" src="/img/h2.svg" data-num="${sai.p_num}" class="wish" style="cursor: pointer;"/>
						                   							</div>
						                   						</c:if>
															</c:if>
									           			</c:forEach>
					                   				</c:otherwise>
					                   			</c:choose>
				                   			</div>
					                    </div>
					                   	<div style="padding: 10px;">
				             			<a href="/pakage/P_get?p_num=${sai.p_num }">
					                 		<div style="color: gray"><c:out value="${sai.p_region2}"/></div>
					                 		<div style="height:50px; font-weight: bold;"><c:out value="${sai.p_name}"/></div><br>
					                 		<div><c:out value="${sai.p_period}"/></div><br>
											<c:choose>
				                             	 <c:when test="${sai.p_star gt 4.5}">
				                                          <span class="gold" style="color:#28c3a5;">★★★★★<c:out value="${sai.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${sai.p_star gt 3.5}">
				                                          <span class="gold" style="color:#28c3a5">★★★★<c:out value="${sai.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${sai.p_star gt 2.5}">
				                                          <span class="gold" style="color:#28c3a5">★★★<c:out value="${sai.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${sai.p_star gt 1.5}">
				                                          <span class="gold" style="color:#28c3a5">★★<c:out value="${sai.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${sai.p_star gt 0.5}">
				                                          <span class="gold" style="color:#28c3a5">★<c:out value="${sai.rcount}"/></span>
				                                 </c:when>
												<c:otherwise>
															<span class="gold" style="color:#28c3a5">후기 이벤트 진행중</span>
												</c:otherwise>
				                              </c:choose>
				                              <br>
					                 		<fmt:formatNumber value="${sai.p_fee }" pattern="#,###" />원 /1인
						                </a>
					                   </div>
				                 </div>
			             </c:forEach>
			          </c:when>
	 		          <c:otherwise>
							<h5>게시물이 없습니다.</h5>
	 		          </c:otherwise>
	             </c:choose>
				</div>
			</div><br><br><br>
			<div style="height:450px">
				<h1>🏞️ 국내로 떠나는 섬캉스</h1>
				<div class="pakageSection">
		        	<c:choose>
	        		<c:when test="${not empty listKos }">
			             <c:forEach var="kos" items="${listKos }">
					             <div class="pakageList">
					             		<div style="position: relative;">
					             			<a href="/pakage/P_get?p_num=${kos.p_num }">
					                   			<img alt="이미지" src="/img/${kos.p_mainimg }" width="280px" height="180px"/>
				                   			</a>
				                   			<div class="change">
					                   			<c:choose>
					                   				<c:when test="${empty loginPublicInfo.m_idx || empty heart}">
														<div style="position: absolute; top: 5px; right: 10px" class="heart1">
			                   								<img alt="이미지" src="/img/h2.svg" data-num="${kos.p_num}" class="wish" style="cursor: pointer;"/>
			                   							</div>
					                   				</c:when>
					                   				<c:otherwise>
					                   				<c:set var="loop_flag" value="false"/>
							                   			<c:forEach var="heart" items="${heart}">
															<c:if test="${kos.p_num eq heart.p_num}">
								                   				<c:if test="${not loop_flag }">
																		<div style="position: absolute; top: 5px; right: 10px" class="heart2">
							                   								<img alt="이미지" src="/img/h1.svg" data-num="${kos.p_num}" class="wish" style="cursor: pointer;"/>
							                   							</div>
							                   								<c:set var="loop_flag" value="true"/>
							                   					</c:if>
															</c:if>
															<c:if test="${kos.p_num ne heart.p_num}">
																<c:if test="${not loop_flag }">
																	<div style="position: absolute; top: 5px; right: 10px" class="heart3">
						                   								<img alt="이미지" src="/img/h2.svg" data-num="${kos.p_num}" class="wish" style="cursor: pointer;"/>
						                   							</div>
						                   						</c:if>
															</c:if>
									           			</c:forEach>
					                   				</c:otherwise>
					                   			</c:choose>
				                   			</div>
					                    </div>
					                   	<div style="padding: 10px;">
				             			<a href="/pakage/P_get?p_num=${kos.p_num }">
					                 		<div style="color: gray"><c:out value="${kos.p_region2}"/></div>
					                 		<div style="height:50px; font-weight: bold;"><c:out value="${kos.p_name}"/></div><br>
					                 		<div><c:out value="${kos.p_period}"/></div><br>
											<c:choose>
				                             	 <c:when test="${kos.p_star gt 4.5}">
				                                          <span class="gold" style="color:#28c3a5;">★★★★★<c:out value="${kos.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${kos.p_star gt 3.5}">
				                                          <span class="gold" style="color:#28c3a5">★★★★<c:out value="${kos.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${kos.p_star gt 2.5}">
				                                          <span class="gold" style="color:#28c3a5">★★★<c:out value="${kos.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${kos.p_star gt 1.5}">
				                                          <span class="gold" style="color:#28c3a5">★★<c:out value="${kos.rcount}"/></span>
				                                 </c:when>
				                                 <c:when test="${kos.p_star gt 0.5}">
				                                          <span class="gold" style="color:#28c3a5">★<c:out value="${kos.rcount}"/></span>
				                                 </c:when>
												<c:otherwise>
															<span class="gold" style="color:#28c3a5">후기 이벤트 진행중</span>
												</c:otherwise>
				                              </c:choose>
				                              <br>
					                 		<fmt:formatNumber value="${kos.p_fee }" pattern="#,###" />원 /1인
						                </a>
					                   </div>
				                 </div>
			             </c:forEach>
			          </c:when>
	 		          <c:otherwise>
							<h5>게시물이 없습니다.</h5>
	 		          </c:otherwise>
	             </c:choose>
				</div>
			</div>
           	<form id="actionForm">
        	</form>
		</section>
		
<script type="text/javascript">

$(function(){
	
   	var m_idx = $("input[name=m_idx]").val();
   	var heart1 = $(".heart1") 	// 로그인이 되어있지 않을 경우
   	var heart2 = $(".heart2") 	// 로그인이 되어있고 위시리스트 담은 경우
   	var heart3 = $(".heart3")	// 로그인이 되어있고 위시리스트에 담지 않은 경우
   	var change = $(".change")
   	
    $(heart1).on("click", "img",function(e){
    	
    	var actionForm = $("#actionForm");
    	var p_num = $(this).data("num");
       	
    	if(m_idx == ''){	// 로그인 하지 않았을 경우
    		alert("로그인 후 이용가능합니다.");
    		actionForm.attr("action", "/Member/login");
            actionForm.append("<input type='hidden' name='p_num' value='"+$(this).attr("href")+"'>");
            actionForm.submit();
    	}else{		// 로그인이 되어있을 경우 위시리스트 추가
    		
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