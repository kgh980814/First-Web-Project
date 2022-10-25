package mapper;

import java.sql.*;
import java.util.*;

import common.DBUtil;
import model.CommentVO;

public class CommentMapper {

	public void create(CommentVO vo) {
			
		StringBuffer qry = new StringBuffer();
		qry.append(" INSERT INTO big_comment (com_num, com_refnum, com_content,  ");
		qry.append(" com_mb_id, com_mb_name, com_inputdate) ");
		qry.append(" VALUES (null, ?, ?, ?, ?, now()) ");
		String sql = qry.toString();
	
		Connection conn = null;
		PreparedStatement stmt = null;
	
		try{
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, vo.getCom_refnum());
			stmt.setString(2, vo.getCom_content());
			stmt.setString(3, vo.getCom_mb_id());
			stmt.setString(4, vo.getCom_mb_name());
	
			stmt.executeUpdate();
			
		} catch (Exception e){
			
		} finally {
			DBUtil.setClose(null, stmt, conn);
		}
	}//public void create(CommentVO vo)
	
	public List<CommentVO> read(int bo_num){
		String sql = " SELECT * FROM big_comment WHERE com_refnum = ? ORDER BY com_num ASC ";
		List<CommentVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try{
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, bo_num);	
			rs = stmt.executeQuery();
				
			while(rs.next()){
				CommentVO comment = new CommentVO();
				comment.setCom_num(rs.getInt("com_num"));
				comment.setCom_content(rs.getString("com_content"));
				comment.setCom_mb_id(rs.getString("com_mb_id"));
				comment.setCom_mb_name(rs.getString("com_mb_name"));
				comment.setCom_inputdate(rs.getDate("com_inputdate"));
				list.add(comment);
			}
		} catch(Exception e){
			
		} finally {
			DBUtil.setClose(rs, stmt, conn);
		}
		
		return list;
		
	}//public List<CommentVO> read(int bo_num)
	
}//public class CommentMapper
