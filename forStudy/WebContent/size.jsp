<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3 id="hi">안녕하세요.</h3>
	<div class="alert-box" id="alert">
		<p>Alert 박스</p>
	</div>
	<button type="button" onclick="alert('아이디 입력하세요')">아이디</button>
	<button type="button" onclick="alert('비번 입력하세요')">비번</button>
</body>
<script type="text/javascript">
	
	document.getElementById('hi').innerHTML='안녕하소^^';
	document.getElementById('hi').style.color='pink';
	document.getElementById('hi').style.fontSize='30px';
	
	function visibilty(파람) {
		document.getElementById('hi').style.visibility=파람;
	}
	
</script>
</html>