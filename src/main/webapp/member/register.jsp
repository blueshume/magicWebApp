<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<table border="1" align="center">
<!-- 		자바스크립트의 유효성검사를 위해 name="reg_frm"을 붙여줌 -->
		<form name="reg_frm" method="post" action="registerOk.jsp">
			<tr height="50">
				<td colspan="2" align="center">
					<h1>회원가입 신청</h1>
					'*' 표시항목은 필수 입력 항목입니다.
				</td>
			</tr>
			<tr height="30">
				<td width="80">User ID</td>
				<td>
					<input type="text" name="mem_uid" size="20">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">암호</td>
				<td>
					<input type="password" name="mem_pw" size="20">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">암호 확인</td>
				<td>
					<input type="password" name="pw_check" size="20">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">이    름</td>
				<td>
					<input type="text" name="mem_name" size="20">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">E-mail</td>
				<td>
					<input type="text" name="mem_email" size="30">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">주    소</td>
				<td>
					<input type="text" name="mem_addr" size="40">*
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
<!-- 					//자바스크립트 거쳐서감 -->
					<input type="button" value="등록" onclick="check_ok()">
					<input type="reset" value="다시입력">
				</td>	
			</tr>
		</form>
	</table>
</body>
</html>
