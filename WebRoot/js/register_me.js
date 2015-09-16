
		window.onload=function(){
			showstyle('idicon',false);
			showstyle('emailicon',false);
			showstyle('pwdicon',false);
			showstyle('pwdicon1',false);
			}
	
			var xhr;
			var useridok=false;
			var useremailok=false;
			var passwordok=false;
			var checkboxok=true;
			
			function  getUserInfo(){
				var value=document.getElementById("userId").value;
				console.log("value="+value);
					xhr=createXHR();
					xhr.open("POST","UserRegisterServlet",true);
					xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
					xhr.onreadystatechange=update;
					xhr.send("userId="+value+"&userSearch=1");
			}
	
	function update(){
		if(xhr.readyState == 4){//����״̬��   0,1,2,3,4  
			if(xhr.status == 200){//Http ״̬��
				var result=xhr.responseText;
				if(result==0){
					showstyle('info',true);
					showicon('idicon',false);
					showstyle('idicon',true);
				}else if(result==1){
					showstyle('info',false);
					showicon('idicon',true);
					showstyle('idicon',true);
					useridok=true;
				}
			} else if (xhr.status==404){
		         alert("Not found");
			} else{
		         alert("Error: status code is " + request.status);
			}
		}
	}

	function ischeckemail(){
	var email = document.getElementById("email").value;
	 if (email != "") {
	   var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	  isok= reg.test(email );
	       if (!isok) {
		       showstyle('emailinfo',true);
		       showicon("emailicon",false);
		       showstyle('emailicon',true);
	            document.getElementById("email").focus();
	            return false;
	        }
	       	showstyle('emailinfo',false);
	       	showicon("emailicon",true);
	       	showstyle('emailicon',true);
	       	useremailok=true;
		 };
	}

	function ischeckpwd(){
		var pwd1=document.getElementById('pwd1').value;
		var pwd=document.getElementById("pwd").value;
		if(pwd==pwd1){
			showstyle('pwdinfo',false);
			showicon('pwdicon',true);
			showstyle('pwdicon',true);
			passwordok=true;
			return true;	
		}else{
			showstyle('pwdinfo',true);
			showicon('pwdicon',false);
			showstyle('pwdicon',true);
			passwordok=false;
			return false;
		}
			
	}
	function ischeckbox(){
		checkboxok=document.getElementById("checkbox").checked;
		console.log(checkboxok);
	}

	function ischeck(){

		if(checkboxok&&useremailok&&useridok&&passwordok){
			alert("register success.");
			return true;
		}else{
			alert("something input error");
			return false;
		}
	}


	function showicon(name,showyes){
		if(showyes==true){
			document.getElementById(name).setAttribute("class","icon ticker");//��ȷ��ͼ
		}else if(showyes==false){
			document.getElementById(name).setAttribute("class","icon into");//���ͼ
		}
	}

	function showstyle(name,showyes){
		if(showyes==true){
			document.getElementById(name).style.display="block";
		}
		else if(showyes==false){
			document.getElementById(name).style.display="none";
		}
	}
	