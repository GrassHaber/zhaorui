<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕业前就业情况填写</title>
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
								<li><a href="#">毕业前就业意向</a></li>
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
   <form action="in_save.jsp" onsubmit="return submit_sure()" method="post">
   <fieldset>
     <legend><h2>毕业前就业情况填写</h2></legend>
     <p><b>1.就业意向</b></p>
     <p><input type="radio" name="intention" value="公务员（国家单位）" id="A1" />
        <label for="A1">A.公务员（国家单位）</label>
        <input type="radio" name="intention" value="企业管理（事业单位）" id="B1"/>
        <label for="B1">B.企业管理（事业单位）</label></p>
     <p><input type="radio" name="intention" value="科学研究与教育行业" id="C1"/>
        <label for="C1">C.科学研究与教育行业</label>
        <input type="radio" name="intention" value="技术等专业工程师" id="D1">
        <label for="D1">D.技术等专业工程师</label></p>
     <p><input type="radio" name="intention" value="自主经商创业" id="E1"/>
        <label for="E1">E.自主经商创业</label>
        <input type="radio" name="intention" value="继续学业" id="F1"/>
        <label for="F1">F.继续学业</label></p>
     <p><input type="radio" name="intention" value="自由职业" id="G1"/>
        <label for="G1">G.自由职业</label></p>
     <p><b>2.家庭背景</b></p>
     <p><input type="radio" name="fbg" value="政府官员" id="A2"/>
        <label for="A2">A.政府官员</label>
        <input type="radio" name="fbg" value="经商人员" id="B2"/>
        <label for="B2">B.经商人员</label>
        <input type="radio" name="fbg" value="农名家庭" id="C2"/>
        <label for="C2">C.农名家庭</label>
        <input type="radio" name="fbg" value="普通工人" id="D2"/>
        <label for="D2">D.普通工人</label></p>
     <p><input type="radio" name="fbg" value="无业与退休人员" id="E2"/>
        <label for="E2">E.无业与退休人员</label>
        <input type="radio" name="fbg" value="专业人员" id="F2"/>
        <label for="F2">F.专业人员</label>
        <input type="radio" name="fbg" value="其他" id="G2"/>
        <label for="G2">G.其他</label></p>
     <p><b>3.是否打算从事本专业相关的工作</b></p>
     <p><input type="radio" name="isSelfMajor" value="是" id="A3"/>
        <label for="A3">A.是</label>
        <input type="radio" name="isSelfMajor" value="否" id="B3"/>
        <label for="B3">B.否</label>
        <input type="radio" name="isSelfMajor" value="不确定" id="C3"/>
        <label for="C3">C.不确定</label></p>
     <p><b>4.对自身专业的就业前景是否了解</b></p>
     <p><input type="radio" name="isKnow" value="不了解" id="A4"/>
        <label for="A4">A.不了解</label>
        <input type="radio" name="isKnow" value="了解一点" id="B4"/>
        <label for="B4">B.了解一点</label>
        <input type="radio" name="isKnow" value="仔细了解过" id="C4"/>
        <label for="C4">C.仔细了解过</label></p>
     <p><b>5.就业地域选择</b></p>
     <p><input type="radio" name="hregion" value="广西区内" id="A5"/>
        <label for="A5">A.广西区内</label>
        <input type="radio" name="hregion" value="家乡" id="B5"/>
        <label for="B5">B.家乡</label>
        <input type="radio" name="hregion" value="珠三角" id="C5"/>
        <label for="C5">C.珠三角</label></p>
     <p><input type="radio" name="hregion" value="长三角" id="D5"/>
        <label for="D5">D.长三角</label>
        <input type="radio" name="hregion" value="津京唐" id="E5"/>
        <label for="E5">E.津京唐</label>
        <input type="radio" name="hregion" value="其他地区" id="F5"/>
        <label for="F5">F.其他地区</label></p>
     <p><b>6.期望薪资（月收入）</b></p>
     <p><input type="radio" name="hsalary" value="3000元以下" id="A6"/>
        <label for="A6">A.3000元以下</label>
        <input type="radio" name="hsalary" value="3000元-4000元" id="B6"/>
        <label for="B6">B.3000元-4000元</label>
        <input type="radio" name="hsalary" value="4000元-5000元" id="C6"/>
        <label for="C6">C.4000元-5000元</label>
        <input type="radio" name="hsalary" value="5000元-6000元" id="D6"/>
        <label for="D6">D.5000元-6000元</label></p>
     <p><input type="radio" name="hsalary" value="6000元-7000元" id="E6"/>
        <label for="E6">E.6000元-7000元</label>
        <input type="radio" name="hsalary" value="7000元-8000元" id="F6"/>
        <label for="F6">F.7000元-8000元</label>
        <input type="radio" name="hsalary" value="8000元以上" id="G6"/>
        <label for="G6">G.8000元以上</label></p>
     <p><input type="submit" value="提交">              
   </fieldset>
   </form>
   </div>
   </div>
   </div>
<script>navList(12);</script>    
</body>
</html>