<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<jsp:useBean id="MySqlBean" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<html>
<head>
<title>登录验证</title>
</head>
<body>
     
	 <%   
	 //验证登录  
	 String usr=request.getParameter("username"); 
     String pwd=request.getParameter("password");
     String role = request.getParameter("role");
     session.setAttribute("username", usr);
     Connection conn = MySqlBean.OpenConn();
     if(role.equals("student")){
    	 String sql = "select * from student where username=? and password=?";
    	 PreparedStatement p = conn.prepareStatement(sql);
    	 p.setString(1,usr);
    	 p.setString(2,pwd);
    	 ResultSet rs = p.executeQuery();
    	 if(rs.next()){
    		 session.setAttribute("id", rs.getString("id"));
    		 response.sendRedirect("graduationPage/students.jsp");
    	 }
    	 else{
    		 out.print("<script>alert('登录错误，请重新登录！');location.href='home.jsp';</script>");
    	 }
    	 MySqlBean.close(conn,p, rs);
     }
     else{
    	 String sql = "select * from user where usr=? and pwd=?";
    	 PreparedStatement p = conn.prepareStatement(sql);
         p.setString(1, usr);
         p.setString(2, pwd);
         ResultSet rs = p.executeQuery();
         if(rs.next()){
      	   if(rs.getString("role").equals(role)){
      		   if(role.equals("teacher")){
      			   response.sendRedirect("teacherPage/teachers.jsp");
      		   }
      		   else{
      			   response.sendRedirect("adminPage/admin.jsp");
      		   }
      	   }
      	   else{
          	   out.print("<script>alert('登录错误，请重新登录！');location.href='home.jsp';</script>");
             }
         }
         else{
      	   out.print("<script>alert('登录错误，请重新登录！');location.href='home.jsp';</script>");
         }
         MySqlBean.close(conn, p, rs);
     }
     
     %>  
</body>
</html>