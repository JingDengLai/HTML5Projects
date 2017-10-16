<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../css/new_List.css" />
		<script type="text/javascript" src="../js/jquery.js" ></script>
		<script type="text/javascript" src="../js/new_List.js" ></script>
        <title>新建书单</title>
    </head>
    <body>
    	<div id="read" style="display: block;">
    	    <div id="head">
				<div id="return">
					<a onClick="javascript:history.back(-1);" id="prev"><img src="../img/backto.png" /></a>
				</div>
				<div id="span">
					<span style="font-size:20px;">新建书单</span>
				</div>
		    </div>
			<div id="title"><input type="text" placeholder="标题"/></div>
			<div id="content"><textarea rows="4" placeholder="书单简介，简单说下书籍的特征，如情节特点、主角性格等"></textarea></div>
			<div id="book-add">
			    	<!--<div class="book">
			    		<div id="image"><img src="../img/b.jpg"/></div>
			    		<div id="book_name">
			    			<p>书名</p>
			    			<div class="delete">X</div>
			    		</div>
			    		<div class="book_text">
			    			<textarea placeholder="说一下这本书的最大特点吧"></textarea>
			    		</div>
			    	</div>-->
			</div>
			<div id="add">
			    	<p style="font-size: 15px;margin-top: 8px;">+添加小说</p>
			    	<p style="font-size: 10px;margin-top: 5px;opacity: 0.5;">5本或以上才能通过</p>
			</div>
			<div id="block"></div>
			<div id="send">
			    	<p style="font-size: 18px; margin-top: 2%;font-weight: bold;">提交</p>
			</div>
		</div>
		
		<div id="booksearch" style="display: none;">
			<div id="head">
				<div id="return">
					<a onClick="javascript:history.back(-1);" id="prev"><img src="../img/backto.png" /></a>
				</div>
				<div id="span">
					<span style="font-size:20px;">添加书籍</span>
				</div>
		    </div>
		    <div id="book-seach">
		    	<input type="text" name="text" id="booktext"/>
		    	<button id="bookbutton">搜索</button>
		    </div>
		    <div id="book-list">
		    	<div class="book-li">
		    		<ul>
		    			<li class="image"><img src="../img/a.jpg" style="width: 100%;height: 100%;"/></li>
		    			<li class="name">巨人的陨落</li>
		    			<li class="add-button">添加</li>
		    		</ul>
		    	</div>
		    	<div class="book-li">
		    		<ul>
		    			<li class="image"><img src="../img/b.jpg" style="width: 100%;height: 100%;"/></li>
		    			<li class="name">岛上书店</li>
		    			<li class="add-button">添加</li>
		    		</ul>
		    	</div>
		    </div>
		    <div id="last-level">
			       <p style="font-size: 18px; margin-top: 2%;font-weight: bold;">下一步</p>
			</div>
		</div>
	</body>
</html>