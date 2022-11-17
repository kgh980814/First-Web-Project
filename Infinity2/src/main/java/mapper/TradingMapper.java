package mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBUtil;
import model.BoardVO;
import model.PagingDTO;
import model.TradingVO;

public class TradingMapper {
	public int create(TradingVO vo) {
		//회원가입후 로그인페이지로 이동.
				StringBuffer qry = new StringBuffer();
				qry.append(" INSERT INTO big_trading (tra_num, tra_account, tra_inputdate) ");
				qry.append(" VALUES (null, ?, curdate()) ");
				String sql = qry.toString();

				Connection conn = null;
				PreparedStatement stmt = null;
				int lastId = 0;

				try{
					conn = DBUtil.getConnection();
					
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, vo.getTra_account());
					int res = stmt.executeUpdate();
					
					//last ID 가져오기
					String sqlLastId= "select last_insert_id() as lastId ";
					stmt = conn.prepareStatement(sqlLastId);
					ResultSet rs =stmt.executeQuery();
					if(rs.next()){
						lastId = rs.getInt("lastId");
					}
					
				} catch (Exception e){
					
				} finally {
					DBUtil.setClose(null, stmt, conn);
				}
		return lastId;
	}
	
	public List<TradingVO> read(){
		StringBuffer qry = new StringBuffer();
		qry.append(" SELECT * FROM big_trading ORDER BY tra_num DESC ");
		String sql = qry.toString();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		List<TradingVO> list = new ArrayList<>();

		try{
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			//last ID 가져오기
		while(rs.next()) {
			TradingVO vo = new TradingVO();
			vo.setTra_num(rs.getInt("tra_num"));
			vo.setTra_account(rs.getString("tra_account"));
			vo.setTra_inputdate(rs.getDate("tra_inputdate"));
		
			
			list.add(vo);
		}
			
		} catch (Exception e){
			
		} finally {
			DBUtil.setClose(rs, stmt, conn);
		}
		return list;
		
	}

	public TradingVO read(int tra_num) {
		StringBuffer qry = new StringBuffer();
		qry.append(" SELECT * FROM big_trading WHERE tra_num = ? ");
		String sql = qry.toString();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		TradingVO vo = null;

		try{
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, tra_num);
			
			//SELECT문
			rs = stmt.executeQuery();
			
			//last ID 가져오기
		if(rs.next()) {
		
			vo = new TradingVO();
			vo.setTra_num(rs.getInt("tra_num"));
			vo.setTra_account(rs.getString("tra_account"));
			vo.setTra_inputdate(rs.getDate("tra_inputdate"));
		
			
		}
			
		} catch (Exception e){
			
		} finally {
			DBUtil.setClose(rs, stmt, conn);
		}
		return vo;
	}
	
	public List<TradingVO> readWithPaging(PagingDTO dto) {
		StringBuffer qry = new StringBuffer();
		qry.append(" SELECT * FROM big_trading ORDER BY tra_num DESC LIMIT " + dto.startPage() + ", " + dto.getPageRow());
		String sql = qry.toString();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<TradingVO> list = new ArrayList<>();
		try{
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
						
			while(rs.next()){
				TradingVO vo = new TradingVO();
				vo.setTra_num(rs.getInt("tra_num"));
				vo.setTra_account(rs.getString("tra_account"));
				vo.setTra_inputdate(rs.getDate("tra_inputdate"));
				
				list.add(vo);
			}
		} catch(Exception e){
			
		} finally {
			DBUtil.setClose(rs, stmt, conn);
		}
		return list;		
	}

	public int totalCnt() {
		StringBuffer qry = new StringBuffer();
		qry.append(" SELECT count(*) as cnt FROM big_trading ");
		String sql = qry.toString();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		int total = 0;
		try{
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
						
			if(rs.next()){
				total = rs.getInt("CNT");
			}
		} catch(Exception e){
			
		} finally {
			DBUtil.setClose(rs, stmt, conn);
		}
		return total;
	}
}
