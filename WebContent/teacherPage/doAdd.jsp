<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理学籍信息添加</title>
</head>
<body>
   <%
     request.setCharacterEncoding("utf8");
     String name = request.getParameter("name");
     String number = request.getParameter("number");
     String stunumber = request.getParameter("stunumber");
     String xueyuan = request.getParameter("xueyuan");
     String stuclass = request.getParameter("class");
     Connection conn = msb.OpenConn();
     String sql_2 = "select * from student where number=?";
     PreparedStatement p2 = conn.prepareStatement(sql_2);
     p2.setString(1, number);
     ResultSet rs = p2.executeQuery();
     if(rs.next()){
    	 out.print("<script>alert('该身份信息已存在！');location.href='add_stu.jsp';</script>");
     }
     
     else{
    	 String sql_1 = "insert into student(name,number,stunumber,xueyuan,class,username,password,major,sex,grad_year,phone,QQ,email) values ('"+name+"','"+number+"','"+stunumber+"','"+xueyuan+"','"+stuclass+"','','','','','','','','')";
         PreparedStatement p1 = conn.prepareStatement(sql_1);
         int count = p1.executeUpdate();
         if(count > 0){
        	 out.print("<script>alert('添加成功！');location.href='add_stu.jsp';</script>");
         }
         p1.close();
     }
     
     msb.close(conn, p2, rs);
     
   %>
   
</body>
</html>