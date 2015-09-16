/*create Ajax object XMLHttpRequest */
function createXHR(){
	var xhr;
	if(window.XMLHttpRequest){
		xhr=new XMLHttpRequest();
	}
	else{
		xhr=new ActiveXObject("Mircrosoft.XMLHTTP");
	}
	return xhr;
}