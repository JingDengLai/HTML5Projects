<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/ErCore.css" />
        <meta name="viewport"content="width=device-width, initial-scale=1">
        <title>二维码</title>
    </head>
    <body>
    	<div id="body">
    		<div id="head">
    			<div id="return">
    				<a onclick="JavaScript:history.back(-1);"><img src="../img/backto.png"/></a>
    			</div>
    		</div>
    		<div id="img">
    			<img src="../img/head.jpg" />
    		</div>
    		<p id="text">请扫描二维码</p>
    	</div>
    	<script>
    		window.onload=function(){
    		document.getElementById("img").style.height=document.getElementById("img").style.width+"px";
    		}
    	</script>
 	</body>
</html>