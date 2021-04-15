<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户信息更新</title>
</head>
<%
	request.setCharacterEncoding("utf8");
    int id = Integer.parseInt(request.getParameter("id"));
	String usr = request.getParameter("usr");
	String usr_name = request.getParameter("usr_name");
	String phone = request.getParameter("phone");
	Connection conn = msb.OpenConn();
	String sql = "update user set usr_name=?,phone=? where id='"+id+"'";
	PreparedStatement p = conn.prepareStatement(sql);
	p.setString(1, usr_name);
	p.setString(2, phone);
	int count = p.executeUpdate();
	if(count > 0){
		out.print("<script>alert('修改成功！');location.href='account_set.jsp';</script>");		
	}
	p.close();
	conn.close();
%>
<body>
			
</body>
</html>