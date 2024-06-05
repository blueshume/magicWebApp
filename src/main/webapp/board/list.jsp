<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//ArrayList<BoardBean> lsitBoard(): 사용하기위한 설정
	BoardDBBean db = BoardDBBean.getInstance();
	//호출된 메소드의 반환 타입으로 받아주면 됨 
	ArrayList<BoardBean> boardList =  db.listBoard();

	int b_id=0,b_hit=0;
	String b_name,b_email,b_title,b_content;
	Timestamp b_date;
	
// 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>게시판에 등록될 글 목록</h1>
		<table width = "600" >
			<tr>
				<td align="right">
					<a href="write.jsp">글 쓰 기</a>
				</td>
			</tr>
		</table>
	</center>
	<center>
		<table border="1" width="800" cellspacing="0">
			<tr height="25">
				<td width="40" align="center">번호</td>
				<td width="450" align="center">글제목</td>
				<td width="120" align="center">작성자</td>
				<td width="130" align="center">작성일</td>
				<td width="60" align="center">조회수</td>
			</tr>
			<%
			//boardList에 있는 데이터를 가져옴 
				for(int i =0; i<boardList.size(); i++){
					
// 					ArrayList의 BoardBean객체를 가져온다
					//하나의 개시글이 된다 / 이것을 i만큼 반복
					BoardBean board = boardList.get(i);
					b_id = board.getB_id();
					b_title = board.getB_title();
					b_name = board.getB_name();
					b_date = board.getB_date();
					b_hit = board.getB_hit();
					%>
<!--for문 안에 넣어 반복하면서 출력하게 한다 -->
					<tr bgcolor="#f7f7f7"
					onmouseover="this.style.backgroundColor ='#eeeeef'"
					onmouseout="this.style.backgroundColor ='#f7f7f7'">
						<td align="center"><%= b_id %></td>
						<td >
<!--					"show.jsp?b_id" : b의 id를 들고가겠다 -->
<!--					글번호를 가지고 글 내용 보기 페이지로 이동 -->
<!-- 				제목 클릭하면 들고가면서 글번호 입력한다 -->
						<a href="show.jsp?b_id=<%= b_id %>">
							<%= b_title %>	
						</a>
						</td>
						<td align="center"><%= b_name %></td>
<%-- 						<td align="center"><%= b_date %></td> --%>
						<td align="center"><%=sdf.format(b_date) %></td>
						<td align="center"><%= b_hit %></td>
					</tr>
					<%
				}
			%>
		</table>
	</center>
</body>
</html>