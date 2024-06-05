<%@page import="magic.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="magic.member.MemberBean" id="mb"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<%
	//객체생성 new 대신
	MemberDBBean manager = MemberDBBean.getInstance();

	if(manager.confirmID(mb.getMem_uid()) == 1){//아이디 중복
		%>
			<script>
				alert("중복되는 아이디가 존재합니다.");//alert를 쓰기위해 스크립트태그 사용
				history.back();
			</script>
		<%
	}else{//아이디 중복 아님
// 		int re = manager.insertMember(mb.getMem_uid());//uid만 전송
		int re = manager.insertMember(mb);//전부다 한번에 전송
	
		if(re == 1){//insert 정상적으로 실행
		%>
			<script>
				alert("회원가입을 축하드립니다.\n회원으로 로그인 해주세요");//alert를 쓰기위해 스크립트태그 사용
				location.href="login.jsp";
			</script>
		<%
		}else{
			%>
			<script>
				alert("회원가입실에 실패했습니다.");//alert를 쓰기위해 스크립트태그 사용
				location.href="login.jsp";
			</script>
		<%
		}
	}
%>