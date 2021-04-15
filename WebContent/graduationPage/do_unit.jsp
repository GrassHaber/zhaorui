<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>就业单位信息提交</title>
</head>
<body>
   <%
      request.setCharacterEncoding("utf8");
      String name = request.getParameter("name");
      String address = request.getParameter("address");
      String person = request.getParameter("person");
      String phone = request.getParameter("phone");
      String email = request.getParameter("email");
      String style = request.getParameter("style");
      Connection conn = msb.OpenConn();
      String sql_1 = "select * from unit where student_id='"+session.getAttribute("id")+"'";
      PreparedStatement p1 = conn.prepareStatement(sql_1);
      ResultSet rs = p1.executeQuery();
      if(rs.next()){
      	  String sql_2 = "update unit set name='"+name+"',address='"+address+"',person='"+person+"',phone='"+phone+"',email='"+email+"',style='"+style+"' where student_id='"+session.getAttribute("id")+"'";
      	  PreparedStatement p2 = conn.prepareStatement(sql_2);
      	  int count = p2.executeUpdate();
      	  while(count > 0){
      	      out.print("<script>alert('更新成功！');location.href='students.jsp';</script>");
          }
      	  p2.close();
      }
      else{
    	  String sql_3 = "insert into unit(name,address,person,phone,email,style,student_id) values('"+name+"','"+address+"','"+person+"','"+phone+"','"+email+"','"+style+"','"+session.getAttribute("id")+"')";
    	  PreparedStatement p3 = conn.prepareStatement(sql_3);
    	  int count_1 = p3.executeUpdate();
      	  while(count_1 > 0){
      	      out.print("<script>alert('提交成功！');location.href='students.jsp';</script>");
          }
      	  p3.close();
      }
      msb.close(conn, p1, rs);
   %>
</body>
</html>