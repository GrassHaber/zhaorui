<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,rui.grad_tracking.vo.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账号管理</title>

<%
	int id = Integer.parseInt(request.getParameter("id"));
    
	Connection conn = msb.OpenConn();
	String sql = "select * from user where id='"+id+"'";
	PreparedStatement p = conn.prepareStatement(sql);
	ResultSet rs = p.executeQuery();
	while(rs.next()){
		UserVo userVo = new UserVo();
        userVo.setId(rs.getInt("id"));
        userVo.setUsr(rs.getString("usr"));
        userVo.setRole(rs.getString("role"));
        userVo.setUsr_name(rs.getString("usr_name"));
        userVo.setPhone(rs.getString("phone"));
        request.setAttribute("userVo", userVo);
	}
	msb.close(conn, p, rs);
%>
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
	<form action="admin_update.jsp" method="post">
	<h4>&nbsp;&nbsp;ID为${userVo.id}的账号详细信息为：</h4>
	<p>&nbsp;&nbsp;用&nbsp;户&nbsp;名&nbsp;：<input type="text" name="usr" value="${userVo.usr}" required="required"/></p>
	<p>&nbsp;&nbsp;用户类型：<select name="role">
			   <option value="${userVo.role }">${userVo.role }</option>
			   </select></p>
	<p>&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;：<input type="text" name="usr_name" value="${userVo.usr_name }" required="required"/></p>
	<p>&nbsp;&nbsp;联系电话：<input type="number" name="phone" value="${userVo.phone }" required="required"/></p>
	<p>&nbsp;&nbsp;<input type="submit" value="更新"/>		
	</form>
</div>
</div>
</div>

<script>navList(12);</script>	  
</body>
</html>