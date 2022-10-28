package mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBUtil;
import model.TradingDetailVO;

public class TradingDetailMapper {
	
	public void create(TradingDetailVO vo) {
		StringBuffer qry = new StringBuffer();
		qry.append(" INSERT INTO big_tradingdetail(trad_num,trad_refnum,trad_tradingDate, ");
		qry.append(" trad_subject, trad_standard, trad_quantity, trad_unitPrice, trad_supplyPrice, ");
		qry.append(" trad_taxAmount, trad_ect) ");
		qry.append(" VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ");
		String sql = qry.toString();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try{
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, vo.getTrad_refnum());
			stmt.setDate(2, new java.sql.Date(vo.getTrad_tradingDate().getTime()));
			stmt.setString(3, vo.getTrad_subject());
			stmt.setString(4, vo.getTrad_standard());
			stmt.setInt(5, vo.getTrad_quantity());
			stmt.setInt(6, vo.getTrad_unitPrice());
			stmt.setInt(7, vo.getTrad_supplyPrice());
			stmt.setInt(8, vo.getTrad_taxAmount());
			stmt.setString(9, vo.getTrad_ect());
			
			stmt.executeUpdate();
			
			
			
		} catch (Exception e){
			
		} finally {
			DBUtil.setClose(null, stmt, conn);
		}
	}
	/*
	 * @param tra_num
	 * @
	 */
	public List<TradingDetailVO> read(int tra_num){
		StringBuffer qry = new StringBuffer();
		qry.append(" SELECT * FROM big_tradingdetail WHERE trad_refnum = ? ORDER BY trad_num ASC ");
		String sql = qry.toString();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs =null;
		

		List<TradingDetailVO> list = new ArrayList<>();
		
		try{
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, tra_num);
			
			
			rs =stmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(1);
				TradingDetailVO vo = new TradingDetailVO();
				vo.setTrad_num(rs.getInt("trad_num"));
				vo.setTrad_refnum(rs.getInt("trad_refnum"));
				vo.setTrad_tradingDate(rs.getDate("trad_tradingDate"));
				vo.setTrad_subject(rs.getString("trad_subject"));
				vo.setTrad_standard(rs.getString("trad_standard"));
				vo.setTrad_quantity(rs.getInt("trad_quantity"));
				vo.setTrad_unitPrice(rs.getInt("trad_unitPrice"));
				vo.setTrad_supplyPrice(rs.getInt("trad_supplyPrice"));
				vo.setTrad_taxAmount(rs.getInt("trad_taxAmount"));
				vo.setTrad_ect(rs.getString("trad_ect"));
				System.out.println(2);
				
				list.add(vo);
			}
			
		} catch (Exception e){
			
		} finally {
			DBUtil.setClose(rs, stmt, conn);
		}
		return list;
		
	}

	public void delete(int trad_refnum) {
		StringBuffer qry = new StringBuffer();
		qry.append(" DELETE FROM big_tradingdetail ");
		qry.append(" WHERE trad_refnum = ? ");
		String sql = qry.toString();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try{
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, trad_refnum);
	
			
			stmt.executeUpdate();
			
			
			
		} catch (Exception e){
			
		} finally {
			DBUtil.setClose(null, stmt, conn);
		}
	}
}
