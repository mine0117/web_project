package movie.model;

import java.sql.SQLException;

import movie.vo.MemberVo;

public class MemberDao extends DBManager{
	
	//기본 생성자(외부에서 객체생성을 못하도록 private 접근제한자 처리 - MovieDao에서만 생성가능
	private MemberDao() {}
	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance(){
		return instance;
	}
	
	//회원가입
	public int insertMem(MemberVo memvo){
		
		int rs = 0;
		conn = getConnect();
		String sql = "insert into member (id,pwd,dname,email) values ( ?, ?, ?, ?) ";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memvo.getId());
			pstmt.setString(2, memvo.getPwd());
			pstmt.setString(3, memvo.getDname());
			pstmt.setString(4, memvo.getEmail());
			
			rs = pstmt.executeUpdate();
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		DBClose();
		return rs;
	}
	
	//회원정보
	public MemberVo memberDetail(String id) {
		
		MemberVo memvo = null;
		conn = getConnect();
		String sql = "select * from member where id = ?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				memvo = new MemberVo();
				memvo.setId(rs.getString("id"));
				memvo.setPwd(rs.getString("pwd"));
				memvo.setDname(rs.getString("dname"));
				memvo.setEmail(rs.getString("email"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}

		DBClose();
		return memvo;
	}
	
	
	//회원수정
	public int updateMem(MemberVo memvo){
		int rs = 0;
		conn = getConnect();
		String sql = "update MEMBER set pwd=?, dname=?, email=? where id=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memvo.getPwd());
			pstmt.setString(2, memvo.getDname());
			pstmt.setString(3, memvo.getEmail());
			pstmt.setString(4, memvo.getId());
			
			rs=pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}

		DBClose();
		return rs;
	}
	
	//회원탈퇴
	public int deleteMem(String id){
		
		int rs = 0;
		conn = getConnect();
		String sql = "delete from member where id=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}

		DBClose();
		return rs;
	}

}
