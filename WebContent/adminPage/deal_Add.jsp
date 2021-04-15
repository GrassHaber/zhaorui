<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员账户添加处理</title>
</head>
<body>
    <%
    request.setCharacterEncoding("utf8");
	String usr = request.getParameter("usr");
    String role = request.getParameter("role");
	String usr_name = request.getParameter("usr_name");
	String phone = request.getParameter("phone");
	String pwd = request.getParameter("pwd");
	Connection conn = msb.OpenConn();
	String sql_1 = "select * from user where usr='"+usr+"'";
	PreparedStatement p1 = conn.prepareStatement(sql_1);
	ResultSet rs = p1.executeQuery();
	if(rs.next()){
		out.print("该用户名已存在！");
	}
	else{
		String sql_2 = "insert into user(usr,pwd,role,usr_name,phone) values(?,?,?,?,?)";
		PreparedStatement p2 = conn.prepareStatement(sql_2);
		p2.setString(1, usr);
		p2.setString(2, pwd);
		p2.setString(3, role);
		p2.setString(4, usr_name);
		p2.setString(5, phone);
		int count = p2.executeUpdate();
		if(count > 0){
			out.println("<script>alert('添加成功！');location.href='admin.jsp';</script>");
		}
		else{
			out.print("<script>alert('添加失败！请重新输入！');location.href='admin_Add.jsp';</script>");
		}
		p2.close();
	}
	msb.close(conn, p1, rs);
%>  
</body>
</html>