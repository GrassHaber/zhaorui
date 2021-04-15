<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕业后就业情况填写</title>
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
								<li><a href="#">毕业后就业情况</a></li>
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
   <form action="out_save.jsp" onsubmit="return submit_sure()" method="post">
   <fieldset>
     <legend><h2><b>毕业后就业情况填写</b></h2></legend>
     <p><b>1.毕业去向</b></p>
     <p><input type="radio" name="isWork" value="A" id="A1"/>
        <label for="A1">A.签订毕业生就业协议书就业</label>
        <input type="radio" name="isWork" value="B" id="B1"/>
        <label for="B1">B.签订劳动合同就业</label>
        <input type="radio" name="isWork" value="C" id="C1"/>
        <label for="C1">C.其他录用形式就业</label></p>
     <p><input type="radio" name="isWork" value="D" id="D1"/>
        <label for="D1">D.升学</label>
        <input type="radio" name="isWork" value="E" id="E1"/>
        <label for="E1">E.出国</label>
        <input type="radio" name="isWork" value="F" id="F1"/>
        <label for="F1">F.待就业</label> </p>
     <p><input type="radio" name="isWork" value="G" id="G1"/>
        <label for="G1">G.应征义务兵</label>
        <input type="radio" name="isWork" value="H" id="H1"/>
        <label for="H1">H.自主创业</label>
        <input type="radio" name="isWork" value="I" id="I1"/>
        <label for="I1">I.自由职业</label></p>
     <p><b>2.就业渠道</b></p>
     <p><input type="radio" name="way" value="A" id="A2"/>     
        <label for="A2">A.校园招聘</label>
        <input type="radio" name="way" value="B" id="B2"/>     
        <label for="B2">B.校外的现场招聘会</label>
        <input type="radio" name="way" value="C" id="C2"/>     
        <label for="C2">C.招聘求职网站</label></p>
     <p><input type="radio" name="way" value="D" id="D2"/>     
        <label for="D2">D.父母及亲友推荐</label>
        <input type="radio" name="way" value="E" id="E2"/>     
        <label for="E2">E.直接向用人单位申请</label>
        <input type="radio" name="way" value="F" id="F2"/>     
        <label for="F2">F.其他</label></p>
     <p><b>3.就业地域</b></p>
     <p><input type="radio" name="region" value="A" id="A3"/>
        <label for="A3">A.广西区内</label>
        <input type="radio" name="region" value="B" id="B3"/>
        <label for="B3">B.家乡</label>
        <input type="radio" name="region" value="C" id="C3"/>
        <label for="C3">C.珠三角</label></p>
     <p><input type="radio" name="region" value="D" id="D3"/>
        <label for="D3">D.长三角</label>
        <input type="radio" name="region" value="E" id="E3"/>
        <label for="E3">E.津京唐</label>
        <input type="radio" name="region" value="F" id="F3"/>
        <label for="F3">F.其他地区</label></p>
     <p><b>4.薪资（月收入）</b></p>
     <p><input type="radio" name="salary" value="A" id="A4"/>
        <label for="A4">A.3000元以下</label>
        <input type="radio" name="salary" value="B" id="B4"/>
        <label for="B4">B.3000元-4000元</label>
        <input type="radio" name="salary" value="C" id="C4"/>
        <label for="C4">C.4000元-5000元</label>
        <input type="radio" name="salary" value="D" id="D4"/>
        <label for="D4">D.5000元-6000元</label></p>
     <p><input type="radio" name="salary" value="E" id="E4"/>
        <label for="E4">E.6000元-7000元</label>
        <input type="radio" name="salary" value="F" id="F4"/>
        <label for="F4">F.7000元-8000元</label>
        <input type="radio" name="salary" value="G" id="G4"/>
        <label for="G4">G.8000元以上</label></p>
     <p><b>5.就业单位性质</b></p>
     <p><input type="radio" name="industry" value="A" id="A5"/>
        <label for="A5">A.党政机关</label>
        <input type="radio" name="industry" value="B" id="B5"/>
        <label for="B5">B.事业单位</label>
        <input type="radio" name="industry" value="C" id="C5"/>
        <label for="C5">C.国有企业</label></p>
     <p><input type="radio" name="industry" value="D" id="D5"/>
        <label for="D5">D.三资企业</label>
        <input type="radio" name="industry" value="E" id="E5"/>
        <label for="E5">E.私营企业</label>
        <input type="radio" name="industry" value="F" id="F5"/>
        <label for="F5">F.其他</label></p>
     <p><b>6.就业满意度</b></p>
     <p><input type="radio" name="satisfaction" value="A" id="A6"/>
        <label for="A6">A.满意</label>
        <input type="radio" name="satisfaction" value="B" id="B6"/>
        <label for="B6">B.基本满意</label>
        <input type="radio" name="satisfaction" value="C" id="C6"/>
        <label for="C6">C.不满意</label></p>
     <p><b>7.个人职业价值观、性格、兴趣、能力与就业岗位匹配度</b></p>
     <p><input type="radio" name="relevance_self" value="A" id="A7"/>
        <label for="A7">A.符合</label>
        <input type="radio" name="relevance_self" value="B" id="B7"/>
        <label for="B7">B.基本符合</label>
        <input type="radio" name="relevance_self" value="C" id="C7"/>
        <label for="C7">C.不符合</label></p>
     <p><b>8.就业岗位与自身专业相关度</b></p>
     <p><input type="radio" name="relevance_major" value="A" id="A8"/>
        <label for="A8">A.对口</label>
        <input type="radio" name="relevance_major" value="B" id="B8"/>
        <label for="B8">B.基本对口</label>
        <input type="radio" name="relevance_major" value="C" id="C8"/>
        <label for="C8">C.不对口</label></p>
     <input type="submit" value="提交"/>          
   </fieldset>
   </form>
   </div>
   </div>
   </div>
<script>navList(12);</script>   
</body>
</html>