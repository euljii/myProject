<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
	<div class="container">
		<div class="fl">
			<a href="/W1_board10_kej/goLogin">login</a>
			<a href="/W1_board10_kej/goJoin">join</a>
		</div>
		<div id="totalChk" class="fr">
			total : ${total}<!-- 토탈 -->
		</div>
			
		<div class="cb">
			<table id="tbl_board">
				<tr class="center bold">
					<td>Type</td>
					<td>No</td>
					<td>Title</td>
				</tr>
				<c:forEach items="${list}" var="list">
					<tr>
						<td class="center">${list.BOARD_TYPE}</td>
						<td class="center">${list.BOARD_NUM}</td>
						<td><a href="read?boardNum=${list.BOARD_NUM}">${list.BOARD_TITLE}</a></td>
					</tr>
				</c:forEach>
			</table>
			<div>
				<a href="/goBoardWrite">글쓰기</a>
			</div>
			<div>	<!-- // 체크박스 -->
				<input type="checkbox" name="CODE_NAME" value="전체">전체
				<input type="checkbox" name="CODE_NAME" value="일반">일반
				<input type="checkbox" name="CODE_NAME" value="Q&A">Q&A
				<input type="checkbox" name="CODE_NAME" value="익명">익명
				<input type="checkbox" name="CODE_NAME" value="자유">자유
				
				<button id="btn_typeCheck">조회</button>
			</div>
			
			<div>	 <!-- 페이징 div -->
			
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#totalChk").click(function(){
		$.ajax({
			url: "totalChecker",
			type: "post",
			dataType: "json",
			data: {
				"param" : 1
			},
			success : function (data) {
				alert("성공");
			},
			error: function (err) {
				console.log(err);
				alert('실패');
			}
		})
	})
</script>
<style>
 table{
 	border-style: 1px solid black;
 }
</style>
</html>