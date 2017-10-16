<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport"content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/SearchList.css" />
        <title></title>
        <script type="text/javascript" src="../js/jquery.js" ></script>
        <script>
        	window.onload=function(){
        		var ali=document.getElementsByTagName("li");
        		
        		for (var i = 0; i < ali.length; i++) {
        			ali[i].onclick=function(){
        				var avalue=this.getAttribute("value");
        				$.ajax({             //用ajax来实现不刷新网页的基础上更新数据
                         type:"post",  //请求方式
                         url:"http://localhost:8080/Test/HelloWorld",  //路径
                         data:{listname:avalue}   //获取input中name为username的值
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
    				<a href="SearchPage.jsp" id="prev">&lt;</a>
    			</div>
    			<div id="text">
    				<img src="../img/search.png" />
    				<a href="SearchPage.jsp"><input id="search" type="text" name="search" /></a>
    			</div>
    			<div id="first_Page">
    				<a href="HomePage.jsp" style="text-decoration: none;"><img src="../img/fisrtPage.png"/></a>
    			</div>
    		</div>
    	     <li value="岛上书店">
    	     	<div id="img">
    	     		<img src="../img/b.jpg" />
    	     	</div>
    	     	<div id="name">
    	     		<div id="bookname">
    	     			<span style="font-size: 20px;font-family: '楷体';">岛上书店</span>
    	     		</div>
    	     		<div id="writer">
    	     			<span style="font-size: 13px;">加.泽文</span>
    	     		</div>
    	     		<div id="type">
    	     			<span style="font-size: 13px;">文学</span><span style="font-size: 13px;position: relative;left: 20%;">藏书量：3</span>
    	     		</div>
    	     	</div>
    	     </li>
    	</div>
 	</body>
</html>