<%@page import="java.text.SimpleDateFormat"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	int bid =Integer.parseInt(request.getParameter("b_id")); // itn bid = Integer 캐스팅해주고 parseInt안에 담는다.
	BoardDBBean db = BoardDBBean.getInstance();
	//board 객체안에 게시글의 정보가 저장되어있음
//  BoardBean board = db.getBoard(bid);
// 	public BoardBean getBoard(int bid, boolean hitadd) BoardDBBean클래스에서 getBoard 메소드 수정해서 추가함
 	BoardBean board = db.getBoard(bid,true);//조회수에 해당 true
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 내 용 보 기</h1>
	<table border="1" width ="600" cellspacing="0">
		<tr height="30" align="center">
			<td width="80">글번호</td>
			<td width="200"><%= board.getB_id() %></td>
			<td width="80">조회수</td>
			<td width="200"><%= board.getB_hit() %></td>
				</tr>
			<tr height="30" align="center">	
			<td width="100">작성자</td>
			<td width="200"><%= board.getB_name() %></td>
			<td width="100">작성일</td>
			<td width="200"><%= sdf.format(board.getB_date())%></td>
			</tr>
		<tr height="30" align="center">
			<td width="100">글제목</td>
			<td width="200" align="left"><%= board.getB_title() %></td>
		</tr>
	<tr height="30" align="center">
			<td width="100">글내용</td>
			<td width="200" align="left"><%= board.getB_content() %></td>
		</tr>
		
		<tr height="30" >
			<td colspan="4" align="right">
				<input type="button" value="글수정" onclick="location.href='edit.jsp?b_id=<%= board.getB_id() %>'">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제" onclick="location.href='delete.jsp?b_id=<%= board.getB_id() %>'">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="location.href='list.jsp'">
			</td>
		</tr>
	</table>
		</form>
	</center>
</body>
</html>