<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>Type</td>
			<td>
				<select name="BOARD_TYPE">
					<option value="일반">일반
					<option value="Q&A">Q&A
					<option value="익명">익명
					<option value="자유">자유
				</select>
			</td>
		</tr>
		<tr>
			<td>Title</td>
			<td><input type="text" name="BOARD_TITLE"></td>
		</tr>
	
		<tr>
			<td>Comment</td>
			<td>
				<textarea name="BOARD_COMMENT"></textarea>
			</td>
		</tr>
		<tr>
			<td>Writer</td>
			<td><input type="text" name="CREATOR"></td>
		</tr>
	</table>
	
	<a href="/W1_board/list">List</a>
	<a href="/W1_board/update">Update</a>
	
</body>
</html>