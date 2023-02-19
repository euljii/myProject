<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<body>

	<h1>로그인페이지</h1>
	<form action="/account/join" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input class="loginInput" type="text" name="id"></td>
				
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input class="loginInput" type="password" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button>로그인</button>
					<button>회원가입</button>
				</td>
			</tr>
		
		</table>
	
	</form>
</body>
</html>

<script type="text/javascript">


</script>