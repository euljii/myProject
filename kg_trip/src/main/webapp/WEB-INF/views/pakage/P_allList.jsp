<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<style type="text/css">
	.searchSection{
		width: 1200px;
		height : 200px;
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
		margin-bottom: 30px;
	}
	.pakageList:hover{
		box-shadow: 1px 1px 20px #ddd;
	}
	.ull .lii{
		float: left;
		font-size: 20px;
		font-weight: bold;
		color: white;
	}
	.ull .lii a{
		float: left;
		font-size: 20px;
		font-weight: bold;
		color: white;
		text-align: center;
		width: 180px;
		cursor: pointer;
	}
	
	.ull .lii {
		text-align: center;
		width: 180px;
		cursor: pointer;
	}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

		<section class="cont">
			
			<div class="searchSection" style="height: 100px; background-color: #41d4b8; border-radius: 5px;
			padding: 10px;">
				<h2 style="color: white";>๐๏ธ ์ด๋๋ก ๋ ๋์ธ์?</h2>
				<ul class="ull" style="margin-top: 20px">
					<li class="lii"><a href='/pakage/P_allList'>์ ์ฒด๋ณด๊ธฐ</a></li>
					<li class="lii" id="slinka">์ ๋ฝ</li>
					<li class="lii" id="slinkb">๋๋จ์/์ผ๋ณธ</li>
					<li class="lii" id="slinkc">ํ์์ด/๋ชฐ๋๋ธ</li>
					<li class="lii" id="slinkd">๊ด/์ฌ์ดํ</li>
					<li class="lii" id="slinke">๊ตญ๋ด์ฌํ</li>
				</ul>
			</div><br><br>
			<div style="padding: 10px">
				<form>
					<h2>๐ ๊ตญ๊ฐ, ์ง์ญ๋ช, ๋์๋ฅผ ๊ฒ์ํ์ธ์!</h2><br>
					<input type="text" name="region" style="height:30px; width:200px">
					<button data-oper="P_search" id="buttonA">๊ฒ์</button>
				</form>
			</div><br>
			<div style="padding: 10px">
				<a id="linka" style="cursor: pointer;">๐งท๊ฐ๊ฒฉ๋ฎ์์</a>&nbsp;&nbsp;&nbsp;&nbsp;  <a id="linkb" style="cursor: pointer;">๐งท๊ฐ๊ฒฉ๋์์</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a id="linkc" style="cursor: pointer;">๐งท๋ ์ง๋น ๋ฅธ์</a>&nbsp;&nbsp;&nbsp;&nbsp;  <a id="linkd" style="cursor: pointer;">๐งท๋ ์ง๋๋ฆฐ์</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a id="linke" style="cursor: pointer;">๐งทํ๊ธฐ๋ง์์</a>&nbsp;&nbsp;&nbsp;&nbsp;  <a id="linkf" style="cursor: pointer;">๐งท๋ณ์ ๋์์</a>
			</div><br><br>

			<!------------------------->
			<form class="searchResult">
			<input type="hidden" name="m_idx" value="${loginPublicInfo.m_idx}" >
				<h1>์ ์ฒด ์ฌํ</h1>
				<div class="pakageSection">
		        	<c:choose>
	        		<c:when test="${not empty list }">
			             <c:forEach var="list" items="${list }">
								<div class="pakageList">
				             		<div style="position: relative;">
				             			<a href="/pakage/P_get?p_num=${list.p_num }">
				                   			<img alt="์ด๋ฏธ์ง" src="/img/${list.p_mainimg }" width="280px" height="180px"/>
			                   			</a>
			                   			<div class="change">
				                   			<c:choose>
				                   				<c:when test="${empty loginPublicInfo.m_idx || empty heart}">
													<div style="position: absolute; top: 5px; right: 10px;" class="heart1">
		                   								<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="${list.p_num}" class="wish" style="cursor: pointer;"/>
		                   							</div>
				                   				</c:when>
				                   				<c:otherwise>
				                   				<c:set var="loop_flag" value="false"/>
						                   			<c:forEach var="heart" items="${heart}">
														<c:if test="${list.p_num eq heart.p_num}">
							                   				<c:if test="${not loop_flag }">
																	<div style="position: absolute; top: 5px; right: 10px;" class="heart2">
						                   								<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="${list.p_num}" class="wish" style="cursor: pointer;"/>
						                   							</div>
						                   								<c:set var="loop_flag" value="true"/>
						                   					</c:if>
														</c:if>
														<c:if test="${list.p_num ne heart.p_num}">
															<c:if test="${not loop_flag }">
																<div style="position: absolute; top: 5px; right: 10px;" class="heart3">
					                   								<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="${list.p_num}" class="wish" style="cursor: pointer;"/>
					                   							</div>
					                   						</c:if>
														</c:if>
								           			</c:forEach>
				                   				</c:otherwise>
				                   			</c:choose>
			                   			</div>
				                    </div>
				                   <div style="padding: 10px;">
			             			<a href="/pakage/P_get?p_num=${list.p_num }">
				                 		<div style="color: gray"><c:out value="${list.p_region2}"/></div>
				                 		<div style="height:50px; font-weight: bold;"><c:out value="${list.p_name}"/></div><br>
				                 		<div><c:out value="${list.p_period}"/></div><br>
										<c:choose>
				                              <c:when test="${list.p_star gt 4.5}">
				                                          <span class="gold" style="color:#28c3a5">โโโโโ<c:out value="${list.rcount}"></c:out></span>
				                                 </c:when>
				                                 <c:when test="${list.p_star gt 3.5}">
				                                          <span class="gold" style="color:#28c3a5">โโโโ<c:out value="${list.rcount}"></c:out></span>
				                                 </c:when>
				                                 <c:when test="${list.p_star gt 2.5}">
				                                          <span class="gold" style="color:#28c3a5">โโโ<c:out value="${list.rcount}"></c:out></span>
				                                 </c:when>
				                                 <c:when test="${list.p_star gt 1.5}">
				                                          <span class="gold" style="color:#28c3a5">โโ<c:out value="${list.rcount}"></c:out></span>
				                                 </c:when>
				                                 <c:when test="${list.p_star gt 0.5}">
				                                          <span class="gold" style="color:#28c3a5">โ<c:out value="${list.rcount}"></c:out></span>
				                                 </c:when>
												<c:otherwise>
														<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>
												</c:otherwise>
			                            </c:choose>
			                            <br>
				                 		<fmt:formatNumber value="${list.p_fee }" pattern="#,###" />์ /1์ธ
					                 </a>
				                   	</div>
			                 </div>
			             </c:forEach>
			          </c:when>
	 		          <c:otherwise>
							<h5>๊ฒ์๋ฌผ์ด ์์ต๋๋ค.</h5>
	 		          </c:otherwise>
	             </c:choose>
				</div>
			</form>
			<form id="actionForm">
        	</form>
		</section>
		
<script type="text/javascript">
$(function(){
	
	var m_idx = $("input[name=m_idx]").val();

	var searchResult = $(".searchResult");
    
    $("button[data-oper='P_search']").click(function(e){	// ๊ฒ์ ๋ฒํผ ๋๋ ์ ๋
    	e.preventDefault();
    	var region = $('input[name=region]').val();
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_jebal?region='+region,
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    						str += '<h1>'+ region + 'ํจํค์ง ๊ฒ์ ๊ฒฐ๊ณผ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#linka").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_linka',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    						str += '<h1>๊ฐ๊ฒฉ ๋ฎ์์ ๊ฒ์ ๊ฒฐ๊ณผ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
    						str += '<div class="pakageList">'
    						str += '<div style="position: relative;">'
    						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
    						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
    						str += '</a>'
    						str += '<div class="change">'					
    						
    						if(m_idx == '' || heart.length == 0 ){
    							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
    							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    							str += '</div>'
    						}else{
    							for(var j=0; j<heart.length; j++){
	    							if(slist[i].p_num == heart[j].p_num){
	    								
	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
	    								str += '</div>'	
	    								break;
	    							}else if(slist[i].p_num != heart[j].p_num){
	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
	    								str += '</div>'
	    								
	    							}
    							}
    						}
    						str += '</div>'
    						str += '</div>'
    						str += '<div style="padding: 10px;">'
    						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
    						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
    						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
    						str += '<div>'+ slist[i].p_period + '</div><br>';
    		           			if(slist[i].p_star > 4.5){
    		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
    		           			}else if(slist[i].p_star > 3.5){
    		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
    		           			}else if(slist[i].p_star > 2.5){
    		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
    		           			}else if(slist[i].p_star > 1.5){
    		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
    		           			}else if(slist[i].p_star > 0.5){
    		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
    		           			}else if(slist[i].p_star == ""){
    		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
    		           			}
   		           			str += '<br>'
    		           			function AmountCommas(val){
    		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
    		           			}
    	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
    						str += '</div>'
    						str += '</a>'
    						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#linkb").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_linkb',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    						str += '<h1>๊ฐ๊ฒฉ ๋์์ ๊ฒ์ ๊ฒฐ๊ณผ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#linkc").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_linkc',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    					str += '<h1>๋ ์ง ๋น ๋ฅธ์ ๊ฒ์ ๊ฒฐ๊ณผ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#linkd").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_linkd',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    						str += '<h1>๋ ์ง ๋๋ฆฐ์ ๊ฒ์ ๊ฒฐ๊ณผ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#linke").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_linke',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    						str += '<h1>ํ๊ธฐ ๋ง์์ ๊ฒ์ ๊ฒฐ๊ณผ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#linkf").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_linkf',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    					str += '<h1>๋ณ์  ๋์์ ๊ฒ์ ๊ฒฐ๊ณผ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    // ํด๋ฆญ ํ์ ๋
    $("#slinka").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_slinka',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    						str += '<h1>์ ๋ฝ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#slinkb").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_slinkb',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    					str += '<h1>๋๋จ์/์ผ๋ณธ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#slinkc").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_slinkc',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    						str += '<h1>ํ์์ด</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#slinkd").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_slinkd',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    						str += '<h1>๊ด/์ฌ์ดํ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
    $("#slinke").click(function(e){
    	
    	$.ajax({
    		type : 'post',
    		url : '${pageContext.request.contextPath}/pakage/P_slinke',
    		contentType : 'application/json; charset=utf-8',
    		success : function(slist) {
    			
    			if(m_idx ==''){
    				m_idx = 99999;
    			}
    			
    			$.ajax({
    				type : 'post',
    	    		url : '${pageContext.request.contextPath}/pakage/P_wish?m_idx='+m_idx,
    	    		contentType : 'application/json; charset=utf-8',
    	    		success : function(heart) {
						var str = '';
    					
    					if(slist == null || slist.length == 0){
    						searchResult.html("๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค.");
    						return;
    					}
    						str += '<h1>๊ตญ๋ด์ฌํ</h1>';
    					for(var i=0; i<slist.length; i++){
    						str += '<div class="pakageSection">'
        						str += '<div class="pakageList">'
        						str += '<div style="position: relative;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<img alt="์ด๋ฏธ์ง" src="/img/'+ slist[i].p_mainimg +'" width="280px" height="180px"/>'
        						str += '</a>'
        						str += '<div class="change">'					
        						
        						if(m_idx == '' || heart.length == 0 ){
        							str += '<div style="position: absolute; top: 5px; right: 10px" class="heart1">'
        							str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
        							str += '</div>'
        						}else{
        							for(var j=0; j<heart.length; j++){
    	    							if(slist[i].p_num == heart[j].p_num){
    	    								
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart2">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h1.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'	
    	    								break;
    	    							}else if(slist[i].p_num != heart[j].p_num){
    	    								str += '<div style="position: absolute; top: 5px; right: 10px" class="heart3">'
    	    								str += '<img alt="์ด๋ฏธ์ง" src="/img/h2.svg" data-num="'+ slist[i].p_num +'" class="wish"/>'
    	    								str += '</div>'
    	    								
    	    							}
        							}
        						}
        						str += '</div>'
        						str += '</div>'
        						str += '<div style="padding: 10px;">'
        						str += '<a href="/pakage/P_get?p_num='+ slist[i].p_num +'">';
        						str += '<div style="color: gray">'+ slist[i].p_region2 + '</div>';
        						str += '<div style="height:50px; font-weight: bold;">'+ slist[i].p_name + '</div><br>';
        						str += '<div>'+ slist[i].p_period + '</div><br>';
        		           			if(slist[i].p_star > 4.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 3.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 2.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 1.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โโ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star > 0.5){
        		           				str += '<span class="gold" style="color:#28c3a5">โ'+ slist[i].rcount +'</span>';
        		           			}else if(slist[i].p_star == ""){
        		           				str += '<span class="gold" style="color:#28c3a5">ํ๊ธฐ ์ด๋ฒคํธ ์งํ์ค</span>';
        		           			}
       		           			str += '<br>'
        		           			function AmountCommas(val){
        		           			    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
        		           			}
        	           			str += AmountCommas(slist[i].p_fee)+'์ /1์ธ'
        						str += '</div>'
        						str += '</a>'
        						str += '</div>'
    	    			}
  						console.log(slist);
  						console.log(heart);
  						searchResult.html(str);
  						
  						var heart1 = $(".heart1") 
  					   	var heart2 = $(".heart2")
  					   	var heart3 = $(".heart3")
  					   	var change = $(".change")
  					   	
  					    $(heart1).on("click", "img",function(e){
  					    	
  					    	var actionForm = $("#actionForm");
  					    	var p_num = $(this).data("num");
  					       	
  					    	if(m_idx == ''){
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
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
  					    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
  					        			location.href = "/pakage/P_allList";
  					        			document.location.reload();
  					        			history.go(0);		
  					        		}
  					        	}); 
  					    	}
  					    });
  						
    	    		}
    			})
    			
			}
    	})
    })
    
	var heart1 = $(".heart1") 
   	var heart2 = $(".heart2")
   	var heart3 = $(".heart3")
   	var change = $(".change")
   	
    $(heart1).on("click", "img",function(e){
    	
    	var actionForm = $("#actionForm");
    	var p_num = $(this).data("num");
       	
    	if(m_idx == ''){
    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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
    		alert("๋ก๊ทธ์ธ ํ ์ด์ฉ๊ฐ๋ฅํฉ๋๋ค.");
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