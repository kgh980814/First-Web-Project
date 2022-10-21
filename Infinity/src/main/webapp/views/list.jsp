<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
String user = "root"; 
String password = "bigdata";

int pageRow= 20;
int p = 1;
String param = request.getParameter("p");
if(!(param == null || "".equals(param))){
	p= Integer.parseInt(param);
}
StringBuffer qry = new StringBuffer();
qry.append(" SELECT * FROM big_board ORDER BY bo_num DESC LIMIT "+ ((p-1) * pageRow) + "," + pageRow);
String sql = qry.toString();//sql을 문자열로

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;

List<HashMap<String,String>> list = new ArrayList<>();
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	
	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	while(rs.next()){
		HashMap<String, String> hm =new HashMap<>();
		hm.put("bo_num",rs.getString("bo_num"));
		hm.put("bo_category",rs.getString("bo_category"));
		hm.put("bo_title",rs.getString("bo_title"));
		hm.put("bo_content",rs.getString("bo_content"));
		hm.put("bo_mb_id",rs.getString("bo_mb_id"));
		hm.put("bo_mb_name",rs.getString("bo_mb_name"));
		hm.put("bo_hit",rs.getString("bo_hit"));
		hm.put("bo_inputdate",rs.getString("bo_inputdate"));
		hm.put("bo_ip",rs.getString("bo_ip"));
		
		list.add(hm);
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
//총 글목록 수
sql =" SELECT COUNT(*) as cnt FROM big_board";
int total= 0;
try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	
	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	
	while(rs.next()){
	total =rs.getInt("CNT");
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
<%
int totalPage=0;
if(total % pageRow == 0){
	totalPage = total/pageRow;
}else{
	totalPage = (total/pageRow)+1;
}
%>
 <style>
 .wrap {
 padding-bottom:1.5rem;
 }
 </style>
  <div class="wrap">
	<section class="app-content">
		<div class="row">
				<div class="col-md-12">
				<%=p%>/<%=totalPage%>
					<div class="mail-toolbar m-b-lg pull-right">
					
						<div class="btn-group"  id="btn_group"role="group">
							<a href="list.jsp?p=1" class="btn btn-default <%=(p == 1)?"disabled":"" %>"><i class="fa fa-backward"></i></a>
							<a href="list.jsp?p=<%=p-1 %>" class="btn btn-default <%=(p == 1)?"disabled":"" %>"><i class="fa fa-chevron-left"></i></a>
							<a href="list.jsp?p=<%=p+1%>" class="btn btn-default <%=(p == totalPage)?"disabled":"" %>"><i class="fa fa-chevron-right"></i></a>
							<a href="list.jsp?p=<%=totalPage %>" class="btn btn-default <%=(p == totalPage)?"disabled":"" %>"><i class="fa fa-forward"></i></a>
						</div>								
					
						<div class="btn-group " role="group">
							<a href="write.jsp" class="btn btn-default">글쓰기</a>
						</div>


					</div>
				</div>
		</div>
			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">게시판</h4>
					<p class="m-b-lg docs">
					</p>
					<div class="table-responsive">
						<table class="table">
<%
boolean dataChk = false;
int rowNum =total-((p-1)*pageRow);
Iterator<HashMap<String,String>> it = list.iterator();
while(it.hasNext()){
	HashMap<String,String> data = it.next();
%>
							<tr>
								<td><%=rowNum--%>.<a href="view.jsp?bo_num=<%=data.get("bo_num") %>"><%=data.get("bo_title") %></a></td>
								<td align="right"><%=data.get("bo_inputdate") %></td>
							</tr>
<%
dataChk=true;
}
%>
<%
if(!dataChk){
%>
							<tr>
								<td colspan="2">등록된 글이 없습니다.</td>
							</tr>
<%
}
%>
						</table>
					</div>
				</div><!-- .widget -->
			</div><!-- END column -->
<!-- END .gallery -->
	</section><!-- #dash-content -->
</div><!-- .wrap -->
<script>

	
</script>
<%@ include file="includes/footer.jsp"%>