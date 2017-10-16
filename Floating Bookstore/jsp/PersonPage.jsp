<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../css/PersonPage.css" />
		<title>个人页面</title>
	</head>

	<body>
		<div id="body">
			<div id="head">
				<div id="return">
					<a href='#' onClick="javascript:history.back(-1);" id="prev"><img src="../img/backto.png"/></a>
				</div>
				<div id="span">
					个人中心
				</div>
			</div>
			<div id="person">
				<div id="img">
				    <img src="../img/head.jpg" />
				</div>
				<div id="name">
				    <a href="#"><span style="font-size: 15px;opacity: 0.8;position: relative;left: 30px;">登录</span></a>
				</div>
			</div>
			<a href="MyMessage.jsp">
			<div id="message">
				<div id="img_message">
					<img src="../img/xiaoxi.png" />
				</div>
				<div id="name_message">
					<span>我的消息</span>
				</div>
				<div style="margin-top: 4%;background-color: red;position: relative;left: -20px;width: 20px;height: 20px;text-align: center;border-radius: 50%;color: white;">1</div>
				<div id="icon" style="margin-left: 25%;"><span>&gt;</span></div>
			</div>
			</a>
			<div id="message">
				<div id="img_message">
					<img src="../img/shudan.png" />
				</div>
				<div id="name_message">
					<span>我的书单</span>
				</div>
				<div id="icon"><span>&gt;</span></div>
			</div>
			<a href="MyTopic.jsp">
			<div id="message">
				<div id="img_message">
					<img src="../img/huati.png" />
				</div>
				<div id="name_message">
					<span>我的话题</span>
				</div>
				<div id="icon"><span>&gt;</span></div>
			</div>
			</a>
			<a href="HelpPage.jsp">
			<div id="message">
				<div id="img_message">
					<img src="../img/help.png" />
				</div>
				<div id="name_message">
					<span>帮助和反馈</span>
				</div>
				<div id="icon"><span>&gt;</span></div>
			</div>
			</a>
		</div>
	</body>

</html>