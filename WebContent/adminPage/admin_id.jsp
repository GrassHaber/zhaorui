<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账号管理</title>
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
          <h4   class="M10"><span></span>账号管理</h4>
          <div class="list-item none">
            <a href='stu_show.jsp'>查看毕业生账号</a>
            <a href='ShowAll.jsp'>查看管理员账号</a>
            <a href='admin_Add.jsp'>添加管理员</a>
            <a href='admin_id.jsp'>管理员信息更新</a>
          </div>
        </li>			
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="admin.jsp">系统管理员首页</a></li>
								<li>></li>
								<li><a href='#'>账户管理 : 管理员信息更新</a>
						</ul>
			</div>
			<div class="main">
	<form action="admin_op.jsp" method="post">
	<h4>&nbsp;&nbsp;请输入用户id：</h4>
	&nbsp;&nbsp;<input type="number" name="id" autofocus="autofocus" required="required"/>
	&nbsp;&nbsp;<input type="submit" value="查询"/>
	</form>
</div>
</div>
</div>

<script>navList(12);</script>	
</body>
</html>