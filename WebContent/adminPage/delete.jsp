<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除管理员帐号</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	if(id==1){
		out.println("<script>alert('该用户不能删除！');location.href='ShowAll.jsp';</script>");	
	}
	else{
		Connection conn = msb.OpenConn();
		String sql = "delete from user where id='"+id+"'";
		PreparedStatement p = conn.prepareStatement(sql);
		int count = p.executeUpdate();
		if(count > 0){
			out.println("<script>alert('删除成功！');location.href='ShowAll.jsp';</script>");
		}
		else{
			out.println("<script>alert('该用户id不存在！');location.href='ShowAll.jsp';</script>");
		}
		p.close();
		conn.close();
	}
	
%>
</body>
</html>