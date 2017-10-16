<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>书单详情</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../css/List_details.css" />
		<script type="text/javascript" src="../js/jquery.js" ></script>
    </head>
    <body>
    	<div id="head">
				<div id="return">
					<a onClick="javascript:history.back(-1);" id="prev"><img src="../img/backto.png" /></a>
				</div>
				<div id="span">
					<span style="font-size:20px;">书单详情</span>
				</div>
		</div>
		<div id="title-content">
			<div id="title">许是你的最爱</div>
			<div id="content">不同的风格，每本都很暖心</div>
			<div id="number">
				<p style="font-size: 15px;"><span style="color: white;">1000</span><span style="color: white;"> 人关注   </span><span style="border-left: 2px solid white;">&nbsp;&nbsp;</span><span style="color: white;">9</span><span style="color: white;">  本小说</span></p>
			</div>
		</div>
		<div class="book-add">
			<div class="book">
			    <div id="image"><img src="../img/b.jpg"/></div>
			    <div class="book_name">
			    	<p>书名</p>
			    </div>
			    <div class="book_text">
			    	<p style="font-size: 15px;"><span>评语:</span><span>好好好</span></p>
			    </div>
			</div>
		</div>
		<div class="book-add">
			<div class="book">
			    <div id="image"><img src="../img/b.jpg"/></div>
			    <div class="book_name">
			    	<p>kko</p>
			    </div>
			    <div class="book_text">
			    	<p style="font-size: 15px;"><span>评语:</span><span>好好好</span></p>
			    </div>
			</div>
		</div>
		<div id="last-level">
			 <p style="font-size: 18px; margin-top: 2%;font-weight: bold;">关注</p>
		</div>
		<script>
			window.onload=function(){
				var book_add=document.getElementsByClassName("book-add");
				var bookname=document.getElementsByClassName("book_name");
				for (var i = 0; i < book_add.length; i++) {
					book_add[i].value=i;
					book_add[i].onclick=function(){
					var name=bookname[this.value].getElementsByTagName("p")[0];
				    $.ajax({
                    type:"post",  //请求方式
                    url:"/users/reg",  //路径
                    data:{
                        bookname:name.innerHTML
                    },
                    success:function(){
                     
                    }
                });
					}
				}
				
				var last_level=document.getElementById("last-level");
				var p=last_level.getElementsByTagName("p")[0];
				
				last_level.onclick=function(){
					if (p.innerText=="关注") {
						$.ajax({
                             type:"post",  //请求方式
                             url:"/users/reg",  //路径
                             data:{
                                guanzhu:p.innerHTML
                               },
                                 success:function(){
                    	            p.innerText="已关注";
                    	            p.style.color="red"
                                 }
                               });
				        } 
					       if (p.innerText=="已关注") {
						          $.ajax({
                                      type:"post",  //请求方式
                                      url:"/users/reg",  //路径
                                      data:{
                                      guanzhu:p.innerHTML
                                     },
                                       success:function(){
                    	                  p.innerText="关注";
                    	                  p.style.color="white"
                                            }
                                          });
					               }
				}
			}
		</script>
 	</body>
</html>