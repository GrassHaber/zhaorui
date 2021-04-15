<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,rui.grad_tracking.vo.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>	
<title>毕业生学籍信息</title>
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
								<li><a href='#'>账户管理 : 查看毕业生账户</a>
						</ul>
			</div>
			<div class="main">
<%
  List<StudentVo> list = new ArrayList<StudentVo>();
      request.setCharacterEncoding("utf8");
      Connection conn = msb.OpenConn();
      String xueyuan = request.getParameter("xueyuan");
	  String cla = request.getParameter("class");
	  session.setAttribute("cla", cla);
	  String stunumber = request.getParameter("stunumber");
	  String sql = null;
	  if("".equals(cla)&&"".equals(stunumber)){
		  if("全部".equals(xueyuan)){
			  sql = "select * from student";
		  }
		  else{
			  sql = "select * from student where xueyuan='"+xueyuan+"'";
		  }
	  }
	  else if("".equals(stunumber)){
		  sql = "select * from student where class='"+cla+"'";
	  }
	  else{
		  sql = "select * from student where stunumber='"+stunumber+"'";
	  }
      PreparedStatement p = conn.prepareStatement(sql);
      ResultSet rs = p.executeQuery();
      while(rs.next()){
          StudentVo stuVo = new StudentVo();
          stuVo.setId(rs.getInt("id"));
          stuVo.setUsername(rs.getString("username"));
          stuVo.setPassword(rs.getString("password"));
          stuVo.setName(rs.getString("name"));
          stuVo.setNumber(rs.getString("number"));
          stuVo.setSex(rs.getString("sex"));
          stuVo.setXueyuan(rs.getString("xueyuan"));
          stuVo.setMajor(rs.getString("major"));
          stuVo.setStunumber(rs.getString("stunumber"));
          stuVo.setCla(rs.getString("class"));
          stuVo.setGrad_year(rs.getString("grad_year"));
          stuVo.setQq(rs.getString("QQ"));
          stuVo.setPhone(rs.getString("phone"));
          stuVo.setEmail(rs.getString("email"));
          list.add(stuVo);
          }
      
      request.setAttribute("list",list);
      msb.close(conn, p, rs);
%>
    <form action="" method="post">
	<p>&nbsp;&nbsp;所在学院：<select name="xueyuan">
	          <option>全部</option>
              <option>计算机与信息安全学院</option>
              <option>机电工程学院</option>
              <option>艺术与设计学院</option>
              <option>外国语学院</option>
              </select>
           所在班级：<input type="number" name="class"/>
             学号：<input type="number" name="stunumber" />
     <input type="submit" value="查看"></p>
     </form>
    <h3>&nbsp;&nbsp;查询结果如下：</h3>
    <table border="1" align="center" width="70%">
        <tr>
            <td><b>毕业生id</b></td>
            <td><b>用户名</b></td>
            <td><b>登录密码</b></td>
            <td><b>姓名</b></td>
            <td><b>身份证号</b></td>
            <td><b>性别</b></td>
            <td><b>学院</b></td>
            <td><b>专业</b></td>
            <td><b>学号</b></td>
            <td><b>班级</b></td>
            <td><b>毕业年份</b></td>
            <td><b>联系电话</b></td>
            <td><b>QQ</b></td>
            <td><b>电子邮件</b></td>
        </tr>
        <c:forEach items="${list}" var="list">
        <tr>
        	<td>${list.id }</td>
        	<td>${list.username }</td>
        	<td>${list.password}</td>
            <td>${list.name }</td>
            <td>${list.number }</td>
            <td>${list.sex }</td>
            <td>${list.xueyuan }</td>
            <td>${list.major }</td>
            <td>${list.stunumber }</td>
            <td>${list.cla }</td>
            <td>${list.grad_year }</td>
            <td>${list.phone }</td>
            <td>${list.qq }</td>
            <td>${list.email }</td>
        </tr>
        </c:forEach>
    </table>
</div>
</div>
</div>

<script>navList(12);</script>      
</body>
</html>