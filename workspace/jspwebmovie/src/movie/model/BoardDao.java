package movie.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import movie.vo.BoardVo;
import movie.vo.PagingVo;

public class BoardDao extends DBManager {
	
	private BoardDao() {}
	private static BoardDao instance = new BoardDao();
	
	public static BoardDao getInstance(){
		return instance;
	}
	
	//메인 리뷰리스트
	public ArrayList<BoardVo> selectmainreview(){
		
		ArrayList<BoardVo> rst = new ArrayList<BoardVo>();
		conn = getConnect();
		String sql = "";
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BoardVo Btemp = new BoardVo();
				Btemp.setNum(rs.getInt("num"));
				Btemp.setTitle(rs.getString("title"));
				Btemp.setScore(rs.getInt("score"));
				Btemp.setContent(rs.getString("content"));
				Btemp.setId(rs.getString("id"));
				Btemp.setMid(rs.getString("mid"));
				Btemp.setReg_date(rs.getTimestamp("reg_date"));
				Btemp.setMname(rs.getString("mname"));
				Btemp.setAvgscore(rs.getDouble("avgscore"));
				
				rst.add(Btemp);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
			DBClose();
			return rst;
	}
	
	//리뷰리스트
	public ArrayList<BoardVo> selectreview(){
		
		ArrayList<BoardVo> rst = new ArrayList<BoardVo>();
		conn = getConnect();
		String sql = "select b.*, m.mname from board as b left join movie as m on b.mid = m.mid order by reg_date desc";
		
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BoardVo Btemp = new BoardVo();
				Btemp.setNum(rs.getInt("num"));
				Btemp.setTitle(rs.getString("title"));
				Btemp.setScore(rs.getInt("score"));
				Btemp.setContent(rs.getString("content"));
				Btemp.setId(rs.getString("id"));
				Btemp.setMid(rs.getString("mid"));
				Btemp.setReg_date(rs.getTimestamp("reg_date"));
				Btemp.setMname(rs.getString("mname"));
				
				rst.add(Btemp);
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		DBClose();
		return rst;
	}
	
	//리뷰검색
	public ArrayList<BoardVo> boardSelect(PagingVo pagingVO){
		
		ArrayList<BoardVo> list = null;
		conn = getConnect();
		
		String sql = "select b.*, m.mname from board as b left join movie as m on b.mid = m.mid where ";
		sql +=pagingVO.getKeyWord(); //id  바인드변수로 선언하면 String으로 "" 형식으로 들어가서 안됨
		sql +=" like ? "; //? = '% %'
		sql +=" order by reg_date desc ";
		sql +="limit ?,?"; // --등록날짜 내림차순 / 페이징 0번째부터 5개 안에 세미콜론없어야함 int
		
		try{
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+pagingVO.getKeyValue()+"%");
			pstmt.setInt(2, (pagingVO.getPageNum()-1)*pagingVO.getRowNum());
			pstmt.setInt(3, pagingVO.getRowNum());
			
			rs=pstmt.executeQuery();
			list=new ArrayList<BoardVo>();
			
			while(rs.next()){
				BoardVo vo = new BoardVo();
				vo.setNum(rs.getInt("num"));
				vo.setTitle(rs.getString("title"));
				vo.setScore(rs.getInt("score"));
				vo.setContent(rs.getString("content"));
				vo.setId(rs.getString("id"));
				vo.setMid(rs.getString("mid"));
				vo.setMname(rs.getString("mid"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setMname(rs.getString("mname"));

				list.add(vo);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		DBClose();
		return list;
	}
	
	//검색결과수
	public int reviewCount(PagingVo pagingVO) { //변수를 void=>int로 변경 게시물조회 복사 후 수정
		
		int total = 0;
		conn = getConnect();
		
		String sql = "select @RNUM:=@RNUM+1 as cnum, x.* from (select b.*, m.mname from board as b left join movie as m on b.mid = m.mid where ";
		sql +=pagingVO.getKeyWord(); //id  바인드변수로 선언하면 String으로 "" 형식으로 들어가서 안됨
		sql +=" like ? "; //? = '% %'
		sql +=" order by reg_date)x,(select @rnum:=0)r";
		try{
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+pagingVO.getKeyValue()+"%");
			//쿼리문 수행한 결과받기
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				total=rs.getInt(1); //"cnum"의 인덱스번호
			}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
			
		}catch(Exception e){
			e.printStackTrace();
		}
		DBClose();
		return total;
	}
		
	//페이징
	public static PagingVo setPagingInfo(PagingVo pagingVO){
		
		String pageNum_temp = pagingVO.getPageNum_temp();		
				
		if (pageNum_temp == null)
			pageNum_temp = "1"; //만약 값이 NULL값이면 초기값을 1페이지로 세팅 
		int pageNum = Integer.parseInt(pageNum_temp); //그 값을 pageNum에 대입 
		int pageCount = (pagingVO.getTotal() / pagingVO.getRowNum()) + (pagingVO.getTotal() % pagingVO.getRowNum() == 0 ? 0 : 1); //페이징 개수 전체 카운트 
		int startPage = (pagingVO.getPageBlock() * ((pageNum - 1) / pagingVO.getPageBlock())) + 1; //시작페이지 
		int endPage = startPage + (pagingVO.getPageBlock() - 1); //끝페이지 
		
		pagingVO.setPageNum(pageNum);
		pagingVO.setPageCount(pageCount);
		pagingVO.setStartPage(startPage);
		pagingVO.setEndPage(endPage);
		
		return pagingVO;
	}


	//리뷰등록
	public int insertReview(BoardVo bvo) {

		int rs = 0;
		conn = getConnect();
		String sql = "insert into board (title,score,content,id,mid) values(?,?,?,?,?)";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bvo.getTitle());
			pstmt.setInt(2, bvo.getScore());
			pstmt.setString(3, bvo.getContent());
			pstmt.setString(4, bvo.getId());
			pstmt.setString(5, bvo.getMid());
			
			rs = pstmt.executeUpdate();
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		DBClose();
		return rs;
	}
	
	//리뷰상세
	public BoardVo reviewdetail(int num){
		
		BoardVo bvo = null;
		conn = getConnect();
		String sql = "select b.*, m.mname from board as b left join movie as m on b.mid = m.mid where b.num=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				bvo = new BoardVo();
				bvo.setNum(rs.getInt("num"));
				bvo.setTitle(rs.getString("title"));
				bvo.setScore(rs.getInt("score"));
				bvo.setContent(rs.getString("content"));
				bvo.setId(rs.getString("id"));
				bvo.setMid(rs.getString("mid"));
				bvo.setReg_date(rs.getTimestamp("reg_date"));
				bvo.setMname(rs.getString("mname"));
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		DBClose();
		return bvo;
	}
	
	//리뷰수정
	public int updateReview(BoardVo bvo) {
		
		int rs = 0;
		conn = getConnect();
		String sql = "update board set title=?, score=?, content=? where num=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bvo.getTitle());
			pstmt.setInt(2, bvo.getScore());
			pstmt.setString(3, bvo.getContent());
			pstmt.setInt(4, bvo.getNum());
			
			rs=pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}

		DBClose();
		return rs;
		
	}
	
	//리뷰삭제
	public int deleteReview(int num){
		
		int rs = 0;
		conn = getConnect();
		String sql = "delete from board where num =?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}

		DBClose();
		return rs;
	}
	
	//리뷰중복등록검사
		public int checkReview(BoardVo bvo) {

			int result = 0;
			conn = getConnect();
			String sql = "select count(*) from board where mid=? and id=?";
			
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bvo.getMid());
				pstmt.setString(2, bvo.getId());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					result = rs.getInt(1);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			DBClose();
			return result;
		}

	//나만의 리뷰보기
			
		public ArrayList<BoardVo> Myreivew(String id, PagingVo pagingVO){
			
			ArrayList<BoardVo> list = null;
			conn = getConnect();
			
			String sql = "select b.*, m.mname from board as b left join movie as m on b.mid = m.mid where b.id= ? and ";
			
			sql +=pagingVO.getKeyWord(); //id  바인드변수로 선언하면 String으로 "" 형식으로 들어가서 안됨
			sql +=" like ? "; //? = '% %'
			sql +=" order by reg_date desc ";
			sql +="limit ?,?"; // --등록날짜 내림차순 / 페이징 0번째부터 5개 안에 세미콜론없어야함 int
			
			try{
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%"+pagingVO.getKeyValue()+"%");
				pstmt.setInt(3, (pagingVO.getPageNum()-1)*pagingVO.getRowNum());
				pstmt.setInt(4, pagingVO.getRowNum());
				
				rs=pstmt.executeQuery();
				list=new ArrayList<BoardVo>();
				
				while(rs.next()){
					BoardVo vo = new BoardVo();
					vo.setNum(rs.getInt("num"));
					vo.setTitle(rs.getString("title"));
					vo.setScore(rs.getInt("score"));
					vo.setContent(rs.getString("content"));
					vo.setId(rs.getString("id"));
					vo.setMid(rs.getString("mid"));
					vo.setMname(rs.getString("mid"));
					vo.setReg_date(rs.getTimestamp("reg_date"));
					vo.setMname(rs.getString("mname"));

					list.add(vo);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			DBClose();
			return list;
		}

		// 나만의 리뷰 수 
		public int MyreviewCount(String id, PagingVo pagingVO) { //변수를 void=>int로 변경 게시물조회 복사 후 수정
			
			int total = 0;
			conn = getConnect();
			
			String sql = "select count(*) from (select b.*, m.mname from board as b left join movie as m on b.mid = m.mid where b.id= ? and ";
			sql +=pagingVO.getKeyWord(); //id  바인드변수로 선언하면 String으로 "" 형식으로 들어가서 안됨
			sql +=" like ? "; //? = '% %'
			sql +=" order by reg_date)x,(select @rnum:=0)r";
			try{
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2,"%"+pagingVO.getKeyValue()+"%");
				//쿼리문 수행한 결과받기
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					total=rs.getInt(1); //"cnum"의 인덱스번호
				}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
				
			}catch(Exception e){
				e.printStackTrace();
			}
			DBClose();
			return total;
		}
  
		
		
}
