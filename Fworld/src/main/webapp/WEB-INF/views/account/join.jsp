<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form action="/account/letsJoin" method="post" >
		<table>
			<thead>
				<tr>
					<td colspan="2">로그인하기</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input class="joinInput" type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input class="joinInput" type="password" name="pw"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input class="joinInput" type="text" name="nickname"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input class="joinInput" type="text" name="name"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input class="joinInput" type="date" name="birth"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="남">남
						<input type="radio" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input class="joinInput" type="email" name="email"></td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td><input class="joinInput" type="number" name="pnum"></td>
				</tr>
				
				<tr>
					<td>소개글</td>
					<td><textarea class="joinInput" name="intro" placeholder="소개글을 입력하세요.">
					</textarea></td>
				</tr>
				
				<tr>
					<td>MBTI</td>
					<td>
						<select name="mbti">
							<option value="">MBTI</option>
							<option value="ESTJ">ESTJ</option>
							<option value="ENTJ">ENTJ</option>
							<option value="ESFJ">ESFJ</option>
							<option value="ESFP">ESFP</option>
							<option value="ESTP">ESTP</option>
							<option value="ENTP">ENTP</option>
							<option value="ENFP">ENFP</option>
							<option value="ISTJ">ISTJ</option>
							<option value="INTJ">INTJ</option>
							<option value="ISFJ">ISFJ</option>
							<option value="ISFP">ISFP</option>
							<option value="ISTP">ISTP</option>
							<option value="INTP">INTP</option>
							<option value="INFP">INFP</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>프로필사진</td>
					<td><input class="joinInput" readonly="readonly" type="text" name="img" value="프로필사진"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<button id="joinBtn">회원가입</button>
						<button type="reset">다시쓰기</button>
						
						<!-- <input type="submit" -->
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous">
</script>
<script type="text/javascript">

$(function() {

	$("#joinBtn").click(function() {
		/* event.preventDefault(); */
		
		var id = $("input[name='id']").val();
		var pw = $("input[name='pw']").val();
		var nickname = $("input[name='nickname']").val();
		var name = $("input[name='name']").val();
		var birth = $("input[name='birth']").val();
		var gender = $("input[name='gender']").val();
		var email = $("input[name='email']").val();
		var pnum = $("input[name='pnum']").val();
		
		if(id == '' || pw == '' || nickname == '' || name == '' || birth == '' || 
				gender == '' || email == '' || pnum == '' ){
			alert("필수 항목을 기입해주세요.");
			return false;
		}
			
	});
});

</script>
</html>