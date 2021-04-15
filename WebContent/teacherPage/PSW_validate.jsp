<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>原密码验证</title>
</head>
<body>
	<%
	    request.setCharacterEncoding("utf8");
		String pwd = request.getParameter("pwd");
		String usr = (String)session.getAttribute("username");
		Connection conn = msb.OpenConn();
		String sql = "select * from user where usr='"+usr+"' and pwd='"+pwd+"'";
	    PreparedStatement p = conn.prepareStatement(sql);
	    ResultSet rs = p.executeQuery();
	    if(rs.next()){
	    	response.sendRedirect("newPSW.jsp");
	    }
	    else{
	    	out.print("<script>alert('原密码输入有误！请重新输入！');location.href='changePSW.jsp';</script>");
	    }
	    msb.close(conn, p, rs);
	%>
</body>
</html>