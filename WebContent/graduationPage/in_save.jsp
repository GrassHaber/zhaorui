<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在校就业意向情况提交</title>
</head>
<body>
   <%
   	  request.setCharacterEncoding("utf8");
      String intention = request.getParameter("intention");
      String fbg = request.getParameter("fbg");
      String isSelfMajor = request.getParameter("isSelfMajor");
      String isKnow = request.getParameter("isKnow");
      String hregion = request.getParameter("hregion");
      String hsalary = request.getParameter("hsalary");
      Connection conn = msb.OpenConn();
      String sql_1 = "select * from inschool where student_id='"+session.getAttribute("id")+"'";
      PreparedStatement p1 = conn.prepareStatement(sql_1);
      ResultSet rs = p1.executeQuery();
      if(rs.next()){
    	      String sql_2 = "update inschool set intention='"+intention+"',familybackground='"+fbg+"',isSelfMajor='"+isSelfMajor+"',isKnow='"+isKnow+"',hopeRegion='"+hregion+"',hopeSalary='"+hsalary+"' where student_id='"+session.getAttribute("id")+"'";
    	      PreparedStatement p2 = conn.prepareStatement(sql_2);
    	      int count = p2.executeUpdate();
    	      while(count > 0){
	    	  out.print("<script>alert('更新成功！');location.href='students.jsp';</script>");
    	      }
    	      p2.close();
      }
      else{
    	  String sql = "insert into inschool(intention,familybackground,isSelfMajor,isKnow,hopeRegion,hopeSalary,student_id) values('"+intention+"','"+fbg+"','"+isSelfMajor+"','"+isKnow+"','"+hregion+"','"+hsalary+"','"+session.getAttribute("id")+"')";
    	  PreparedStatement p = conn.prepareStatement(sql);
    	  int count = p.executeUpdate();
    	  while(count > 0){
    		  out.print("<script>alert('提交成功！');location.href='students.jsp';</script>");
    	  }
    	  p.close();
      }
      msb.close(conn, p1, rs);
   %>
</body>
</html>