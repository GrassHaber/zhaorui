<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕业离校后就业情况提交</title>
</head>
<body>
   <%
      String isWork = request.getParameter("isWork");
      String way = request.getParameter("way");
      String region = request.getParameter("region");
      String salary = request.getParameter("salary");
      String industry = request.getParameter("industry");
      String satis = request.getParameter("satisfaction");
      String self = request.getParameter("relevance_self");
      String major = request.getParameter("relevance_major");
      Connection conn = msb.OpenConn();
      String sql_1 = "select * from outschool where student_id='"+session.getAttribute("id")+"'";
      PreparedStatement p1 = conn.prepareStatement(sql_1);
      ResultSet rs = p1.executeQuery();
      if(rs.next()){
	    	  out.print("<script>alert('您已经提交过了！');location.href='students.jsp';</script>");
	  }
      else{
	      String sql = "insert into outschool(isWork,way,region,salary,industry,satisfaction,relevance_self,relevance_major,student_id) values('"+isWork+"','"+way+"','"+region+"','"+salary+"','"+industry+"','"+satis+"','"+self+"','"+major+"','"+session.getAttribute("id")+"')";
	      PreparedStatement p = conn.prepareStatement(sql);
	      int count = p.executeUpdate();
	      if(count > 0){
	    	  out.print("<script>alert('提交成功！');location.href='students.jsp';</script>");
	      }
	      p.close();
	      
      }
      msb.close(conn, p1, rs);
   %>
</body>
</html>