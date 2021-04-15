<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学籍验证页面</title>
</head>
<body>
   <%
      request.setCharacterEncoding("utf8");
      String name = request.getParameter("name");
      String number = request.getParameter("number");
      session.setAttribute("name", name);
      session.setAttribute("number", number);
      Connection conn = msb.OpenConn();
      String sql = "select * from student where name=? and number=?";
      PreparedStatement p = conn.prepareStatement(sql);
      p.setString(1, name);
      p.setString(2, number);
      ResultSet rs = p.executeQuery();
      if(rs.next()){
    	  if(rs.getString("username").equals("")){
    		  response.sendRedirect("stu_registe_2.jsp");
    	  }
    	  else{
    		  out.print("<script>alert('该学籍用户已存在！');location.href='stu_registe_1.jsp';</script>");
    	  }
      }
      else{
    	  out.print("<script>alert('学籍验证失败！');location.href='stu_registe_1.jsp';</script>");
      }
      msb.close(conn, p, rs);
   %>
</body>
</html>