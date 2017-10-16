<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport"content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/Book_IntroductionPage.css" />
        <script type="text/javascript" src="../js/jquery.js" ></script>
        <script type="text/javascript" src="../js/scroll.js" ></script>
        <script type="text/javascript">
             $(document).ready(function(){
	         $('.list_lh li:even').addClass('lieven');
          })
             $(function(){
	               $("div.list_lh").myScroll({
		               speed:45, //数值越大，速度越慢
		               rowHeight:28 //li的高度
	           });
          });
        </script>
        <title>书籍简介</title>
    </head>
    <body>
    	<div id="body">
    		<div id="head">
    			<div id="return">
    				<a href="#"  id="prev  onclick="JavaScript:history.back(-1);">&lt;</a>
    			</div>
    			<div id="span">
    				<span style="font-size: 25px; position: relative;top: 13%;">书籍简介</span>
    			</div>
    		</div>
    		<div id="left_div">
    			<img src="../img/b.jpg"/>
    		</div>
    		<div id="right_div">
    			<div id="top">
    				<div id="href">
    					<a>借阅该书籍</a>
    					<a>预借该书籍</a>
    				</div>
    			<table>
    				<tr>
    					<td colspan="2"><span style="font-size: 15px;">岛上书店</span></td>
    				</tr>
    				<tr>
    					<td><span style="font-size: 10px;">作者</span></td>
    					<td><span style="font-size: 10px;">加.泽文</span></td>
    				</tr>
    				<tr>
    					<td><span style="font-size: 10px;">出版社</span></td>
    					<td><span style="font-size: 10px;">北京出版社</span></td>
    				</tr>
    				<tr>
    					<td><span style="font-size: 10px;">ISBN</span></td>
    					<td><span style="font-size: 10px;">978-7-5157-0135-6</span></td>
    				</tr>
    			</table>
    			</div>
    			<div id="XU">
    				<div style="width: 100%;height: 55px; font-size: 10px;">
    					<p>序</p>
    				</div>
    				<div style="width: 100%;height: 128px; font-size: 10px;">
    					<p>目录</p>
    					<p>1</p>
    					<p>2</p>
    					<p>3</p>
    					<p>4</p>
    					<p>5</p>
    					<p>6</p>
    					<p>7</p>
    					<p>8</p>
    				</div>
    				<div style="width: 100%;height: 55px; font-size: 10px;">
    					<p>内容简介</p>
    				</div>
    				<div style="width: 100%;height: 55px; font-size: 10px;">
    					<p>导读</p>
    				</div>
    				<div class="list_lh" style="width: 100%;height: 48px; font-size: 10px;overflow:hidden;">
			                <ul>
				              <li>
					            <p>书评书评书评书评</p>
					
				              </li>
				              <li>
					            <p>2222222222222222</p>
					
				              </li>
				              <li>
					            <p>33333333333333
				              </li>
				              <li>
					            <p>44444444444444</p>	
				              </li>
				              <li>
					            <p>99999999999999999999</p>
				              </li>
			               </ul>   
    				</div>	 
    			</div>
    			<div id="book_select">
		            <table>
		               <tr>
		               	<td style="font-size: 3px">索书号</td>
		               	<td style="font-size: 3px">馆藏状态</td>
		               	<td style="font-size: 3px">借出日期</td>
		               	<td style="font-size: 3px">还回日期</td>
		               	<td style="font-size: 3px"></td>
		               </tr>
		               <tr>
		               	<td style="font-size: 5px">B119</td>
		               	<td style="font-size: 5px">入藏</td>
		               	<td style="font-size: 5px"></td>
		               	<td style="font-size: 5px"></td>
		               	<td style="font-size: 5px"><button>预定</button></td>
		               </tr>
		               <tr>
		               	<td style="font-size: 5px">Z133</td>
		               	<td style="font-size: 5px">入藏</td>
		               	<td style="font-size: 5px"></td>
		               	<td style="font-size: 5px"></td>
		               	<td style="font-size: 5px"><button>预定</button></td>
		               </tr>
		            </table>
		        </div>
		        <div id="interest">
		        	<div id="label">
		        	  <span style="font-size: 8px;color: red;position: relative;top: -20%;">你可能感兴趣的书</span>	
		        	</div>
		            <ul>
		            	<li>
		            		<img src="../img/a.jpg" />
		            		<p>巨人的陨落</p>
		            	</li>
		            	<li>
		            		<img src="../img/b.jpg" />
		            		<p>岛上书店</p>
		            	</li>
		            	<li>
		            		<img src="../img/c.jpg" />
		            		<p>游戏人间</p>
		            	</li>
		            	<li>
		            		<img src="../img/d.jpg" />
		            		<p>自由的夜行</p>
		            	</li>
		            </ul>
		        </div>
    		</div>
    	</div>
 	</body>
</html>