<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html >
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理注册信息</title>
</head>
<body>
   <%
      request.setCharacterEncoding("utf8");
      String name = request.getParameter("name");
      String number = request.getParameter("number");
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String encrypted = request.getParameter("encrypted");
      String answer = request.getParameter("answer");
      session.setAttribute("username", username);
      Connection conn = msb.OpenConn();
      String sql = "update student set username='"+username+"',password='"+password+"',encrypted='"+encrypted+"',answer='"+answer+"' where number='"+number+"'";
      PreparedStatement p = conn.prepareStatement(sql);
      int count = p.executeUpdate();
      if(count > 0){
    	  response.sendRedirect("students.jsp");
      }
      p.close();
      conn.close();
   %>
</body>
</html>