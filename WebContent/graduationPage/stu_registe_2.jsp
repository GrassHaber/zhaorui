<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/login.css">
<title>毕业生注册</title>
<script type="text/javascript">
	function validate(){
		var username=document.lform.username.value;
		var password=document.lform.password.value;
		var psw=document.lform.psw.value;
		if(username==""){
		alert("请输入用户名");
		document.lform.username.focus();
		return false;
		}
		else if(psw != password){
		alert("两次输入的密码不一致，请重新输入");
		document.lform.psw.focus();
		return false;
		}
		else{
		return true;
		}
	}
</script>
</head>
<body>
    <form action="doRegiste.jsp" name="lform" onSubmit="return validate()" method="post">
   <section class="registe">
     <h2>毕业生注册</h2>
        <h3>学籍验证成功！请完成注册：</h3>
       <div class="registe-main"> 
       <p>真实姓名：<input type="text" name="name" value="<%=session.getAttribute("name") %>" readonly="readonly"/></p>
       <p>证件类型：<select disabled="disabled"> <option value="idcard">身份证</select></p>
       <p>证件号码：<input type="text" name="number" value="<%=session.getAttribute("number") %>" readonly="readonly"/></p>
       <p>用&nbsp;户&nbsp;名：&nbsp;&nbsp;<input type="text" name="username" autofocus="autofocus" 
       required="required"  title="请输入由大小写字母、数字组成的字符，长度在5~20" /></p>
       <p>设置密码：<input type="password" name="password" required="required"/></p>
       <p>确认密码：<input type="password" name="psw" required="required"/></p>
       <p>密保问题：<select name="encrypted">
                      <option>您目前的姓名是？</option>
                	  <option>您父亲的姓名是？</option>
                	  <option>您母亲的姓名是？</option>
                	  <option>您配偶的姓名是？</option>
                	  <option>对您影响最大的人的名字是？</option>
                      </select></p>
                      
       <p class="answer">请设置密保问题答案：<input type="text" name="answer" required="required"/></p>               
       </div>
       <input type="submit" value="完成注册"/>
            
  </section>
   </form>
</body>
</html>