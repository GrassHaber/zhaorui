
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕业生个人信息提交</title>
</head>
<body>
   <%
      request.setCharacterEncoding("utf8");
      String number = request.getParameter("number");
      String sex = request.getParameter("sex");
      String major = request.getParameter("major");
      String grad_time = request.getParameter("grad_time");
      String phone = request.getParameter("phone");
      String qq = request.getParameter("qq");
      String email = request.getParameter("email");
      Connection conn = msb.OpenConn();
      String sql = "update student set sex='"+sex+"',major='"+major+"',grad_year='"+grad_time+"',phone='"+phone+"',QQ='"+qq+"',email='"+email+"' where number='"+number+"'";
          
      PreparedStatement p = conn.prepareStatement(sql);
      int count = p.executeUpdate();
      if(count > 0){
    	  out.print("<script>alert('提交成功！');location.href='stuinformation.jsp';</script>");
      }
      p.close();
      conn.close();
   %>
</body>
</html>