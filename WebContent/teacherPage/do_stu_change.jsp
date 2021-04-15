<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改毕业生学籍信息</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/menu.js"></script>
</head>

<body>
<div class="top"></div>
<div id="header">
	<div class="logo">桂林电子科技大学就业跟踪管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="account_set.jsp"><%=session.getAttribute("username") %></a></li>
			<li><a href="../home.jsp">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
				<ul id="nav_dot">
      
        <li>
          <h4   class="M10"><span></span>个人信息</h4>
          <div class="list-item none">
            <a href='account_set.jsp'>编辑个人信息</a>
            <a href='changePSW.jsp'>修改密码</a>
            
          </div>
        </li>
        
				<li>
          <h4 class="M5"><span></span>毕业生信息</h4>
          <div class="list-item none">
            <a href='add_stu.jsp'>添加毕业生学籍信息</a>
            <a href='student_Query.jsp'>查看毕业生信息</a>
            <a href='stu_change.jsp'>修改毕业生学籍信息</a>
            <a href='inSchool_show.jsp'>查看毕业生毕前就业意向</a>
            <a href='three_show.jsp'>查看毕业生三方协议信息</a>
            <a href='outSchool_show.jsp'>查看毕业生就业单位信息</a>
          </div>
        </li>
				<li>
          <h4  class="M6"><span></span>数据统计</h4>
          <div class="list-item none">
            <a href='iswork_show.jsp'>毕业生毕业去向</a>
            <a href='salary_show.jsp'>毕业生薪资</a>
            <a href='satisfaction.jsp'>毕业生就业满意度</a>
          </div>
        </li>
				
				
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="teachers.jsp">就业中心管理员首页</a></li>
								<li>></li>
								<li><a href="#">毕业生信息 : 修改毕业生学籍信息</a></li>
						</ul>
			</div>
			<div class="main">
<%
    int id = Integer.parseInt(request.getParameter("student_id"));
    session.setAttribute("student_id", id);
	Connection conn = msb.OpenConn();
	PreparedStatement p = conn.prepareStatement("select * from student where id='"+id+"'");
	String name = null;
	String number = null;
	String xueyuan = null;
	String stunumber = null;
	String cla = null;
	ResultSet rs = p.executeQuery();
	if(rs.next()){
		name = rs.getString("name");
		number = rs.getString("number");
		xueyuan = rs.getString("xueyuan");
		stunumber = rs.getString("stunumber");
		cla = rs.getString("class");
		
	}
	else{
		out.print("<script>alert('未找到此ID的数据，请重新输入！');location.href='stu_change.jsp';</script>");
	}
	msb.close(conn, p, rs);
%>			
	<form action="stu_update.jsp" method="post">
   
     <h2>&nbsp;修改毕业生学籍信息</h2>
     <p>&nbsp;&nbsp;毕&nbsp;业&nbsp;生&nbsp;ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：<input type="number" name="student_id" value="<%=id %>" readonly="readonly"></p>
     <p>&nbsp;&nbsp;毕&nbsp;业&nbsp;生&nbsp;姓&nbsp;名&nbsp;&nbsp;&nbsp;：<input type="text" name="name" value="<%=name %>" required="required" autofocus="autofocus"/></p>
     <p>&nbsp;&nbsp;毕业生身份证号：<input type="text" name="number" value="<%=number %>" required="required"/></p>
     <p>&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="number" name="stunumber" value="<%=stunumber %>" required="required"></p>
     <p>&nbsp;&nbsp;所&nbsp;&nbsp;在&nbsp;&nbsp;学&nbsp;&nbsp;院&nbsp;&nbsp;&nbsp;&nbsp;：<select name="xueyuan">
                <option>计算机与信息安全学院</option>
                <option>机电工程学院</option>
                <option>艺术与设计学院</option>
                <option>外国语学院</option>   
                </select></p>
     <p>&nbsp;&nbsp;所&nbsp;&nbsp;&nbsp;在&nbsp;&nbsp;&nbsp;班&nbsp;&nbsp;&nbsp;级&nbsp;：<input type="number" name="class" value="<%=cla %>" required="required"></p>
     &nbsp;&nbsp;<input type="submit" value="更新" />
   
  </form>
	</div>
</div>
</div>

<script>navList(12);</script>
</body>
</html>