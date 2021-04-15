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
	String usr = request.getParameter("usr");
	String usr_name = request.getParameter("usr_name");
	String phone = request.getParameter("phone");
	Connection conn = msb.OpenConn();
	String sql = "update user set usr=?,usr_name=?,phone=? where id='"+session.getAttribute("id")+"'";
	PreparedStatement p = conn.prepareStatement(sql);
	p.setString(1, usr);
	p.setString(2, usr_name);
	p.setString(3, phone);
	int count = p.executeUpdate();
	if(count > 0){
		out.print("<script>alert('修改成功！');location.href='admin_id.jsp';</script>");		
	}
	p.close();
	conn.close();
%>
<body>
			
</body>
</html>