window.onload=function(){
	var read=document.getElementById("read");
	var booksearch=document.getElementById("booksearch");
	var add=document.getElementById("add");
	var last_level=document.getElementById("last-level");
	
	
	add.onclick=function(){
		read.style.display="none";
		booksearch.style.display="block";
	}
	
	last_level.onclick=function(){
		read.style.display="block";
		booksearch.style.display="none";
	}
	
	
	var add_button=document.getElementsByClassName("add-button");
	var img=document.getElementsByClassName("image");
	var name=document.getElementsByClassName("name");
	var book_add=document.getElementById("book-add");
	var book=document.getElementsByClassName("book");
	var p=book_add.getElementsByTagName("p");
	for (var i = 0; i < add_button.length; i++) {
		add_button[i].value=i;
		add_button[i].onclick=function(){
			if (this.innerText=="已添加") {
                for (var j = 0; j < p.length; j++) {
                	p[j].id=j;
                   if(p[j].innerHTML==name[this.value].innerHTML){
                   	book_add.removeChild(book[j]);
                   }
                }
             this.style.backgroundColor="";
			this.style.color="green";
			this.innerText="添加"; 
			} else{
		var div=document.createElement("div");
			div.setAttribute("class","book");
			div.innerHTML=
			             '<div id="image">'+img[this.value].innerHTML+'</div>'+
			    		'<div id="book_name">'+
			    			'<p>'+name[this.value].innerHTML+'</p>'+
		    			'<div class="delete">X</div>'+
			    		'</div>'+
			    		'<div class="book_text">'+
			    			'<textarea placeholder="说一下这本书的最大特点吧"></textarea>'+
			    		'</div>';
			book_add.appendChild(div);
			this.style.backgroundColor="#D0D0D0";
			this.style.color="#808080";
			this.innerText="已添加";
			}			
		}
	}
	
	var xd=document.getElementsByClassName("delete");
	for (var x = 0; x < xd.length; i++) {
		xd[i].onclick=function(){
			alert(xd[i].innerHTML);
		}
	}
	
	
	var send=document.getElementById("send");
	var p=book_add.getElementsByTagName("p");
	var textArea=book_add.getElementsByTagName("textarea");
	send.onclick=function(){
		var title=document.getElementById("title").getElementsByTagName("input")[0].value;
	    var content=document.getElementById("content").getElementsByTagName("textarea")[0].value;
		var arr=[];
		var text_ar=[];
		for (var i = 0; i < p.length; i++) {
			arr.push(p[i].innerHTML);
			text_ar.push(textArea[i].value);
		}
		 $.ajax({
                    type:"post",  //请求方式
                    url:"/users/reg",  //路径
                    data:{
                        title:title,
                        content:content,
                        arr:arr,
                        text_ar:text_ar
                    },
                    success:function(){
                    	alert("成功")
                        window.location = "MyList_Page.jsp";
                    }
                });

	}
	
}
