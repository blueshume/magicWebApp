<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
// 	자바 클래스 이용해서 ip 추가
	InetAddress address = InetAddress.getLocalHost();
// 	getHostAddress() : ip 주소 가져오는 메소드
	String ip = address.getHostAddress();

	BoardDBBean db = BoardDBBean.getInstance();
// 	오늘날짜 추가
	board.setB_date(new Timestamp(System.currentTimeMillis()));
// 	0:0:0:0:0:0:0:1
// 	board.setB_ip(request.getRemoteAddr());
	board.setB_ip(ip);//192.168.0.43
	
	if(db.insertBoard(board) == 1){//글쓰기가 정상적으로 완료시
		out.print("글쓰기 성공");
	}else{
		out.print("글쓰기 실패");
	} 
%>