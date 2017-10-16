<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport"content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/HomePage.css" />
        <title>首页</title>
        <script type="text/javascript" src="../js/jquery.js" ></script>
        <script type="text/javascript" src="../js/HomePage.js" ></script>
    </head>
    <body>
    	<div id="body">
            <div id="head">
    			<div id="person">
    				<img src="../img/head.jpg" />
    			</div>
    			<div id="label">
    			    <img src="../img/library.png" />
    			</div>
    			<div id="search">
    				<a href="SearchPage.jsp"><img src="../img/search.png"/></a>
    			</div>
    		</div>
    		<div id="banner">
    		   <div id="container">
                  <div id="list" style="left: -100%;">
                       <img src="../img/5.jpg" alt="1" name=""/>
                       <img src="../img/1.jpg" alt="1" name=""/>
                       <img src="../img/2.jpg" alt="2" name=""/>
                       <img src="../img/3.jpg" alt="3" name=""/>
                       <img src="../img/4.jpg" alt="4" name=""/>
                       <img src="../img/5.jpg" alt="5" name=""/>
                       <img src="../img/1.jpg" alt="5" name=""/>
                  </div>
                  <div id="buttons">
                        <span index="1" class="on"></span>
                        <span index="2"></span>
                        <span index="3"></span>
                        <span index="4"></span>
                        <span index="5"></span>
                   </div>
                     <a href="javascript:;" id="prev" class="arrow">&lt;</a>
                      <a href="javascript:;" id="next" class="arrow">&gt;</a>
               </div>
    		</div>
    		<div id="select">
    			<div onclick="loyot()">
    				<img src="../img/div.png" />
    				<span>分类</span>
    			</div>
    			<div id="test">
    				<img src="../img/paiheng.png" />
    				<span>排行</span>
    			</div>
    			<div id="bookList">
    				<img src="../img/book.png" />
    				<span>书单</span>
    			</div>
    		</div>
    		<div id="newbook">
    			<div id="label">
    				<div style="height: 60%; width: 5%;background-color: green;position: relative;left: 5%;top: 3%; border-radius: 30%;float: left;"></div>
    			    <div style="float: right;width: 75%;height: 80%;margin-right: 7%;margin-top: 5%;">
    			    	<span style="font-family: '微软雅黑';">新书推荐</span>
    			    </div>
    			</div>
    			<div id="book">
    		      <div id="container_two">
                     <ul id="list_two" style="left: 0%;">
                         <li value="书名">
                           <img src="../img/1.jpg" alt="1"/>
                           <div class="bookname"><span>ss名</span></div>
                           <div class="writer"><span>作者</span></div>
                           <div class="content">本书收录程序设计竞赛经典试题，在解题过程中讲解各种算法设计技巧和数据结构，培养读者的解题能力。读者可亲自编写各章习题程序并获得评分，所有示例均附有解题过程及详细说明。jjjkjkk</div>
                         </li>
                         <li value="书名">
                           <img src="../img/2.jpg" alt="2"/>
                           <div class="bookname"><span>dd名</span></div>
                           <div class="writer"><span>作者</span></div>
                           <div class="content">都是公司公司的个的公司是首个三点式飞机的都会的还是dvd身上的方式老卡剪卡了打卡记录肯德基啊空间看啊是打手机大受打击啊不是手机看看大司农但貌似到哪啊是吧解放军，你啊打发法发顺丰上的色鄂我热热热微软微软微软为让微软微软微软温柔温柔微软微软微软温柔问人体日打个广告的风格士大夫似的 书单发射点发</div>
                         </li>
                         <li value="书名">
                           <img src="../img/3.jpg" alt="3"/>
                           <div class="bookname"><span>ff名</span></div>
                           <div class="writer"><span>作者</span></div>
                           <div class="content">都是公司公司的个的公司是首个三点式飞机的都会的还是dvd身上的方式老卡剪卡了打卡记录肯德基啊空间看啊是打手机大受打击啊不是手机看看大司农但貌似到哪啊是吧解放军，你啊打发法发顺丰</div>
                         </li>
                         <li value="书名">
                           <img src="../img/4.jpg" alt="4"/>
                           <div class="bookname"><span>书名</span></div>
                           <div class="writer"><span>作者</span></div>
                           <div class="content">都是公司公司的个的公司是首个三点式飞机的都会的还是dvd身上的方式老卡剪卡了打卡记录肯德基啊空间看啊是打手机大受打击啊不是手机看看大司农但貌似到哪啊是吧解放军，你啊打发法发顺丰</div>
                         </li>
                         <li value="书名">
                           <img src="../img/5.jpg" alt="5"/>
                           <div class="bookname"><span>书名</span></div>
                           <div class="writer"><span>作者</span></div>
                           <div class="content">都是公司公司的个的公司是首个三点式飞机的都会的还是dvd身上的方式老卡剪卡了打卡记录肯德基啊空间看啊是打手机大受打击啊不是手机看看大司农但貌似到哪啊是吧解放军，你啊打发法发顺丰</div>
                         </li> 
                     </ul>
                     <div id="buttons_two">
                         <span index="1" class="on"></span>
                         <span index="2"></span>
                         <span index="3"></span>
                         <span index="4"></span>
                         <span index="5"></span>
                     </div>
                         <a href="javascript:;" id="prev_two" class="arrow">&lt;</a>
                         <a href="javascript:;" id="next_two" class="arrow">&gt;</a>
                    </div>
    			</div>
    			<div id="button_more">
    				<button style="width: 100%; height: 100%;outline: none;background-color: white;border: hidden;">查看更多</button>
    			</div>
    		</div>		
    		<div class="hot_book">
    			<div id="label">
    				<div style="height: 80%; width: 5%;background-color: green;position: relative;left: 5%;top: 10%; border-radius: 30%;float: left;"></div>
    			    <div style="float: right;width: 75%;height: 80%;margin-right: 7%;margin-top: 5%;">
    			    	<span style="font-family: '微软雅黑';">热门书籍</span>
    			    </div>
    			</div>
    			<ul id="book_two">
    				<li value="巨人的陨落">
    					<img src="../img/a.jpg" />
    					<div>巨人的陨落</div>
    					<div>福莱特</div>
    				</li>
    				<li value="岛上书店">
    					<img src="../img/b.jpg" />
    					<div>岛上书店</div>
    					<div>加·泽文</div>
    				</li>
    				<li value="游戏人间">
    					<img src="../img/c.jpg" />
    					<div>游戏人间</div>
    					<div>贾平凹 </div>
    				</li>
    				<li value="自由的夜行">
    					<img src="../img/d.jpg" />
    					<div>自由的夜行</div>
    					<div>史铁生</div>
    				</li>
    			</ul>
    			<div id="button_more">
    				<button style="width: 100%; height: 100%;outline: none;background-color: white;border: hidden;">查看更多</button>
    			</div>
    		</div>
    		<div class="hot_read">
    			<div id="label">
    				<div style="height: 80%; width: 5%;background-color: green;position: relative;left: 5%;top: 10%; border-radius: 30%;float: left;"></div>
    			    <div style="float: right;width: 75%;height: 80%;margin-right: 7%;margin-top: 5%;">
    			    	<span style="font-family: '微软雅黑';">推荐阅读</span>
    			    </div>
    			</div>
    			<div id="book_three">
    				 <ul id="ul1">
                         <li>
                         	<div value="巨人的陨落"> <img src="../img/4.jpg" /> <p>巨人的陨落</p><p>福莱特</p></div>
                         	<div value=""> <img src="../img/1.jpg" /> <p>岛上书店</p><p>加·泽文</p></div>
                         	<div value=""> <img src="../img/2.jpg" /> <p>游戏人间</p><p>贾平凹 </p></div>
                         	<div value=""> <img src="../img/2.jpg" /> <p>自由的夜行</p><p>史铁生</p></div>
                         </li>
                         <li>
                         	<div value=""> <img src="../img/a.jpg" /> <p>巨人的陨落</p><p>福莱特</p></div>
                         	<div value=""> <img src="../img/b.jpg" /> <p>岛上书店</p><p>加·泽文</p></div>
                         	<div value=""> <img src="../img/c.jpg" /> <p>游戏人间</p><p>贾平凹 </p></div>
                         	<div value=""> <img src="../img/d.jpg" /> <p>自由的夜行</p><p>史铁生</p></div>
                         </li>
                         <li>
                         	<div value=""> <img src="../img/a.jpg" /> <p>巨人的陨落</p><p>福莱特</p></div>
                         	<div value=""> <img src="../img/b.jpg" /> <p>岛上书店</p><p>加·泽文</p></div>
                         	<div value=""> <img src="../img/c.jpg" /> <p>游戏人间</p><p>贾平凹 </p></div>
                         	<div value=""> <img src="../img/d.jpg" /> <p>自由的夜行</p><p>史铁生</p></div>
                         </li>
                         <li>
                         	<div value=""> <img src="../img/a.jpg" /> <p>巨人的陨落</p><p>福莱特</p></div>
                         	<div value=""> <img src="../img/b.jpg" /> <p>岛上书店</p><p>加·泽文</p></div>
                         	<div value=""> <img src="../img/c.jpg" /> <p>游戏人间</p><p>贾平凹 </p></div>
                         	<div value=""> <img src="../img/d.jpg" /> <p>自由的夜行</p><p>史铁生</p></div>
                         </li>
                         <li>
                         	<div value="导读"> <img src="../img/a.jpg" /> <p>巨人的陨落</p><p>福莱特</p></div>
                         	<div value=""> <img src="../img/b.jpg" /> <p>岛上书店</p><p>加·泽文</p></div>
                         	<div value=""> <img src="../img/c.jpg" /> <p>游戏人间</p><p>贾平凹 </p></div>
                         	<div value=""> <img src="../img/d.jpg" /> <p>自由的夜行</p><p>史铁生</p></div>
                         </li>
                     </ul>
    			</div>
    			<div id="button_more">
    				<button style="width: 100%; height: 100%;outline: none;background-color: white;border: hidden;">查看更多</button>
    			</div>
    		</div>
    	</div>
 	</body>
</html>