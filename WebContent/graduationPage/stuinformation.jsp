<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕业生个人信息</title>

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
								<li><a href="students.jsp">毕业生首页</a></li>
								<li>></li>
								<li><a href="#">个人信息 : 编辑个人信息</a></li>
						</ul>
			</div>
			<div class="main">
			    <script language="javascript">
  function submit_sure(){
	  var anw = confirm("确认要提交吗？");
	  if(anw==true){
		  return true;
	  }
	  else{
		  return false;
	  }
  }
  </script>
  <%
      request.setCharacterEncoding("utf8");
      String usr = (String)session.getAttribute("username");
      String name = null;
      String student_id = null;
      Connection conn = msb.OpenConn();
      String sql = "select * from student where username='"+usr+"'";
      PreparedStatement p = conn.prepareStatement(sql);
      ResultSet rs = p.executeQuery();
      if(rs.next()){
    	  name = rs.getString("name"); 
    	  student_id=rs.getString("id");
    	  session.setAttribute("id", student_id);
      }
  %>
  <form action="informationsave.jsp" onsubmit="return submit_sure()" method="post">
  <h3><b>&nbsp;&nbsp;个人信息</b></h3>
  <p>&nbsp;&nbsp;真实姓名：<input type="text" name="name" value="<%=name %>" readonly="readonly"/></p>
  <p>&nbsp;&nbsp;证件类型：<select disabled="disabled"> <option value="idcard">身份证</select></p>
  <p>&nbsp;&nbsp;证件号码：<input type="text" name="number" value="<%=rs.getString("number") %>" readonly="readonly"/></p>
  <p>&nbsp;&nbsp;用&nbsp;户&nbsp;名&nbsp;：<input type="text" name="username" value="<%=session.getAttribute("username") %>" readonly="readonly"/></p>
  <p>&nbsp;&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input type="radio" name="sex" value="男" checked/>男
          <input type="radio" name="sex" value="女"/>女</p>
  <p>&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input type="number" name="stunumber" value="<%=rs.getString("stunumber")%>" readonly="readonly"/></p>
  <p>&nbsp;&nbsp;所在学院：<input type="text" name="xueyuan" value="<%=rs.getString("xueyuan")%>" readonly="readonly"/></p>
  <p>&nbsp;&nbsp;专业名称：<input type="text" name="major" value="<%=rs.getString("major")%>" required="required"/></p>
  <p>&nbsp;&nbsp;毕业时间：<input type="month" name="grad_time" value="<%=rs.getString("grad_year")%>"></p>
  <p>&nbsp;&nbsp;联系电话：<input type="number" name="phone" value="<%=rs.getString("phone")%>"required="required"></p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ：<input type="number" name="qq" value="<%=rs.getString("QQ")%>"></p>
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;email：<input type="email" name="email" value="<%=rs.getString("email")%>"></p>
  &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保存并提交">
  </form>
  <%
    rs.close();
  %>	
			</div>
		</div>
</div>
 <script>navList(12);</script> 
</body>
</html>