<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인페이지</h1>
	<form id="frm_board" action="loginSuccess" method="post">
		<table id="tbl_userInfo">
			<tr>
				<td>id</td>
				<td><input type="text" name="USER_ID" placeholder="ID"></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="USER_PW" placeholder="Password"></td>
			</tr>
		</table>
	</form>
	<button id="btn_login">login</button>
</body>
<style>
	td{
	border-style: 1px solid black}
</style>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	$(function() {

		$("#btn_login").on("click", function(){
			var id = $("input[name='USER_ID']").val();
			var pw = $("input[name='USER_PW']").val();
			var form = $("#frm_board");
			
			$.ajax({
		            url : "/W1_board10_kej/idCheck",
		            type : 'POST',
		            data : {id : id},				// data : 보내는 데이터
		            success : function(result) {	// data, result : 받을 데이터 (매개변수임.. 이름일 뿐.)
		            	if(result == 1){
		            		$.ajax({
		    		            url : "/W1_board10_kej/pwCheck",
		    		            type : 'POST',
		    		            data : {id : id, pw : pw},				// data : 보내는 데이터
		    		            success : function(result) {	// data, result : 받을 데이터 (매개변수임.. 이름일 뿐.)
		    		            	if(result == 1){
		    		            		form.submit();
		    		            	}else{
		    		            		alert("비밀번호를 확인하세요.");
		    		            	}
		    		            },
		    		            error : function() {
		    		                alert("error : ");
		    		            }
		    		        });
		            	}else{
		            		alert("아이디가 존재하지 않습니다.");
		            	}
		            },
		            error : function() {
		                alert("error : ");
		            }
		        });
			
			 
			 
			
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/* var frm_board = $("#frm_board");
		
		$("#btn_login").click(function() {
			
			var USER_ID = $("input[name='USER_ID']").val();
			var USER_PW = $("input[name='USER_PW']").val();
			
			console.log("USER_ID" + USER_ID);
			console.log("USER_PW" + USER_PW);

			if(USER_ID==''){
				alert("아이디를 입력해주세요.");
				return;
			}else if(USER_PW==''){
				alert("패스워드를 입력해주세요.");
				return;
			}else{
				alert("넘길게요?");
				frm_board.submit();
			}
		}); */
	});
	
</script>
</html>