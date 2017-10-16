<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../css/MyMessage.css" />
        <title>我的消息</title>
    </head>
    <body>
    	<div id="head">
				<div id="return">
					<a onClick="javascript:history.back(-1);" id="prev"><img src="../img/backto.png" /></a>
				</div>
				<div id="span">
					<span style="font-size:20px;">我的消息</span>
				</div>
		</div>
		<div id="titles">
			<ul>
				<li class="select">通知</li>
				<li>已借书籍</li>
				<li>预定书籍</li>
			</ul>
		</div>
		<div id="content">
			<div id="message" style="display: block;">
				<p>你借的书籍《嫌疑人X的献身》将于2017.6.19到期，请尽快归还。</p>
				<p>你借的书籍《嫌疑人X的献身》将于2017.6.19到期，请尽快归还。</p>
			</div>
			<div id="borrow-book" style="display: none;">
				<ul id="book-content">
    	     	<li id="img">
    	     		<img src="../img/b.jpg" />
    	     	</li>
    	     	<li id="name">
    	     		<ul>
    	     			<li id="bookname">
    	     			   <span style="font-size: 20px;font-family: '楷体';">岛上书店</span>
    	     		    </li>
    	     		    <li id="writer">
    	     			   <span style="font-size: 13px;">加.泽文;</span><span style="font-size: 13px;">孙仲旭(译者),李玉瑶(译者)</span>
    	     		    </li>
    	     		    <li id="borrow-date">
    	     			    <span style="font-size: 13px;">借书日期:</span><span style="font-size: 13px;color: cornflowerblue;">2017.6.2</span>
    	     		    </li>
    	     		    <li id="return-date">
    	     			    <span style="font-size: 13px;">还书日期:</span><span style="font-size: 13px;color: orangered;">2017.7.2</span>
    	     		    </li>
    	     		</ul>
    	     	</li>
    	     	</ul>
			</div>
			<div id="reservebook" style="display: none;">
				<ul id="book-content">
    	     	<li id="img">
    	     		<img src="../img/b.jpg" />
    	     	</li>
    	     	<li id="name">
    	     		<ul>
    	     			<li id="bookname">
    	     			   <span style="font-size: 20px;font-family: '楷体';">岛上书店</span>
    	     		    </li>
    	     		    <li id="writer">
    	     			   <span style="font-size: 13px;">加.泽文;</span><span style="font-size: 13px;">孙仲旭(译者),李玉瑶(译者)</span>
    	     		    </li>
    	     		    <li>
    	     			    <p style="margin-top: 5px;font-size: 13px;height: 45px;	display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;text-overflow: ellipsis;overflow: hidden">岛上书店是间维多利亚风格的小屋，门廊上挂着褪色的招牌，上面写着： 没有谁是一座孤岛，每本书都是一个世界。A．J．费克里，人近中年，在一座与世隔绝的小岛上，经营一家书店。命运从未眷顾过他，爱妻去世，书店危机，就连值钱的宝贝也遭窃。他的人生陷入僵局，他的内心沦为荒岛。就在此时，一个神秘的包袱出现在书店中，意外地拯救了陷于孤独绝境中的A．J．，成为了连接他和妻姐伊斯梅、 警长兰比亚斯、出版社女业务员阿米莉娅之间的纽带，为他的生活带来了转机。小岛上的几个生命紧紧相依，走出了人生的困境，而所有对书和生活的热爱都周而复始，愈加汹涌。</p>
    	     		    </li>
    	     		</ul>
    	     	</li>
    	     	</ul>
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