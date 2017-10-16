<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../css/MyTopic.css" />
        <title>我的话题</title>
    </head>
    <body>
    	<div id="head">
				<div id="return">
					<a onClick="javascript:history.back(-1);" id="prev"><img src="../img/backto.png" /></a>
				</div>
				<div id="span">
					<span style="font-size:20px;">我的话题</span>
				</div>
		</div>
		<div id="image">
			<div>
				<img src="../img/top.png"/>
			</div>
		</div>
		<div id="titles">
			<ul>
				<li class="select">书评</li>
				<li>话题</li>
			</ul>
		</div>
		<div id="content">
			<div id="topic" style="display: block;">
				<ul>
					<li><span>作者写得太烂了</span></li>
					<li><span>超级兵王</span><span>  2015-10-18</span></li>
				</ul>
			</div>
			<div id="borrow-book" style="display: none;">
				
			</div>
		</div>
		<script>
			window.onload=function(){
				var titles=document.getElementById("titles").getElementsByTagName("li");
				var divs=document.getElementById("content").getElementsByTagName("div");
				for (var i = 0; i < titles.length; i++) {
					titles[i].value=i;
					titles[i].onclick=function(){
						for (var j = 0; j < titles.length; j++) {
							titles[j].className=" ";
							divs[j].style.display="none";
						}
						this.className="select";
						divs[this.value].style.display="block";
					}
				}
			}
		</script>
 	</body>
</html>