<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="/W1_board/list">List</a>
	<form id="frm_board" action="join" method="post">
		<table id="tbl_userInfo">
			<tr>
				<td>id</td>
				<td><input type="text" name="USER_ID">
					<button>중복확인</button></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="USER_PW"></td>
			</tr>
			<tr>
				<td>pw check</td>
				<td><input type="password" id="pwCheck"></td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="USER_NAME"></td>
			</tr>
			<tr>
				<td>phone</td>
				<td>
				
				<select name="USER_PHONE1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
					
					<%-- <c:forEach items="${phoneList}" var="phoneList">
						<option value="${phoneList.code_name}">${phoneList.code_name}</option>
					</c:forEach> --%>
					
				</select>- 
				<input type="text" name="USER_PHONE2">- 
				<input type="text" name="USER_PHONE3"></td>
			</tr>
			<tr>
				<td>postNo</td>
				<td><input type="text" name="USER_ADDR1"></td>
			</tr>
			<tr>
				<td>address</td>
				<td><input type="text" name="USER_ADDR2"></td>
			</tr>
			<tr>
				<td>company</td>
				<td><input type="text" name="USER_COMPANY"></td>
			</tr>
		</table>
	</form>
	<button id="btn_join">join</button>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous">
</script>
<script type="text/javascript">

	$(function() {

		var frm_board = $("#frm_board");
		
		$("#btn_join").click(function() {
			
			var USER_ID = $("input[name='USER_ID']").val();
			var USER_PW = $("input[name='USER_PW']").val();
			var pwCheck = $("#pwCheck").val();
			var USER_NAME = $("input[name='USER_NAME']").val();
			var USER_PHONE1 = $("input[name='USER_PHONE1']").val();
			var USER_PHONE2 = $("input[name='USER_PHONE2']").val();
			var USER_PHONE3 = $("input[name='USER_PHONE3']").val();

			if(USER_ID==''|| USER_PW==''||pwCheck==''||USER_NAME==''||
					USER_PHONE1==''||USER_PHONE2==''||USER_PHONE3==''){
				alert("필수 항목을 입력해주세요.");
				return;
			}else{
				frm_board.submit();
			}
		});
	});
	
</script>
</html>
