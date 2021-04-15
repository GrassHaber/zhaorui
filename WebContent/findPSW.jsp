<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login.css">
<title>找回密码</title>
<%
      request.setCharacterEncoding("utf8");
      String usr = (String)session.getAttribute("username");
      String encry = null;
      Connection conn = msb.OpenConn();
      String sql = "select * from student where username='"+usr+"'";
      PreparedStatement p = conn.prepareStatement(sql);
      ResultSet rs = p.executeQuery();
      if(rs.next()){
    	  encry = rs.getString("encrypted");
      }
      else{
    	  out.print("<script>alert('该用户名不存在！');<a href='javascript:history.back(-1)'></a>;</script>");
      }
%>      
</head>
<body>
    <div class="registe"> 
    <h2>找回密码</h2>
        <h3>&nbsp;</h3>
    <form action="do_valiPwd.jsp" method="post">
    <div class="registe-main">
    <p>密保问题：<input type="text" name="encrypted" value="<%=encry %>" readonly="readonly"/></p>
    <p class="answer">请填写您设置的密保问题答案：<input type="text" name="answer" /></p>
    </div>
    <p>&nbsp;</p>
    <p><input type="submit" value="点击验证"/></p>
    </form>
    </div>
</body>
<%
     msb.close(conn, p, rs);   
%>
</html>