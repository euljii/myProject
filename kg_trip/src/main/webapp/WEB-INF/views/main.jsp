<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />

    <!-- Main swiper1 -->
    <style>

      .swiper {
        width: 1200px;
        height: 300px;
      }

      .swiper-slide {
        text-align: center;
        font-size: 14px;
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
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      
      <!-- Main swiper2 -->
      
      .swiper {
        width: 1200px;
        height: 400px;
      }

      .swiper-slide {
        text-align: center;
        font-size: 15px;
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

      .swiper-slide #img2 {
        display: block;
        width: 285px;
        height: 300px;
        object-fit: cover;
      }
      .swiper-slide #img {
        display: block;
        width: 300px;
        height: 150px;
        object-fit: cover;
        size: 80%;
      }
    </style>
    
    
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

	<section class="cont">
	
		<div class="event">
		</div>
		
		<div>
		<!-- Main Swiper1 -->
	    <div class="swiper mySwiper">
	      <div class="swiper-wrapper">
	        <div class="swiper-slide"><img alt="이미지" src="/img/main1.png"></div>
	        <div class="swiper-slide"><img alt="이미지" src="/img/main2.png"></div>
	        <div class="swiper-slide"><a href="/pakage/P_get?p_num=bor001"><img alt="이미지" src="/img/main3.png"></a></div>
	        <div class="swiper-slide"><a href="/pakage/P_get?p_num=jej001"><img alt="이미지" src="/img/main4.png"></a></div>
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
		
		<br><br><br><br><br><br>
    	
    	<h1>⏰ 마감임박 패키지!</h1><br>
		<div>
			<!-- Swiper4 -->
		    <div class="swiper mySwiper4">
		      <div class="swiper-wrapper">
	        	<c:choose>
        		<c:when test="${not empty list }">
		             <c:forEach var="list" items="${list }">
			             	<a href="/pakage/P_get?p_num=${list.p_num }">
							<div class="swiper-slide" style="width:300px; flex-direction: column;">
			             		<div style="position: relative; width:300px;">
			                   		<img id="img" alt="이미지" src="/img/${list.p_mainimg }">
			                    </div>
			                   <div style="padding: 10px; width:300px; height:220px">
			                 		<div style="color: gray"><c:out value="${list.p_region2}"/></div>
			                 		<div style="font-weight: bold;"><a title="${list.p_name}"><c:out value="${list.p_name.substring(0,15)}"/>...</a></div>
			                 		<div><c:out value="${list.p_period}"/></div>
									<c:choose>
			                              <c:when test="${list.p_star gt 4.5}">
			                                          <span class="gold" style="color:#28c3a5">★★★★★<c:out value="${list.rcount}"></c:out></span>
			                                 </c:when>
			                                 <c:when test="${list.p_star gt 3.5}">
			                                          <span class="gold" style="color:#28c3a5">★★★★<c:out value="${list.rcount}"></c:out></span>
			                                 </c:when>
			                                 <c:when test="${list.p_star gt 2.5}">
			                                          <span class="gold" style="color:#28c3a5">★★★<c:out value="${list.rcount}"></c:out></span>
			                                 </c:when>
			                                 <c:when test="${list.p_star gt 1.5}">
			                                          <span class="gold" style="color:#28c3a5">★★<c:out value="${list.rcount}"></c:out></span>
			                                 </c:when>
			                                 <c:when test="${list.p_star gt 0.5}">
			                                          <span class="gold" style="color:#28c3a5">★<c:out value="${list.rcount}"></c:out></span>
			                                 </c:when>
											<c:otherwise>
													<span class="gold" style="color:#28c3a5">후기 이벤트 진행중</span>
											</c:otherwise>
		                            </c:choose>
		                            <br>
			                 		<fmt:formatNumber value="${list.p_fee }" pattern="#,###" />원 /1인
			                 	</div>
		                   	</div>
			                </a>
		             </c:forEach>
		          </c:when>
 		          <c:otherwise>
						<h5>게시물이 없습니다.</h5>
 		          </c:otherwise>
             </c:choose>
		     </div>
		      <div class="swiper-pagination"></div>
		    </div>
      		</div>
      		
      		<!-- Initialize Swiper -->
		    <script>
		      var swiper = new Swiper(".mySwiper4", {
		        slidesPerView: 4,
		        spaceBetween: 20,
		        slidesPerGroup: 4,
		        loop: true,
		        loopFillGroupWithBlank: true,
		        pagination: {
		          el: ".swiper-pagination",
		          clickable: true,
		        },
		        navigation: {
		        },
		      });
		    </script>
	    
	    <br><br><br><br><br><br>
	    
		<h1>👬 취향 저격 동행찾기</h1><br>
		<div>
			<!-- Swiper2 -->
		    <div class="swiper mySwiper2">
		      <div class="swiper-wrapper">
		        <div class="swiper-slide"><img id="img2" alt="이미지" src="/img/dong1.png"></div>
		        <div class="swiper-slide"><img id="img2" alt="이미지" src="/img/dong2.png"></div>
		        <div class="swiper-slide"><img id="img2" alt="이미지" src="/img/dong3.png"></div>
		        <div class="swiper-slide"><img id="img2" alt="이미지" src="/img/dong4.png"></div>
		        <div class="swiper-slide"><img id="img2" alt="이미지" src="/img/dong5.png"></div>
		        <div class="swiper-slide"><img id="img2" alt="이미지" src="/img/dong6.png"></div>
		      </div>
		      <div class="swiper-pagination"></div>
		    </div>
		    
		    <!-- Initialize Swiper -->
		    <script>
		      var swiper = new Swiper(".mySwiper2", {
		        slidesPerView: 3,
		        spaceBetween: 30,
		        slidesPerGroup: 3,
		        loop: true,
		        loopFillGroupWithBlank: true,
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

	</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />