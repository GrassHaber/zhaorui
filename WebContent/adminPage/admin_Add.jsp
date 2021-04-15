<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="msb" scope="page" class="rui.grad_tracking.jdbc.MySQLConnBean"></jsp:useBean>
<!DOCTYPE HTML>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
  <title>添加管理员账户</title> 
<script type="text/javascript">
	function validate(){
		var pwd=document.form_admin.pwd.value;
		var psw=document.form_admin.psw.value;
		if(psw != pwd){
		alert("两次输入的密码不一致，请重新输入");
		document.form_admin.psw.focus();
		return false;
		}
		else{
		return true;
		}
	}
</script>
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
			<li><a href="admin.jsp"><%=session.getAttribute("username") %></a></li>
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
								<li><a href='#'>账户管理 : 添加管理员</a>
						</ul>
			</div>
			<div class="main">
   <form action="deal_Add.jsp" name="form_admin" onSubmit="return validate()" method="post">
    <h2>&nbsp;&nbsp;请设置账户信息：</h2>
    <p>&nbsp;&nbsp;用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type="text" name="usr" autofocus="autofocus" 
       required="required"  title="请输入由大小写字母、数字组成的字符，长度在5~20" /></p>
    <p>&nbsp;&nbsp;用户类型：<select name="role">
               <option value="teacher">就业中心管理员</option>
               <option value="admin">系统管理员</option>
               </select>
    <p>&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="usr_name" required="required"/></p>
    <p>&nbsp;&nbsp;联系电话：<input type="number" name="phone" required="required"/></p>
    <p>&nbsp;&nbsp;设置密码：<input type="password" name="pwd" required="required"/></p>
    <p>&nbsp;&nbsp;确认密码：<input type="password" name="psw" required="required"/></p>
    &nbsp;&nbsp;<input type="submit" value="添加"/>
    </form>
</div>
</div>
</div>

<script>navList(12);</script>      
</body>
</html>
