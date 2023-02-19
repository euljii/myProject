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

<div class="menu_section">
	<ul class="menu">
		<li><a href="/Traveler/myPage">계정관리</a></li>
		<li><a class="move" href='/pakage/P_wishlist'>위시리스트</a></li>
		<li>예약관리
			<ul class="submenu">
				<li><a class="move" href='/pakage/P_mlist'>&nbsp;&nbsp;패키지 예약내역</a></li>
				<li><a class="move" href='/flight/myBookList'>&nbsp;&nbsp;항공권 예약내역</a></li>
			</ul>
		</li>
		<li>커뮤니티
			<ul class="submenu">
				<li><a class="move" href='#'>&nbsp;&nbsp;내 게시글</a></li>
				<li><a class="move" href='#'>&nbsp;&nbsp;내 댓글 </a></li>
			</ul>
		</li>
		<li><a class="move" href='/mypage/oboList'>1:1문의</a></li>
	</ul>
</div>
