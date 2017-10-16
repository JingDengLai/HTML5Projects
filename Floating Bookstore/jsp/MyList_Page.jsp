<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../css/MyList_Page.css" />
        <title>书单广场</title>
    </head>
    <body>
    	<div id="head">
				<div id="return">
					<a onClick="javascript:history.back(-1);" id="prev"><img src="../img/backto.png" /></a>
				</div>
				<div id="span">
					<span style="font-size:20px;">书单广场</span>
				</div>
		</div>
		<div id="titles">
			<ul>
				<li class="select">最新</li>
				<li>最热</li>
			</ul>
		</div>
		<div id="content">
			<div id="news" style="display: block;">
				<ul>
					<li id="img_content"><img src="../img/b.jpg" /></li>
					<li id="text_content">
						<p style="margin-top: 10px;font-size: 15px;">书单标题</p>
						<p style="margin-top: 8px;font-size: 12px;"><span style="color: red;">1000</span><span style="color: #A9A9A9;"> 人关注   </span><span style="border-left: 2px solid #808080;">&nbsp;&nbsp;</span><span style="color: red;">9</span><span style="color: #A9A9A9;">  本小说</span></p>
					</li>
				</ul>
			</div>
			<div id="hots" style="display: none;">
				<ul>
					<li id="img_content"><img src="../img/b.jpg" /></li>
					<li id="text_content">
						<p style="margin-top: 10px;font-size: 15px;">书单标题</p>
						<p style="margin-top: 8px;font-size: 12px;"><span style="color: red;">1000</span><span style="color: #A9A9A9;"> 人关注   </span><span style="border-left: 2px solid #808080;">&nbsp;&nbsp;</span><span style="color: red;">9</span><span style="color: #A9A9A9;">  本小说</span></p>
					</li>
				</ul>
			</div>
		</div>
		<a href="new_List.jsp"><div id="fix_button">
			<button>发布</button>
		</div>
		</a>
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