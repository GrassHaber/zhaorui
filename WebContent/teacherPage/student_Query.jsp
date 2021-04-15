<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,rui.grad_tracking.vo.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html >
<html>
<head>
<title>毕业生学籍信息</title>
<%
  List<StudentVo> lista = new ArrayList<StudentVo>();
      request.setCharacterEncoding("utf8");
      Connection conn = msb.OpenConn();
      String xueyuan = request.getParameter("xueyuan");
	  String cla = request.getParameter("class");
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
          lista.add(stuVo);
          }
      
      request.setAttribute("lista",lista);
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
								<li><a href="#">毕业生信息 : 查看毕业生信息</a></li>
						</ul>
			</div>
			<div class="main">
    <form action="" method="post">
	<p>&nbsp;&nbsp;所在学院：<select name="xueyuan">
	          <option>全部</option>
              <option>计算机与信息安全学院</option>
              <option>机电工程学院</option>
              <option>艺术与设计学院</option>
              <option>外国语学院</option>
              </select>
             所在班级：<input type="number" name="class" />
             学号：<input type="number" name="stunumber" />
     <input type="submit" value="查看"></p>
     </form>
    <h3>&nbsp;&nbsp;查询结果如下：</h3>
    <table border="1" align="center" width="70%">
        <tr>
            <td><b>毕业生id</b></td>
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
        <c:forEach items="${lista}" var="lista">
        <tr>
        	<td>${lista.id }</td>
            <td>${lista.name }</td>
            <td>${lista.number }</td>
            <td>${lista.sex }</td>
            <td>${lista.xueyuan }</td>
            <td>${lista.major }</td>
            <td>${lista.stunumber }</td>
            <td>${lista.cla }</td>
            <td>${lista.grad_year }</td>
            <td>${lista.phone }</td>
            <td>${lista.qq }</td>
            <td>${lista.email }</td>
        </tr>
        </c:forEach>
    </table>
</div>
</div>
</div>

<script>navList(12);</script>      
</body>
</html>