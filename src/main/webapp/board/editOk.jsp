<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	BoardDBBean db = BoardDBBean.getInstance();

	out.print("@# edit_ok.jsp board.getB_id() => "+board.getB_id()); 
	out.print("@# edit_ok.jsp board.getB_name() => "+board.getB_name()); 
	
	int re = db.editBoard(board);
	
	if(re == 1){//수정 성공일때
		response.sendRedirect("list.jsp");
	}else if(re == 0){//비밀번호 불일치
		%>
		<script>
			alert("비밀번호가 맞지 않습니다.")
			history.go(-1)
		</script>
	<%
	}else if(re == -1){//수정 실패일때
	%>
		<script>
			alert("수정에 실패하였습니다.")
			history.go(-1)
		</script>
	<%
	}
%>