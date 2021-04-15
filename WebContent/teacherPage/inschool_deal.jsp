<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,rui.grad_tracking.vo.*,java.util.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕业生毕前就业意向</title>
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
								<li><a href="#">毕业生信息 : 查看毕业生毕前就业意向</a></li>
						</ul>
			</div>
			<div class="main">
<%
	List<InschoolVo> list = new ArrayList<InschoolVo>();
	request.setCharacterEncoding("utf8");
	String stu_id = request.getParameter("student_id");
	Connection conn = msb.OpenConn();
	String sql = null;
	if(stu_id.equals("")){
		sql = "select * from inschool";
	}
	else{
		int s_id = Integer.parseInt(stu_id);
    	sql = "select * from inschool where student_id='"+s_id+"'";
	}
	PreparedStatement p = conn.prepareStatement(sql);
	ResultSet rs = p.executeQuery();
	while(rs.next()){
		InschoolVo inVo = new InschoolVo();
        inVo.setStudent_id(rs.getInt("student_id"));
        inVo.setIntention(rs.getString("intention"));
        inVo.setIsKnow(rs.getString("isKnow"));
        inVo.sethRegion(rs.getString("hopeRegion"));
        inVo.sethSalary(rs.getString("hopeSalary"));
        inVo.setIsSelfMajor(rs.getString("isSelfMajor"));
        inVo.setFbg(rs.getString("familybackground"));
        list.add(inVo);
	}
	request.setAttribute("list", list);
	msb.close(conn, p, rs);		
%>
	<h3>&nbsp;&nbsp;查询结果如下：</h3>
    <table border="1" align="center" width="70%">
        <tr>
            <td><b>毕业生id</b></td>
            <td><b>就业意向</b></td>
            <td><b>对自身专业就业前景的了解性</b></td>
            <td><b>家庭背景</b></td>
            <td><b>是否从事自身专业的工作</b></td>
            <td><b>期望就业地域</b></td>
            <td><b>期望薪资（月收入）</b></td>
            
        </tr>
        <c:forEach items="${list}" var="list">
        <tr>
        	<td>${list.student_id }</td>
        	<td>${list.intention }</td>
        	<td>${list.isKnow}</td>
            <td>${list.fbg }</td>
            <td>${list.isSelfMajor }</td>
            <td>${list.hRegion }</td>
            <td>${list.hSalary }</td>
            
        </tr>
        </c:forEach>
    </table>
    </div>
</div>
</div>

<script>navList(12);</script>  	
</body>
</html>