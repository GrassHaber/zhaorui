<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改毕业生学籍信息</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf8");
	String name = request.getParameter("name");
	String number = request.getParameter("number");
	String xueyuan = request.getParameter("xueyuan");
	String stunumber = request.getParameter("stunumber");
	String cla = request.getParameter("class");
	Connection conn = msb.OpenConn();
	String sql = "update student set name='"+name+"',number='"+number+"',xueyuan='"+xueyuan+"',stunumber='"+stunumber+"',class='"+cla+"' where id='"+session.getAttribute("student_id")+"'";
	PreparedStatement p = conn.prepareStatement(sql);
	int count = p.executeUpdate();
	if(count > 0){
		out.print("<script>alert('修改成功！');location.href='stu_change.jsp';</script>");
	}
	conn.close();
	p.close();
%>
</body>
</html>