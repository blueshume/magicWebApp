package magic.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDBBean {
//	jsp 소스에서 MemberDB 빈객체 생성을 위한 참조 변수
	private static MemberDBBean instance = new MemberDBBean();
	
//	MemberDBBean 객체 레퍼런스를 리턴하는 메소드
	public static MemberDBBean getInstance() {
		return instance;
	}
	
//	쿼리작업에 사용할 커넥션 객체를 리턴하는 메소드(dbcp 기법)
	public Connection getConnection() throws Exception {
		return ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/mysql"))).getConnection();
	}
	
//	public int insertMember(String uid) {
	public int insertMember(MemberBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int re =-1;//초기값 -1, insert 정상적으로 실행되면 1
//		String sql = "insert into memberT values('abcd4','a1234','a222','abcd2@a.com','서울')";
//		String sql = "insert into memberT values(?,'a1234','a222','abcd2@a.com','서울')";//
		String sql = "insert into memberT values(?,?,?,?,?)";
		
		try {
//			dbcp 기법의 연결 객체
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, uid);//'abcd4'를 ?로 수정해서 넣음
			pstmt.setString(1, member.getMem_uid());//values(?,?,?,?,?)일때
			pstmt.setString(2, member.getMem_pw());//values(?,?,?,?,?)
			pstmt.setString(3, member.getMem_name());//values(?,?,?,?,?)
			pstmt.setString(4, member.getMem_email());//values(?,?,?,?,?)
			pstmt.setString(5, member.getMem_addr());//values(?,?,?,?,?)
//			INSERT 문은 executeUpdate 메소드 호출
			re = pstmt.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(pstmt != null){pstmt.close(); }
				if(conn != null){conn.close(); }
			}catch(Exception se){
				se.printStackTrace();
			}
		}
		
		return re;
	}
	
//	회원 가입시 아이디 중복 확인할 때 사용하는 메소드
	public int confirmID(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re =-1;//초기값 -1 아이디가 중복이면 1
//		매개변수로 받은 id를 ? 인 쿼리 파라미터에 매핑
		String sql = "select mem_uid ,mem_pw ,mem_name , mem_email ,mem_addr from memberT where mem_uid=?";
		
		try {
//			dbcp 기법의 연결 객체
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
//			SELECT 문은 executeQuery 메소드 호출
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//아이디가 일치하는 로우 존재
				re = 1;
			}else {//해당 아이디가 존재하지 않음
				re = -1;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(rs != null){rs.close(); }
				if(pstmt != null){pstmt.close(); }
				if(conn != null){conn.close(); }
			}catch(Exception se){
				se.printStackTrace();
			}
		}
		
		return re;
		
	}
	public int userCheck(String id,String pw) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int re =-1;//초기값 -1 아이디가 중복이면 1
			String db_mem_pw="";
			String sql = "select mem_pw from memberT where mem_uid=?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {//아이디가 일치하는 로우 존재
					db_mem_pw = rs.getString("mem_pw");
					if(db_mem_pw.equals(pw)) {//패스워드 일치
						re = 1;
					}else {//패스워드 불일치
						re = 0;
					}
					re = 1;
				}else {//해당 아이디가 존재하지 않음
					re = -1;
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}finally{
				try{
					if(rs != null){rs.close(); }
					if(pstmt != null){pstmt.close(); }
					if(conn != null){conn.close(); }
				}catch(Exception se){
					se.printStackTrace();
				}
			}
			
			return re;
			
		}
//	아이디가 일치하는 멤버의 정보를 얻어오는 메소드
	public MemberBean getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re =-1;//초기값 -1 ,비밀번호가 일치하면 1, 비밀번호가 불일치하면 0
		String sql = "select mem_uid ,mem_pw ,mem_name , mem_email ,mem_addr from memberT where mem_uid=?";
		MemberBean member =null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			//이미 확인하고 와서 else는 필요없어서 삭제
			if(rs.next()) {//아이디가 일치하는 로우 존재
				member = new MemberBean();
				member.setMem_uid(id);
				member.setMem_pw(rs.getString("mem_pw"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_email(rs.getString("mem_email"));
				member.setMem_addr(rs.getString("mem_addr"));
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(rs != null){rs.close(); }
				if(pstmt != null){pstmt.close(); }
				if(conn != null){conn.close(); }
			}catch(Exception se){
				se.printStackTrace();
			}
		}
		
		return member;
		
	}
	
	public int updateMember(MemberBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int re =-1;//초기값 -1 ,비밀번호가 일치하면 1, 비밀번호가 불일치하면 0
		String sql = "update memberT set mem_pw=?, mem_email=? ,mem_addr=? where mem_uid=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			System.out.println("@# getMem_pw()=>"+member.getMem_pw());
			System.out.println("@# getMem_email()=>"+member.getMem_email());
			System.out.println("@# getMem_addr()=>"+member.getMem_addr());
			System.out.println("@# getMem_uid()=>"+member.getMem_uid());
			
			pstmt.setString(1, member.getMem_pw());
			pstmt.setString(2, member.getMem_email());
			pstmt.setString(3, member.getMem_addr());
			pstmt.setString(4, member.getMem_uid());
			re = pstmt.executeUpdate();

		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(pstmt != null){pstmt.close(); }
				if(conn != null){conn.close(); }
			}catch(Exception se){
				se.printStackTrace();
			}
		}
		
		return re;
		
	}
	
	
}
