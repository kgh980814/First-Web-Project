package mapper;

import java.sql.*;
import java.util.*;

import common.DBUtil;
import model.MemberVO;

/**
 * 회원테이블관련 SQL
 * @author BigData00
 *
 */
public class MemberMapper {

	
	public void create(MemberVO vo) {
		
		//JDBC 프로그래밍


		StringBuffer qry = new StringBuffer();
		qry.append(" INSERT INTO big_member (mb_id, mb_pw, mb_name, mb_email,  ");
		qry.append(" mb_zipcode, mb_addr, mb_detailAddr, mb_phone, mb_birth, mb_gender, mb_joindate) ");
		qry.append(" VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()) ");

		String sql = qry.toString();

		int idx = 1;
		Connection conn = null;
		PreparedStatement stmt = null;
		

		try{
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			//?에 값넣기
			stmt.setString(idx++, vo.getMb_id());
			stmt.setString(idx++, vo.getMb_pw());
			stmt.setString(idx++, vo.getMb_name());
			stmt.setString(idx++, vo.getMb_email());
			stmt.setString(idx++, vo.getMb_zipcode());
			stmt.setString(idx++, vo.getMb_addr());
			stmt.setString(idx++, vo.getMb_detailAddr());
			stmt.setString(idx++, vo.getMb_phone());
			stmt.setString(idx++, vo.getMb_birth());
			stmt.setString(idx++, vo.getMb_gender());
			//실행
			int res = stmt.executeUpdate();
			
			if(res > 0){
				
			}
			
		} catch (Exception e){
			e.getLocalizedMessage();
		} finally {
			DBUtil.seClose(null, stmt, conn);
		}
	}

	public List<MemberVO> read(){
		
		StringBuffer qry = new StringBuffer();
		qry.append(" SELECT * FROM big_member WHERE mb_out = 'N' ORDER BY mb_joindate DESC ");
		String sql = qry.toString();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		List<MemberVO> list = new ArrayList<>();
		try{
			
			conn = DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			while(rs.next()){
				MemberVO member = new MemberVO();

				member.setMb_id(rs.getString("mb_id"));
				member.setMb_name(rs.getString("mb_name"));
				member.setMb_email(rs.getString("mb_email"));
				member.setMb_phone(rs.getString("mb_phone"));
				member.setMb_birth(rs.getString("mb_birth"));
				member.setMb_gender(rs.getString("mb_gender"));
				member.setMb_joindate(rs.getDate("mb_joindate"));
				
				list.add(member);
			}
		} catch (Exception e){
			
		} finally {
			DBUtil.seClose(null, stmt, conn);
		}
		
		return list;		
	}

	public List<MemberVO> readOut(String keyword){

		
		StringBuffer qry = new StringBuffer();
		qry.append(" SELECT * FROM big_member WHERE NOT mb_out = 'N' ");
		
		 if(keyword != null || "".equals(keyword)){ 
			 qry.append(" AND ( mb_name LIKE ? OR mb_email LIKE ? OR mb_phone LIKE ? OR mb_birth LIKE ? ) "); 
		 }
		
		qry.append(" ORDER BY mb_joindate DESC ");
		String sql = qry.toString();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		List<MemberVO> list = new ArrayList<>();
		try{
			
			conn =DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			
			
			if(keyword != null || "".equals(keyword)){ 
				stmt.setString(1, "%"+keyword+"%"); 
				stmt.setString(2, "%"+keyword+"%"); 
				stmt.setString(3, "%"+keyword+"%"); 
				stmt.setString(4, "%"+keyword+"%"); 
			}
			
			
			rs = stmt.executeQuery();
			while(rs.next()){
				MemberVO member = new MemberVO();

				member.setMb_id(rs.getString("mb_id"));
				member.setMb_name(rs.getString("mb_name"));
				member.setMb_email(rs.getString("mb_email"));
				member.setMb_phone(rs.getString("mb_phone"));
				member.setMb_birth(rs.getString("mb_birth"));
				member.setMb_gender(rs.getString("mb_gender"));
				member.setMb_joindate(rs.getDate("mb_joindate"));
				
				list.add(member);
			}
		} catch (Exception e){
			
		} finally {
			DBUtil.seClose(null, stmt, conn);
		}
		return list;		
	}
	/*
	 * 회원정보 가지고오기
	 */
	public MemberVO read(String mb_id){
		
		DBUtil.getConnection();//다른 클래스의 DB와 연결할때 
		


		StringBuffer qry = new StringBuffer();
		qry.append(" SELECT * FROM big_member WHERE mb_id = ? ");
		
		
		qry.append(" ORDER BY mb_joindate DESC ");
		String sql = qry.toString();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		MemberVO member= null;
		try{
			conn =DBUtil.getConnection();
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, mb_id);
			
			rs = stmt.executeQuery();
			if(rs.next()){
				member = new MemberVO();

				member.setMb_id(rs.getString("mb_id"));
				member.setMb_name(rs.getString("mb_name"));
				member.setMb_email(rs.getString("mb_email"));
				member.setMb_phone(rs.getString("mb_phone"));
				member.setMb_birth(rs.getString("mb_birth"));
				member.setMb_gender(rs.getString("mb_gender"));
				member.setMb_joindate(rs.getDate("mb_joindate"));
				

			}
		} catch (Exception e){
			
		} finally {
			DBUtil.seClose(null, stmt, conn);
		}
		return member;		
	}
}
