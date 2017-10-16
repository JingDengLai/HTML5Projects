<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport"content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/BookList_Page.css" />
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
    				<a href="SeparatePage.jsp" id="prev">&lt;</a>
    			</div>
    			<div id="span">
    				<span style="font-size:25px;position:relative;top:3%;">文学</span> 
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
    	     			<span style="font-size: 13px;">加.泽文;</span><span style="font-size: 13px;">孙仲旭(译者),李玉瑶(译者)</span>
    	     		</div>
    	     		<div id="textarea">
    	     			<div>岛上书店是间维多利亚风格的小屋，门廊上挂着褪色的招牌，上面写着： 没有谁是一座孤岛，每本书都是一个世界。A．J．费克里，人近中年，在一座与世隔绝的小岛上，经营一家书店。命运从未眷顾过他，爱妻去世，书店危机，就连值钱的宝贝也遭窃。他的人生陷入僵局，他的内心沦为荒岛。就在此时，一个神秘的包袱出现在书店中，意外地拯救了陷于孤独绝境中的A．J．，成为了连接他和妻姐伊斯梅、 警长兰比亚斯、出版社女业务员阿米莉娅之间的纽带，为他的生活带来了转机。小岛上的几个生命紧紧相依，走出了人生的困境，而所有对书和生活的热爱都周而复始，愈加汹涌。</div>
    	     		</div>
    	     	</div>
    	    </li>
    	</div>
 	</body>
</html>