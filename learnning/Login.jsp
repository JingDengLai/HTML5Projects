<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
        <script type="text/javascript" src="js/jquery.js" ></script>
        <style>
        	html,body{
        		width: 100%;
        	}
        	*{
        		margin: 0;
        		padding: 0;
        	}
        	#body{
        		width: 30%;
        		height: 400px;
        		border: 1px solid black;
        		margin-left: 30%;
        		margin-top: 80px;
        	}
        	#body #title{
        		width: 100%;
        		height: 40px;
        	}
        	#body #title div{
        		float: left;
        		width: 50%;
        		text-align: center;
        		padding: 8px 0 8px 0;
        		font-size: 20px;
        		cursor: pointer;
        	}
        	#body #content{
        		width: 100%;
        		height: 360px;
        		overflow: hidden;
        		position: relative;
        	}
        	#body #content #page{
        		width: 200%;
        		height: 100%;
        		position: absolute;
        		left: 0;
        		transition: all 1.5s; 
        	}
        	#body #content #page div{
        		float: left;
        		height: 360px;
        		width: 50%;
        	}
        	.login form{
        	      width: 100%;
        	}
        	.login input{
        		display: block;
        		height: 30px;
        	}
        	.login #user,#password{
        		width: 80%;
        		margin: 40px 0 0 10%;
        	}
        	.login #button{
        		width: 20%;
        		margin: 40px auto;
        	}
        	.register input{
        		height: 30px;
        	}
        	.register #register-user,#register-password,#register-repassword{
        		width: 70%;
        		margin: 40px 0 0 10%;
        	}
        	.register #register-button{
        		display: block;
        		width: 20%;
        		margin: 40px auto;
        	}
        </style>
    </head>
    <body>
    	<div id="body">
    		<div id="title">
    			<div id="login" style="background-color: #E0E0E0;">登录</div>
    			<div id="register">注册</div>
    		</div>
    		<div id="content">
    			 <div id="page">
    			 	<div class="login" style="background-color: #E0E0E0">
    			 		<form action="" method="post">
    			 			<input type="text" name="user" id="user" placeholder="请输入用户名"/>
    			 			<input type="password" name="password" id="password" placeholder="请输入密码"/>
    			 			<input type="submit" value="登录" id="button"/>
    			 		</form>
    			 	</div>
    			 	<div class="register">
    			 		<input type="text" name="user" id="register-user" placeholder="请输入用户名"/><span style="font-size: xx-small;color: red;" id="user-text"></span>
    			 		<input type="password" name="password" id="register-password"  placeholder="请输入密码"/>
    			 		<input type="password" name="repassword" id="register-repassword" placeholder="请再次输入密码"/><span style="font-size: xx-small;color: green;" id="repassword-text"></span>
    			 		<input type="submit" name="button" value="注册" id="register-button" />
    			 	</div>
    			 </div>
    		</div>
    	</div>
    	<script>
    		window.onload=function(){
    			
    			var page=document.getElementById("page");
                var rp=document.getElementsByClassName("register")[0];
                var lg=document.getElementsByClassName("login")[0];
    			var login=document.getElementById("login");
    			var register=document.getElementById("register");
    			var register_user=document.getElementById("register-user");
    			var register_password=document.getElementById("register-password")
    			var register_repassword=document.getElementById("register-repassword");
    			var register_button=document.getElementById("register-button");
    			
    			function Register(){
    				    register.onclick=function(){
    				 	page.style.left="-100%";
    				 	rp.style.backgroundColor="#E0E0E0";
    				 	register.style.backgroundColor="#E0E0E0";
    				 	login.style.backgroundColor="";
    				 	lg.style.background="";
    				 	
    				 }
    			}
    			function Login(){
    				login.onclick=function(){
    					page.style.left="0";
    					login.style.backgroundColor="#E0E0E0";
    					lg.style.backgroundColor="#E0E0E0";
    					rp.style.backgroundColor="";
    				 	register.style.backgroundColor="";
    				}
    			}
    			Register();
    			Login();
    			
    			register_user.onblur=function(){
    				var val=register_user.value;
    				var user_text=document.getElementById("user-text");
    				if (val==""||val==null) {
    					 user_text.innerText="用户名不能为空";
    				} else{
    					 $.ajax({
                             type:"post",  //请求方式
                              url:"/users/reg",  //路径
                             data:{
                                 username:val
                                },
                                  success:function(data){
                                      user_text.innerText="ss";
                                    }
                              });
    				    }
    			}
    			
    			register_repassword.onblur=function(){
    				var password_=document.getElementById("register-password").value;
    				var val=register_repassword.value;
    				var password_text=document.getElementById("repassword-text");
    				if(password_!=""&&val!=""&&password_==val){
    					password_text.innerText="密码正确";
    				}else if(password_==""&&val==""){
    					password_text.innerText="密码不能为空";
    				}else{
    					password_text.innerText="两次密码不同";
    				}
    			}
    			
    			register_button.onclick=function(){
    			    var register_user_value=register_user.value;
    			    var register_password_value=register_password.value;
    			    var register_repassword_value=register_repassword.value;
    			    $.ajax({
                             type:"post",  //请求方式
                              url:"/users/reg",  //路径
                             data:{
                                 username:register_user_value,
                                 password_val:register_password_value,
                                 repassword:register_repassword_value
                                },
                                  success:function(data){
                                      user_text.innerText="ss";
                                   }
                              });
    			}
    		}
    	</script>
 	</body>
</html>