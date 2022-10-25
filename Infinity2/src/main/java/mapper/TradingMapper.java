package mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBUtil;
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
}
