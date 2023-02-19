<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>
<style>
	*{padding:0;margin:0}
	li{list-style:none}

	.menu_section{
		border: 1px solid #dddddd; 
		width: 25%; 
		margin-right: 40px; 
		border-radius : 5px; 
		height: 100%;
	}
	
	.menu{
		margin: 0;
		padding: 0px 20px 15px;
		width: 300px;
		overflow: hidden;
		list-style-type: none;
	}
	.menu > li{
		width: 80%;
		font-size: 16px;
		border: 1px solid #dddddd;
		border-radius : 5px;
		margin: 15px 0px 0px 0px;
		padding: 15px 10px 15px;
		line-height: 30px;
	}
	.submenu{
		height: 0;
		overflow: hidden;
	}
	.submenu > li{
		padding: 5px 0px 0px 0px;
		font-size: 15px;
		border-top: 1px solid #dddddd;
	}
	
	.menu > li:hover .submenu {
		height: 100%;
		transition-duration: 1s;
		color: white;
		
	}
	.menu > li:hover {
		transition-duration: 0.5s;
		color: #28c3a5;
	}
	.menu > li:hover > a {
		transition-duration: 0.5s;
		color: #28c3a5;
	}
	
</style>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

		<div class="menu_section" >
			<ul class="menu" >
				<li><a href="/Partner/corpPage">계정관리</a></li>
				<c:if test="${loginCorpInfo.c_type == 100 }">
					<li>상품 관리
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/flight/scheduleInsertPage">일정등록</a></li>
							<li><a href="${pageContext.request.contextPath}/flight/scheduleManagerPage">일정관리</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${loginCorpInfo.c_type == 200 }">
					<li>상품 관리
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/pakage/P_cinsert">상품 등록</a></li>
							<li><a href="${pageContext.request.contextPath}/pakage/P_clist">상품 목록</a></li>
						</ul>
					</li>
				</c:if>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">문의사항</a></li>
			</ul>
		</div>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
