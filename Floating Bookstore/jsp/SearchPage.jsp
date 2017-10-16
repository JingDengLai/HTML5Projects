<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport"content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/SearchPage.css" />
        <title></title>
        <script type="text/javascript" src="../js/jquery.js" ></script>
        <script>
        	window.onload=function(){
               var aHis=document.getElementById("history");
               var aHref=aHis.getElementsByTagName("a");
               var aLi=aHis.getElementsByTagName("li");
               
               aHref.onclick=function(){
               	   $.ajax({             //用ajax来实现不刷新网页的基础上更新数据
                         type:"post",  //请求方式
                         url:"http://localhost:8080/Test/HelloWorld",  //路径
                         data:{delete:"清除"}   //获取input中name为username的值
                      }); 
               }

               
               for (var i = 0; i < aLi.length; i++) {
                  if(aLi[i].innerHTML==null){
               	      aHis.style.display="none";
                    }else{
               	      aHis.style.display="block";
               }
               	aLi[i].onclick=function(){
               		$.ajax({             //用ajax来实现不刷新网页的基础上更新数据
                         type:"post",  //请求方式
                         url:"http://localhost:8080/Test/HelloWorld",  //路径
                         data:{history:this.innerHTML}   //获取input中name为username的值
                      }); 
               	}
               }
               
              }
        </script>
    </head>
    <body>
    	<div id="body">
    		<form id="head" method="post" action="#">
    			<div id="text">
    				<img src="../img/search.png" />
    				<input id="search" type="search" name="search" />
    			</div>
    			<div id="button">
    				<input type="submit" value="搜索" id="sumit" />
    			</div>
    		</form>
    		<div id="history">
    			<a href="#">清除历史</a>
    			<li>东野圭吾</li>
    			<li>大主宰</li>
    			<li></li>
    			<li></li>
    			<li></li>
    		</div>
    		
    	</div>
 	</body>
</html>