<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,rui.grad_tracking.vo.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>
<title>查看所有管理员账户信息</title>
<%
  List<UserVo> list = new ArrayList<UserVo>();
      Connection conn = msb.OpenConn();
      String sql = "select * from user";
      PreparedStatement p = conn.prepareStatement(sql);
      ResultSet rs = p.executeQuery();
      while(rs.next()){
          UserVo userVo = new UserVo();
          userVo.setId(rs.getInt("id"));
          userVo.setUsr(rs.getString("usr"));
          userVo.setPwd(rs.getString("pwd"));
          userVo.setRole(rs.getString("role"));
          userVo.setUsr_name(rs.getString("usr_name"));
          userVo.setPhone(rs.getString("phone"));
          list.add(userVo);
          }
      request.setAttribute("list",list);
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
								<li><a href='#'>账户管理 : 查看管理员账户</a>
						</ul>
			</div>
			<div class="main">
		<script language="javascript">
  function submit_sure(){
	  var anw = confirm("确认要删除吗？");
	  if(anw==true){
		  return true;
	  }
	  else{
		  return false;
	  }
  }
  </script>
		<form action="delete.jsp" onsubmit="return submit_sure()" method="post">
		<p>&nbsp;&nbsp;&nbsp;用户id（id为1的用户无法删除）：<input type="number" name="id" required="required">
		       &nbsp;&nbsp;<input type="submit" value="删除"></p></form>
    <table border="1" align="center" width="70%">
       
        <tr>
            <td><b>用户id</b></td>
            <td><b>用户名</b></td>
            <td><b>密码</b></td>
            <td><b>用户类型</b></td>
            <td><b>姓名</b></td>
            <td><b>联系电话</b></td>
         
        </tr>
        <c:forEach items="${list}" var="list">
        <tr>
        	<td>${list.id }</td>
            <td>${list.usr }</td>
            <td>${list.pwd }</td>
            <td>${list.role }</td>
            <td>${list.usr_name }</td>
            <td>${list.phone }</td>
            
        </tr>
        </c:forEach>
    </table>
    
</div>
</div>
</div>

<script>navList(12);</script>  
</body>
</html>