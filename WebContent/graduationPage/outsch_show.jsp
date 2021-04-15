<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*,rui.grad_tracking.vo.*,java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>桂林电子科技大学就业跟踪管理-毕业生</title>
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
			<li><a href="stuinformation.jsp"><%=session.getAttribute("username") %></a></li>
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
            <a href='stuinformation.jsp'>编辑个人信息</a>
            <a href='changePSW.jsp'>修改密码</a>
            
          </div>
        </li>
        
				<li>
          <h4 class="M5"><span></span>就业情况填报</h4>
          <div class="list-item none">
            <a href='inSchool.jsp'>毕业前就业意向</a>
            <a href='edit_three.jsp'>三方协议信息</a>
            <a href='outSchool.jsp'>毕业后就业情况</a>
            <a href='edit_unit.jsp'>就业单位信息</a>
            
          </div>
        </li>
				<li>
          <h4  class="M6"><span></span>填报结果</h4>
          <div class="list-item none">
            <a href='insch_show.jsp'>毕业前就业意向</a>
            <a href='image_show.jsp'>已上传的三方协议照片</a>
            <a href='outsch_show.jsp'>毕业后就业情况</a>
          </div>
        </li>
				
				
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">毕业生首页</a></li>
								<li><a href="students.jsp">毕业生首页</a></li>
								<li>></li>
								<li><a href="#">填报结果 : 毕业后就业情况</a>
						</ul>
			</div>
			<div class="main">
			<%
				Connection conn = msb.OpenConn();
				String sql = "select * from outschool where student_id='"+session.getAttribute("id")+"'";
				PreparedStatement p = conn.prepareStatement(sql);
				ResultSet rs = p.executeQuery();
				while(rs.next()){
					OutschoolVo outVo = new OutschoolVo();
					outVo.setId(rs.getInt("id"));
					outVo.setIsWork(rs.getString("isWork"));
					outVo.setIndustry(rs.getString("industry"));
					outVo.setRegion(rs.getString("region"));
					outVo.setRele_major(rs.getString("relevance_major"));
					outVo.setRele_self(rs.getString("relevance_self"));
					outVo.setSalary(rs.getString("salary"));
					outVo.setSatisfaction(rs.getString("satisfaction"));
					outVo.setWay(rs.getString("way"));
					request.setAttribute("outVo", outVo);
				}
				
				msb.close(conn, p, rs);		
			%>
				<h3>&nbsp;&nbsp;填报结果如下：</h3>
			    <table border="1" align="center" width="70%">
			        <tr>
			            
			            <td><b>目前的就业情况</b></td>
			            <td><b>就业地域</b></td>
			            <td><b>薪资（月收入）</b></td>
			            <td><b>通过何种渠道就业</b></td>
			            <td><b>行业</b></td>
			            <td><b>就业满意度</b></td>
			            <td><b>专业相关度</b></td>
			            <td><b>人岗匹配度</b></td>
			            
			        </tr>
			        <tr>
			        	
			        	<td>${outVo.isWork }</td>
			        	<td>${outVo.region }</td>
			        	<td>${outVo.salary}</td>
			            <td>${outVo.way }</td>
			            <td>${outVo.industry }</td>
			            <td>${outVo.satisfaction }</td>
			            <td>${outVo.rele_major }</td>
			            <td>${outVo.rele_self }</td>
			        </tr>
			    </table> 
				
			</div>
		</div>
</div>

<script>navList(12);</script>

</body>
</html>