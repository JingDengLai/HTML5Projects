<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../css/HelpPage.css" />
		<script type="text/javascript" src="../js/jquery.js" ></script>
        <title>帮助与反馈</title>
    </head>
    <body>
    	<div id="body">
    		<div id="head">
    			<div id="return">
    				<a  onclick="JavaScript:history.back(-1);"><img src="../img/backto.png"/></a>
    			</div>
    			<div id="span">
    				<span style="font-size: 20px;">帮助与反馈</span>
    			</div>
    		</div>
    		<div id="textarea">
    			<textarea placeholder="请输入你的建议..." id="textvalue"></textarea>
    		</div>
    		<div id="button">
    			<button type="button">提交</button>
    		</div>
    	</div>
    	<script>
    		window.onload=function(){
    			var sbutton=document.getElementById("button");
    			
    			sbutton.onclick=function(){
    				var textvalue=document.getElementById("textvalue").value;
    				if (textvalue==null||textvalue=="") {
    					alert("建议不能为空")
    				} else{
    					$.ajax({   
                         type:"post",  
                         url:"http://localhost:8080/Test/HelloWorld",  //路径
                         data:{textvalue:textvalue},
                         success:function(){
                        alert("提交成功");
                       }
                      }); 
    				}
    			}
    		}
    	</script>
 	</body>
</html>