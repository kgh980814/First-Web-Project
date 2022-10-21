package mapper;

import java.sql.*;

import model.MemberVO;

public class LoginMapper {

	public MemberVO read(MemberVO vo) {
		
		String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
		String user = "root"; 
		String password = "bigdata";

		StringBuffer qry = new StringBuffer();
		qry.append(" SELECT * FROM big_member WHERE mb_out = 'N' AND mb_id = ? AND mb_pw = ? ");
		String sql = qry.toString();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		MemberVO member = null;

		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, vo.getMb_id());
			stmt.setString(2, vo.getMb_pw());
			rs = stmt.executeQuery();
			
			if(rs.next()){
				//세션변수 생성 아이디, 이름
				member = new MemberVO();
				member.setMb_id(rs.getString("mb_id"));
				member.setMb_name(rs.getString("mb_name"));
				
			}
		} catch(Exception e) {
			
		} finally {
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				
			} 
		}

	
		return member;
		
	}
}
