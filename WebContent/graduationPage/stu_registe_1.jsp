<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/login.css">
<title>毕业生注册</title>
</head>
<body>
  <form action="statusValidate.jsp" method="post">
   <div class="registe">
     <h1>毕业生注册</h1>
       <h4>学籍信息验证:</h4><br>
       <p>真实姓名：<input type="text" name="name" required="required" /></p>
       <p>证件类型：<select disabled="disabled"> <option value="idcard">身份证</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
       <p>证件号码：<input type="text" name="number" required="required" /></p><br>
       
       <input type="submit" value="学籍验证"/>
   </div>    
   
  </form>
</body>
</html>