<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,com.jspsmart.upload.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>三方协议信息提交</title>
</head>
<body>
   <%
   
      int id = Integer.parseInt(session.getAttribute("id").toString());
      String root = request.getSession().getServletContext().getRealPath("/");
      String savePath = root + "three_images\\";
      SmartUpload upload = new SmartUpload();
      upload.initialize(this.getServletConfig(), request, response);
	  upload.upload();
	  upload.save(savePath);
	  Files f = upload.getFiles();
	  File fil = f.getFile(0); 
	  String ext = fil.getFileExt();
	  String filename = fil.getFileName();
	  if (!(ext.equals("jpg")) && !(ext.equals("gif")) && !(ext.equals("bmp")) && !(ext.equals("png")) && !(ext.equals("JPG")) && !(ext.equals("GIF")) && !(ext.equals("BMP")) && !(ext.equals("PNG"))) {
		 out.println("<script type='text/javascript'>alert('文件类型错误');location.replace('edit_three.jsp');</script>");
	  return;
	  }
	  
	  com.jspsmart.upload.Request req = upload.getRequest();
      String number = req.getParameter("number");
      String name = req.getParameter("name");
      String address = req.getParameter("address");
      String person = req.getParameter("person");
      String phone = req.getParameter("phone");
      String email = req.getParameter("email");
      String style = req.getParameter("style");
      String audit = "审核中";
      Connection conn = msb.OpenConn();
      String sql_1 = "select * from three where student_id='"+id+"'";
      PreparedStatement p1 = conn.prepareStatement(sql_1);
      ResultSet rs = p1.executeQuery();
      if(rs.next()){
      	  String sql_2 = "update three set number=?,name=?,address=?,person=?,phone=?,email=?,style=?,picture=?,audit=?  where student_id='"+id+"'";
      	  PreparedStatement p2 = conn.prepareStatement(sql_2);
      	  p2.setString(1, number);
      	  p2.setString(2, name);
      	  p2.setString(3, address);
      	  p2.setString(4, person);
      	  p2.setString(5, phone);
      	  p2.setString(6, email);
      	  p2.setString(7, style);
      	  p2.setString(8, filename);
      	  p2.setString(9, audit);
      	  int count = p2.executeUpdate();
      	  while(count > 0){
      	      out.print("<script>alert('更新成功！');location.href='students.jsp';</script>");
          }
      	  p2.close();
      }
      else{
    	  String sql_3 = "insert into three(number,name,address,person,phone,email,style,picture,audit,student_id) values(?,?,?,?,?,?,?,?,?,?)";
    	  PreparedStatement p3 = conn.prepareStatement(sql_3);
    	  p3.setString(1, number);
      	  p3.setString(2, name);
      	  p3.setString(3, address);
      	  p3.setString(4, person);
      	  p3.setString(5, phone);
      	  p3.setString(6, email);
      	  p3.setString(7, style);
      	  p3.setString(8, filename);
      	  p3.setString(9, audit);
      	  p3.setInt(10, id);
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