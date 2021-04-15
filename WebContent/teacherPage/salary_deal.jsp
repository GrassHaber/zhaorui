<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.PrintWriter,rui.grad_tracking.demo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<%
	request.setCharacterEncoding("utf8");
    String title = request.getParameter("title");
	Connection conn = msb.OpenConn();
	int num_A = 0;
	int num_B = 0;
	int num_C = 0;
	int num_D = 0;
	int num_E = 0;
	int num_F = 0;
	int num_G = 0;
	BarChart chart = new BarChart();
	PreparedStatement p1 = conn.prepareStatement("select * from outschool where salary='A'");
	ResultSet rs1 = p1.executeQuery();
	while(rs1.next()){
		num_A = rs1.getRow();
		chart.setValue(num_A, "", "3000元以下");
	}
	rs1.close();
	p1.close();
	PreparedStatement p2 = conn.prepareStatement("select * from outschool where salary='B'");
	ResultSet rs2 = p2.executeQuery();
	while(rs2.next()){
		num_B = rs2.getRow();
		chart.setValue(num_B,"","3000元-4000元");
	}
	rs2.close();
	p2.close();
	PreparedStatement p3 = conn.prepareStatement("select * from outschool where salary='C'");
	ResultSet rs3 = p3.executeQuery();
	while(rs3.next()){
		num_C = rs3.getRow();
		chart.setValue(num_C,"","4000元-5000元");
	}
	rs3.close();
	p3.close();
	PreparedStatement p4 = conn.prepareStatement("select * from outschool where salary='D'");
	ResultSet rs4 = p4.executeQuery();
	while(rs4.next()){
		num_D = rs4.getRow();
		chart.setValue(num_D,"","5000元-6000元");
	}
	rs4.close();
	p4.close();
	PreparedStatement p5 = conn.prepareStatement("select * from outschool where salary='E'");
	ResultSet rs5 = p5.executeQuery();
	while(rs5.next()){
		num_E = rs5.getRow();
		chart.setValue(num_E,"","6000元-7000元");
	}
	rs5.close();
	p5.close();
	PreparedStatement p6 = conn.prepareStatement("select * from outschool where salary='F'");
	ResultSet rs6 = p6.executeQuery();
	while(rs6.next()){
		num_F = rs6.getRow();
		chart.setValue(num_F,"","7000元-8000元");
	}
	rs6.close();
	p6.close();
	PreparedStatement p7 = conn.prepareStatement("select * from outschool where salary='G'");
	ResultSet rs7 = p7.executeQuery();
	while(rs7.next()){
		num_G = rs7.getRow();
		chart.setValue(num_G,"","8000元以上");
	}
	rs7.close();
	p7.close();
	String filename = chart.generateBarChart(title, "薪资", "人数", session, new PrintWriter(out));
	String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" +filename;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/menu.js"></script>
<title>毕业生薪资统计结果</title>
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
								<li><a href="#">数据统计 : 毕业生薪资</a></li>
						</ul>
			</div>
			<div class="main">
 <P ALIGN="CENTER">
<img src="<%= graphURL %>" width=500 height=300 border=0 usemap="#<%=filename %>"
alt="">
</P>
</div>
</div>
</div>
<script>navList(12);</script>	
</body>
</html>