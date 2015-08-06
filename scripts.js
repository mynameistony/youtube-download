function search(){
	showLogs();

	var query = document.getElementById("query").value;

	var d = new XMLHttpRequest();
	d.open( "GET", "/action.php?query=" + query ,true);
	d.send(null);

	document.getElementById("query").value = "";

}

function download(){
	showLogs();

	var url = document.getElementById("url").value;
	//alert(url);
	var d = new XMLHttpRequest();
	d.open( "GET", "/action.php?url=" + url,true);
	d.send(null);

	document.getElementById("url").value = "";
}

function showLogs(){
	showProgress();
	setInterval("showProgress()", 1000);
	window.location = "/#progress";
}

function showProgress(){
	var url = document.getElementById("url").value;
	var h = new XMLHttpRequest();
	h.onreadystatechange=function(){
		if (h.readyState==4 && h.status==200){
    		document.getElementById("progress").innerHTML=h.responseText;
    	}
  	}	
	h .open( "GET", "/action.php?viewprogress=true" + url,true);
	h.send(null);

}

function showDownloads(){
	viewDownloads();
	setInterval("viewDownloads()",1000);
}

function viewDownloads(){
	var h = new XMLHttpRequest();
	h.onreadystatechange=function(){
		if (h.readyState==4 && h.status==200){
    		document.getElementById("downloads").innerHTML=h.responseText;
    	}
  	}	
	h .open( "GET", "/action.php?viewDownloads=true" + url,true);
	h.send(null);

}
