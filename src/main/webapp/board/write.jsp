<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 스크립트가 있어야 자바스크립트와 연결 -->
<script type="text/javascript" src="board.js"></script>
</head>
<body>
	<center>
		<h1>글 올 리 기</h1>
		<form name="reg_frm" method="post" action="writeOk.jsp">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140">
<!-- 						maxlength:화면단에서 데이터베이스 오류를 미리 방지 -->
						<input type="text" name="b_name" size="10" maxlength="20">
					</td>
					<td width="80">이메일</td>
					<td width="240">
						<input type="text" name="b_email" size="24" maxlength="50">
					</td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3" width="460">
<!-- 						maxlength:화면단에서 데이터베이스 오류를 미리 방지 -->
						<input type="text" name="b_title" size="55" maxlength="80">
					</td>
				</tr>
				<tr height="30">
					<td colspan="4">
						<textarea rows="10" cols="65" name="b_content"></textarea>
					</td>
				</tr>
				<tr height="30">
					<td width="80">암&nbsp;&nbsp;호</td>
					<td colspan="3" width="460">
						<input type="text" name="b_pwd" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="button" value="글쓰기" onclick="check_ok()">&nbsp; <!-- 자바스크립트 갔다옴 -->
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='list.jsp'"> <!-- 자바스크립트 갔다옴 -->
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
