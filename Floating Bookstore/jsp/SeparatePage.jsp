<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport"content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../css/SeparatePage.css"/>
        <title></title>
        <script type="text/javascript" src="../js/jquery.js" ></script>
        <script>
        	window.onload = function(){
        		
              var obj_lis = document.getElementsByTagName("li");
                 for(i=0;i<obj_lis.length;i++){
                    obj_lis[i].onclick = function(){
                       var type_name=this.innerHTML;
                       $.ajax({             //用ajax来实现不刷新网页的基础上更新数据
                       type:"post",  //请求方式
                       url:"http://localhost:8080/Test/HelloWorld",  //路径
                       data:{
                        username:type_name   //获取input中name为username的值
                       }
                  }); 
                    }
                 } 
                }
        </script>
    </head>
    <body>
    	<div id="body">
    		<div id="head">
    			<div id="return">
    				<a href="HomePage.jsp" id="prev">&lt;</a>
    			</div>
    			<div id="span">
    				<span style="font-size: 25px; position: relative;top: 13%;">分类</span>
    			</div>
    		</div>
    		<ul id="content">
    			<li>哲学</li>
    			<li>宗教</li>
    			<li>马克思主义</li>
    			<li>社会科学论</li>
    			<li>政治</li>
    			<li>法律</li>
    			<li>军事</li>
    			<li>文化</li>
    			<li>科学</li>
    			<li>教育</li>
    			<li>体育</li>
    			<li>语言</li>
    			<li>文学</li>
    			<li>艺术</li>
    			<li>历史</li>
    			<li>地理</li>
    			<li>自然科学论</li>
    			<li>数理科学和化学</li>
    			<li>天文学</li>
    			<li>地球科学</li>
    			<li>生物科学</li>
    			<li>医药</li>
    			<li>卫生</li>
    			<li>农业科学</li>
    			<li>工业科学</li>
    			<li>工业技术</li>
    			<li>交通运输</li>
    			<li>环境科学</li>
    			<li>安全科学</li>
    			<li>综合性用书</li>
    		</ul>
    	</div>
 	</body>
</html>