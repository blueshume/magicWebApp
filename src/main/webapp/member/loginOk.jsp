<%@page import="magic.member.MemberBean"%>
<%@page import="magic.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("mem_uid");
	String pw = request.getParameter("mem_pw");
	
	MemberDBBean manager = MemberDBBean.getInstance();
	int check = manager.userCheck(id, pw);
	MemberBean mb = manager.getMember(id);
// 	String name= mb.getMem_name();
	
	if(mb == null){//회원정보 없음
		%>
		<script>
			alert("존재하지 않는 회원");
			history.go(-1);
		</script>
	<%
	}else{//회원 없음
		if(check == 1){//일치
			String name= mb.getMem_name();
//	 		세션에 사용자 정보추가
			session.setAttribute("uid", id);//회원아이디
			session.setAttribute("name", name);//회원이름
			session.setAttribute("Member", "yes");//회원여부
			response.sendRedirect("main.jsp");
		}else if(check == 0){//불일치
			%>
				<script>
					alert("비밀번호가 맞지 않습니다.");
					history.go(-1);//-1 한칸 뒤로가기
				</script>
			<%
		}else{//아이디가 불일치
			%>
				<script>
					alert("아이디가 맞지 않습니다.");
					history.go(-1);//-1 한칸 뒤로가기
				</script>
			<%
		}
	}
	
	
// 	초기값 -1 ,비밀번호가 일치하면 1, 비밀번호가 불일치하면 0
	if(check == 1){//일치
		String name= mb.getMem_name();

// 		세션에 사용자 정보추가
		session.setAttribute("uid", id);//회원아이디
		session.setAttribute("name", name);//회원이름

	}else if(check == 0){//불일치
		%>
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);//-1 한칸 뒤로가기
			</script>
		<%
	}else{//아이디가 불일치
		%>
			<script>
				alert("아이디가 맞지 않습니다.");
				history.go(-1);//-1 한칸 뒤로가기
			</script>
		<%
	}
	
%>