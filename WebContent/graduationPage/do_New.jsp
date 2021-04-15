<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>
   <%
      String psw = request.getParameter("password");
      Connection conn = msb.OpenConn();
      String sql = "update student set password='"+psw+"' where username='"+session.getAttribute("username")+"'";
      PreparedStatement p = conn.prepareStatement(sql);
      int count = p.executeUpdate();
      if(count > 0){
    	  out.print("<script>alert('密码修改成功！返回登录页！');location.href='../home.jsp';</script>");
      }
      p.close();
      conn.close();
   %>
</body>
</html>