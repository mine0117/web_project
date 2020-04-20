package movie.model;


import java.sql.SQLException;
import java.util.ArrayList;

import movie.vo.MovieVo;
import movie.vo.PagingVo;

public class MovieDao extends DBManager {
	
	//기본 생성자(외부에서 객체생성을 못하도록 private 접근제한자 처리 - MovieDao에서만 생성가능
	private MovieDao() {}
	private static MovieDao instance = new MovieDao();
	
	public static MovieDao getInstance(){
		return instance;
	}
	
	//영화리스트
	public ArrayList<MovieVo> selectmovie() {
		
		ArrayList<MovieVo> rst = new ArrayList<MovieVo>();
		conn = getConnect();;
		String sql = "select m.*,avg(b.score) as staravg,count(b.mid) as rcount from board as b right join movie m on m.mid = b.mid group by m.mid order by rday desc";
		
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MovieVo temp = new MovieVo();
				temp.setMid(rs.getString("mid"));
				temp.setGenre(rs.getString("genre"));
				temp.setMname(rs.getString("mname"));
				temp.setMname_e(rs.getString("mname_e"));
				temp.setRday(rs.getDate("rday"));
				temp.setRtime(rs.getInt("rtime"));
				temp.setCountry(rs.getString("country"));
				temp.setRank(rs.getString("rank"));
				temp.setDirector(rs.getString("director"));
				temp.setCast(rs.getString("cast"));
				
				if(rs.getString("rank").indexOf("전체")!=-1){
					temp.setRank_css("all");
				}else if(rs.getString("rank").indexOf("12세")!=-1){
					temp.setRank_css("12");
				}else if(rs.getString("rank").indexOf("15세")!=-1){
					temp.setRank_css("15");
				}else if(rs.getString("rank").indexOf("청소년")!=-1){
					temp.setRank_css("18");
				}
				
				temp.setStar(rs.getDouble("staravg"));
				temp.setStr_star(String.format("%.2f",rs.getDouble("staravg")));
				temp.setRcount(rs.getInt("rcount"));
				rst.add(temp);
			
				
			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		DBClose();
		return rst;
	}
	
	//영화리스트 (정렬추가)
	public ArrayList<MovieVo> movieSelect(PagingVo pagingVO) {
		
		ArrayList<MovieVo> list = null;
		conn = getConnect();
		
		String sql = "select m.*,avg(b.score) as staravg,count(b.mid) as rcount from board as b right join movie m on m.mid = b.mid group by m.mid";
		sql += " order by "+ pagingVO.getOrderValue() + " desc";

		try{
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, pagingVO.getOrderValue());
			
			//System.out.println("moviedao: "+pagingVO.getOrderValue());
			//System.out.println(sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<MovieVo>();
			
			while(rs.next()){
				MovieVo temp = new MovieVo();
				temp.setMid(rs.getString("mid"));
				temp.setGenre(rs.getString("genre"));
				temp.setMname(rs.getString("mname"));
				temp.setMname_e(rs.getString("mname_e"));
				temp.setRday(rs.getDate("rday"));
				temp.setRtime(rs.getInt("rtime"));
				temp.setCountry(rs.getString("country"));
				temp.setRank(rs.getString("rank"));
				temp.setDirector(rs.getString("director"));
				temp.setCast(rs.getString("cast"));
				
				if(rs.getString("rank").indexOf("전체")!=-1){
					temp.setRank_css("all");
				}else if(rs.getString("rank").indexOf("12세")!=-1){
					temp.setRank_css("12");
				}else if(rs.getString("rank").indexOf("15세")!=-1){
					temp.setRank_css("15");
				}else if(rs.getString("rank").indexOf("청소년")!=-1){
					temp.setRank_css("18");
				}
				
				temp.setStar(rs.getDouble("staravg"));
				temp.setStr_star(String.format("%.2f",rs.getDouble("staravg")));
				temp.setRcount(rs.getInt("rcount"));
			
				list.add(temp);

			}
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		DBClose();
		return list;
	}
	
	//영화검색된리스트 (정렬추가)
		public ArrayList<MovieVo> movieSearch(PagingVo pagingVO) {
			
			ArrayList<MovieVo> list = null;
			conn = getConnect();
			
			String sql = "select m.*,avg(b.score) as staravg,count(b.mid) as rcount from board as b right join movie m on m.mid = b.mid";
			sql += " where m.mname like ? or m.mname_e like ?";
			sql += " group by m.mid order by rday desc";
			
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+pagingVO.getKeyValue()+"%");
				pstmt.setString(2, "%"+pagingVO.getKeyValue()+"%");

				rs = pstmt.executeQuery();
				list = new ArrayList<MovieVo>();
				System.out.println(rs);
				while(rs.next()){
					MovieVo temp = new MovieVo();
					temp.setMid(rs.getString("mid"));
					temp.setGenre(rs.getString("genre"));
					temp.setMname(rs.getString("mname"));
					temp.setMname_e(rs.getString("mname_e"));
					temp.setRday(rs.getDate("rday"));
					temp.setRtime(rs.getInt("rtime"));
					temp.setCountry(rs.getString("country"));
					temp.setRank(rs.getString("rank"));
					temp.setDirector(rs.getString("director"));
					temp.setCast(rs.getString("cast"));
					
					if(rs.getString("rank").indexOf("전체")!=-1){
						temp.setRank_css("all");
					}else if(rs.getString("rank").indexOf("12세")!=-1){
						temp.setRank_css("12");
					}else if(rs.getString("rank").indexOf("15세")!=-1){
						temp.setRank_css("15");
					}else if(rs.getString("rank").indexOf("청소년")!=-1){
						temp.setRank_css("18");
					}
					
					temp.setStar(rs.getDouble("staravg"));
					temp.setStr_star(String.format("%.2f",rs.getDouble("staravg")));
					temp.setRcount(rs.getInt("rcount"));
				
					list.add(temp);
				
					
				}
			} catch (SQLException e){
				e.printStackTrace();
			}
			
			DBClose();
			return list;
			
		}
	
	
	//영화검색결과수
	public int movieCount (PagingVo pagingVO){
		
		int total = 0;
		conn = getConnect();
		
		String sql = "select count(*) from movie where mname like ? or mname_e like ?";

		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+pagingVO.getKeyValue()+"%");
			pstmt.setString(2, "%"+pagingVO.getKeyValue()+"%");
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				total = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		DBClose();
		return total;
	}

	
	//영화상세
	public MovieVo moviedetail(String mid){
		
		MovieVo vo = null;
		conn = getConnect();
		StringBuffer sb = new StringBuffer("");
		sb.append("\n select m.*,avg(b.score) as staravg,count(b.mid) as rcount from board as b right join movie m on m.mid = b.mid where m.mid = ?");
		String sql = sb.toString();
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo = new MovieVo();
				vo.setMid(rs.getString("mid"));
				vo.setGenre(rs.getString("genre"));
				vo.setMname(rs.getString("mname"));
				vo.setMname_e(rs.getString("mname_e"));
				vo.setRday(rs.getDate("rday"));
				vo.setRtime(rs.getInt("rtime"));
				vo.setCountry(rs.getString("country"));
				vo.setRank(rs.getString("rank"));
				vo.setDirector(rs.getString("director"));
				vo.setCast(rs.getString("cast"));
				
				if(rs.getString("rank").indexOf("전체")!=-1){
					vo.setRank_css("all");
				}else if(rs.getString("rank").indexOf("12세")!=-1){
					vo.setRank_css("12");
				}else if(rs.getString("rank").indexOf("15세")!=-1){
					vo.setRank_css("15");
				}else if(rs.getString("rank").indexOf("청소년")!=-1){
					vo.setRank_css("18");
				}
				
				vo.setStar(rs.getDouble("staravg"));
				vo.setStr_star(String.format("%.2f",rs.getDouble("staravg")));
				vo.setStar(Double.parseDouble(String.format("%.2f",rs.getDouble("staravg")))); //소수2자리수만들기
				System.out.println(String.format("%.2f",rs.getDouble("staravg")));
				
				vo.setRcount(rs.getInt("rcount"));


			}
			
		}catch (SQLException e){
			e.printStackTrace();
		}
		
		DBClose();
		return vo;
		
	}
	
	//리뷰쓰기폼
	public MovieVo reviewform(String mid){
		
		MovieVo vo = null;
		conn = getConnect();
		StringBuffer sb = new StringBuffer("");
		sb.append("\n select mid,mname,mname_e from movie where mid=?");
		String sql = sb.toString();
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo = new MovieVo();
				vo.setMid(rs.getString("mid"));
				vo.setMname(rs.getString("mname"));
				vo.setMname_e(rs.getString("mname_e"));
				
			}
			
		}catch (SQLException e){
			e.printStackTrace();
		}
		
		DBClose();
		
		return vo;
		
	}
	
}
