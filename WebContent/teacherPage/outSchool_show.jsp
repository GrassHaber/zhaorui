<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕业生就业单位信息</title>
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
								<li><a href="#">毕业生信息 : 查看毕业生就业单位信息</a></li>
						</ul>
			</div>
			<div class="main">
	<form action="outschool_deal.jsp" method="post">
		&nbsp;&nbsp;请输入毕业生id:<input type="number" name="student_id"/>
		<input type="submit" value="查询" />（不输入则为查看全部）
	</form>
	</div>
</div>
</div>

<script>navList(12);</script>
</body>
</html>