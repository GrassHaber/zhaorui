<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>就业单位信息填报</title>

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
								<li><a href="#">就业情况填报: 就业单位信息</a></li>
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
  	  String name = "";
  	  String address = "";
  	  String person = "";
  	  String phone = "";
  	  String email = "";
	  Connection conn = msb.OpenConn();
	  String sql_1 = "select * from unit where student_id='"+session.getAttribute("id")+"'";
	  PreparedStatement p1 = conn.prepareStatement(sql_1);
	  ResultSet rs = p1.executeQuery();
	  while(rs.next()){
		  name = rs.getString("name");
		  address = rs.getString("address");
		  person = rs.getString("person");
		  phone = rs.getString("phone");
		  email = rs.getString("email");
	  }
  %>
  <form action="do_unit.jsp" onsubmit="return submit_sure()" method="post">
  <h3><b>&nbsp;&nbsp;就业单位信息（若以签订的三方协议书就业，可不填此内容）</b></h3>
  <p>&nbsp;</p>
  <p>&nbsp;&nbsp;单位名称：<input type="text" name="name"  value="<%=name %>" required="required"/>
  &nbsp;&nbsp;联系人：<input type="text" name="person" size="10" value="<%=person %>" required="required" />
  &nbsp;&nbsp;联系电话：<input type="number" name="phone" value="<%=phone %>" required="required"/></p>
  <p>&nbsp;</p>
  <p>&nbsp;&nbsp;单位地址：<input type="text" name="address" value="<%=address %>" size="81" required="required"/></p>
  <p>&nbsp;</p>
  <p>&nbsp;&nbsp;电子邮件：<input type="email" name="email" value="<%=email %>" required="required" /></p>
  <p>&nbsp;</p>
  <p>&nbsp;&nbsp;单位性质：<select name="style">
                         <option value="机关" >机关</option>
                         <option value="科研设计单位" >科研设计单位</option> 
                         <option value="高等教育单位" >高等教育单位</option>
                         <option value="中初教育单位" >中初教育单位</option>
                         <option value="医疗卫生单位" >医疗卫生单位</option>
                         <option value="农村建制村" >农村建制村</option>
                         <option value="城镇社区" >城镇社区</option>
                         <option value="国有企业" >国有企业</option>
                         <option value="其他事业单位" >其他事业单位</option>
                         <option value="三资企业" >三资企业</option>
                         <option value="其他企业" >其他企业</option>
                         <option value="部队" >部队</option>
                         </select></p><p>&nbsp;</p>
  &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保存并提交" />
              &nbsp;&nbsp;<input type="reset" value="重置" />
  </form>
  	<%
  	   msb.close(conn, p1, rs);
  	%>
			</div>
		</div>
</div>
 <script>navList(12);</script> 
</body>
</html>