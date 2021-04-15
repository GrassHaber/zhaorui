<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/login.css">
<title>桂林电子科技大学毕业生就业跟踪管理-登录</title>
</head>
<body>
    <section class="container">
    <div class="login">
      <h1>用户登录</h1>
      <form method="post" action="validate.jsp">
        <p><input type="text" name="username"  placeholder="用户名" required="required"></p>
        <p><input type="password" name="password"  placeholder="密码" required="required"></p>
        <p class="submit"><select name="role">
        	<option value="student">毕业生</option>
        	<option value="teacher">就业中心管理员</option>
        	<option value="admin">系统管理员</option>
           </select>
        <input type="submit" name="commit" value="立即登录"></p>
      </form>
    </div>

    <div class="login-help">
      <p>忘记密码? <a href="findPSW.jsp">点击找回</a></p>
    </div>
    <div class="login-registe">
    	<p>没有账号? <a href="graduationPage/stu_registe_1.jsp">马上注册</a></p>
    </div>
  </section>
 
</body>
</html>