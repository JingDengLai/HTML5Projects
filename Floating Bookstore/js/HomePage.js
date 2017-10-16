window.onload = function () {
            var container = document.getElementById('container');
            var container_two = document.getElementById('container_two');
            var list = document.getElementById('list');
            var list_two = document.getElementById('list_two');
            var buttons = document.getElementById('buttons').getElementsByTagName('span');
            var buttons_two = document.getElementById('buttons_two').getElementsByTagName('span');
            var prev = document.getElementById('prev');
            var prev_two = document.getElementById('prev_two');
            var next = document.getElementById('next');
            var next_two = document.getElementById('next_two');
            var index = 1;
            var index_two=1;
            var len = 4;
            var animated = false;
            var interval = 3000;
            var timer;


            function animate (offset) {
                if (offset == 0) {
                    return;
                }
                animated = true;
                var time = 300;
                var inteval = 10;
                var speed = offset/(time/inteval);
                var left = parseInt(list.style.left) + offset;

                var go = function (){
                    if ( (speed > 0 && parseInt(list.style.left) < left) || (speed < 0 && parseInt(list.style.left) > left)) {
                        list.style.left = parseInt(list.style.left) + speed + '%';
                        setTimeout(go, inteval);
                    }
                    else {
                        list.style.left = left + '%';
                        if(left>-33.3){
                            list.style.left = -100 * len + '%';
                        }
                        if(left<(-100 * len)) {
                            list.style.left = '-100%';
                        }
                        animated = false;
                    }
                }
                go();
            }
            
            
            function animate_two (offset) {
                if (offset == 0) {
                    return;
                }
                animated = true;
                var time = 300;
                var inteval = 10;
                var speed = offset/(time/inteval);
                var left = parseInt(list_two.style.left) + offset;

                var go = function (){
                    if ( (speed > 0 && parseInt(list_two.style.left) < left) || (speed < 0 && parseInt(list_two.style.left) > left)) {
                        list_two.style.left = parseInt(list_two.style.left) + speed + '%';
                        setTimeout(go, inteval);
                    }
                    else {
                        list_two.style.left = left + '%';
                        if(left>-33.3){
                            list_two.style.left = -100 * len + '%';
                        }
                        if(left<(-100 * len)) {
                            list_two.style.left = '0%';
                        }
                        animated = false;
                    }
                }
                go();
            }

            function showButton() {
                for (var i = 0; i < buttons.length ; i++) {
                    if( buttons[i].className == 'on'){
                        buttons[i].className = '';
                        break;
                    }
                }
                buttons[index - 1].className = 'on';
            }
            
            
             function showButton_two() {
                for (var i = 0; i < buttons.length ; i++) {
                    if( buttons_two[i].className == 'on'){
                        buttons_two[i].className = '';
                        break;
                    }
                }
                buttons_two[index_two - 1].className = 'on';
            }


            function play() {
                timer = setTimeout(function () {
                    next.onclick();
                    play();
                }, 3500);
            }
            
            function play_two() {
                timer = setTimeout(function () {
                  next_two.onclick();
                    play_two();
                }, 2000);
            }
            
            
            
            function stop() {
                clearTimeout(timer);
            }

            next.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 5) {
                    index = 1;
                }
                else {
                    index += 1;
                }
                animate(-100);
                showButton();
            }
            
            next_two.onclick=function(){
            	if (animated) {
                    return;
                }
                if (index_two == 5) {
                    index_two = 1;
                }
                else {
                    index_two += 1;
                }
                animate_two(-100);
                showButton_two();
            }
            
            prev.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 1) {
                    index = 5;
                }
                else {
                    index -= 1;
                }
                animate(100);
                showButton();
            }

            for (var i = 0; i < buttons.length; i++) {
                buttons[i].onclick = function () {
                    if (animated) {
                        return;
                    }
                    if(this.className == 'on') {
                        return;
                    }
                    var myIndex = parseInt(this.getAttribute('index'));
                    var offset = -100 * (myIndex - index);

                    animate(offset);
                    index = myIndex;
                    showButton();
                }
            }
            
            
            for (var i = 0; i < buttons_two.length; i++) {
                buttons_two[i].onclick = function () {
                    if (animated) {
                        return;
                    }
                    if(this.className == 'on') {
                        return;
                    }
                    var myIndex = parseInt(this.getAttribute('index'));
                    var offset = -100 * (myIndex - index);

                    animate_two(offset);
                    index = myIndex;
                    showButton_two();
                }
            }
            

              play();
              play_two();

            
            $(function(){
                 m=0;
                 s=setTimeout(lun,2000);
     
                     function lun(){
                             m+=5;
                             $("#ul1").css("marginTop",-m+"px");
                            if(m==115||m==230||m==345){　　　　
                              setTimeout(lun,2000);
                           }
                            else if(m>=460){
                             m=0;
                             s=setTimeout(lun,2000);
                           }else{
                             s=setTimeout(lun,100);
                           }
                           }  
   
                          });

           
            //数据传输
            function Myfunction(){
	            var aTest=document.getElementById("test");
	            var alist_two=document.getElementById("list_two");
	            var ali=alist_two.getElementsByTagName("li");
	            var abook=document.getElementById("book_two");
	            var ali_two=abook.getElementsByTagName("li")
	            var book_three=document.getElementById("book_three");
	            var aDiv=book_three.getElementsByTagName("div");
	            
	                aTest.onclick=function(){
	    	          var Ph=aTest.getElementsByTagName("span")[0];
	    	          var PhName=Ph.innerText;
		                 $.ajax({             //用ajax来实现不刷新网页的基础上更新数据
                         type:"post",  //请求方式
                         url:"http://localhost:8080/Test/HelloWorld",  //路径
                         data:{PhName:PhName}   //获取input中name为username的值
                         }); 
	                    }
	                
	                 for (var i = 0; i < ali.length; i++) {
	            	   ali[i].onclick=function(){
	            	   	 var bookname=this.getAttribute("value");
	            	   	 $.ajax({             //用ajax来实现不刷新网页的基础上更新数据
                         type:"post",  //请求方式
                         url:"http://localhost:8080/Test/HelloWorld",  //路径
                         data:{bookname:bookname}   //获取input中name为username的值
                         }); 
	            	   }
	                 }
	                 
	                 for (var i = 0; i < ali_two.length; i++) {
	                 	ali_two[i].onclick=function(){
	                 		var bookvalue=this.getAttribute("value");
	                 	 $.ajax({             //用ajax来实现不刷新网页的基础上更新数据
                         type:"post",  //请求方式
                         url:"http://localhost:8080/Test/HelloWorld",  //路径
                         data:{bookvalue:bookvalue}   //获取input中name为username的值
                        }); 
	                 	}
	                 }
	                 
	                 for (var i = 0; i < aDiv.length; i++) {
	                 	aDiv[i].onclick=function(){
	                 		var book_three_name=this.getAttribute("value");
	                 		$.ajax({             //用ajax来实现不刷新网页的基础上更新数据
                            type:"post",  //请求方式
                            url:"http://localhost:8080/Test/HelloWorld",  //路径
                            data:{bookvalue:bookvalue}   //获取input中name为username的值
                        }); 
	                 	}
	                 }
                 }
                 Myfunction();
                 
        }

function loyot(){
	window.location.href='SeparatePage.jsp';
}