<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
String user = "root"; 
String password = "bigdata";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT * FROM big_board WHERE bo_num = ? ");
String sql = qry.toString();

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;

HashMap<String,String> view =new HashMap<>();
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	
	stmt =con.prepareStatement(sql);
	stmt.setInt(1,Integer.parseInt(request.getParameter("bo_num")));
	rs = stmt.executeQuery();
	
	if(rs.next()){
		view.put("bo_num",rs.getString("bo_num"));
		view.put("bo_category",rs.getString("bo_category"));
		view.put("bo_title",rs.getString("bo_title"));
		view.put("bo_content",rs.getString("bo_content"));
		view.put("bo_mb_id",rs.getString("bo_mb_id"));
		view.put("bo_mb_name",rs.getString("bo_mb_name"));
		view.put("bo_hit",rs.getString("bo_hit"));
		view.put("bo_inputdate",rs.getString("bo_inputdate"));
		view.put("bo_ip",rs.getString("bo_ip"));
		
	}
}catch(Exception e){
	
}finally{
	try{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	} catch(Exception e) {
		
	} 
}
%>
<%@ include file="includes/header.jsp"%>

    <div class="wrap">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">글 상세보기</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
							<!-- 설명 -->
							</small>
						</div>
						<form class="form-horizontal" >
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">제목:</label>
								<div class="col-sm-10">
							<%=view.get("bo_title")%>
								</div>
							</div>
						<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">작성자:</label>
								<div class="col-sm-10">
							<%=view.get("bo_mb_name")%>
								</div>
							</div>
							<div class="form-group">
								<label for="textarea1" class="col-sm-2 control-label">내용:</label>
								<div class="col-sm-10">
							<%=view.get("bo_content").replace("\r\n", "<br>")%>
								</div>
							</div>
								<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-2 control-label">작성일:</label>
								<div class="col-sm-10">
							<%=view.get("bo_inputdate")%>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 col-sm-offset-8">
								<%
								if(sess_id.equals(view.get("bo_mb_id"))){
								%>
									<a href="modify.jsp?bo_num=<%=view.get("bo_num")%>" class="btn btn-success">글수정</a>
									<a href="javascript:void(0);" class="btn btn-success" onclick="del()">글삭제</a>
									<%
									}
									%>
									<a href="List" class="btn btn-success">글목록</a>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
<form id="sendfrm" method="post" action="deleteAct.jsp">
<input type ="hidden" name="bo_num" value="<%=view.get("bo_num") %>">
</form>
<script>
function del(){
	if(confirm("정말로 삭제 하시겠습니까?")){
		document.getElementById('sendfrm').submit();
	}
	console.log("삭제 버튼이 눌렸네요.");
}
</script>			
		
<%@ include file="includes/footer.jsp"%>