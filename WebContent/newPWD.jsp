<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login.css">
<title>设置新密码</title>
</head>
<body>
<script type="text/javascript">
	function validate(){
		var  password=document.find_PSW.password.value;
		var psw=document.find_PSW.psw.value;
	    if(psw != password){
		alert("两次输入的密码不一致，请重新输入");
		document.find_PSW.psw.focus();
		return false;
		}
		else{
		return true;
		}
	}
</script>
   <div class="registe">
   <form action="do_new.jsp" name="find_PSW" onSubmit="return validate()" method="post">
    <h3><b>&nbsp;&nbsp;请设置新密码</b></h3>
    <p>&nbsp;</p>
    <p>&nbsp;&nbsp;新&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码&nbsp;：<input type="password" name="password" required="required" autofocus="autofocus"/></p>
    <p>&nbsp;&nbsp;确认新密码：<input type="password" name="psw" required="required"/></p>
    <p>&nbsp;&nbsp;<input type="submit" value="提交"/></p>
    </form>
    </div>
</body>
</html>