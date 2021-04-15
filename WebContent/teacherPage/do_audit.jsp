<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设置审核状态</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf8");
    int id = Integer.parseInt(request.getParameter("id"));
	String audit = request.getParameter("audit");
	Connection conn = msb.OpenConn();
	String sql = "update three set audit='"+audit+"' where student_id='"+id+"'";
	PreparedStatement p = conn.prepareStatement(sql);
	int count = p.executeUpdate();
	while(count > 0){
		out.println("<script>alert('设置成功！');location.href='three_show.jsp';</script>");
	}
	p.close();
	conn.close();
%>
</body>
</html>