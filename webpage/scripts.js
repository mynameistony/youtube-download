var pinterval;
var dinterval;

function search(type){
	showLogs();

	var query = document.getElementById("query").value;

	var d = new XMLHttpRequest();

	if(type=="video"){
		d.open( "GET", "/action.php?query=" + query + "&type=video" ,true);
	}else{
		d.open( "GET", "/action.php?query=" + query ,true);	
	}
	
	
	d.send(null);

	document.getElementById("query").value = "";

}

function download(type){
	showLogs();

	var url = document.getElementById("url").value;
	//alert("hey");
	var d = new XMLHttpRequest();
	if(type=="video")
	{
		d.open( "GET", "/action.php?url=" + url + "&type=video",true);
	}
	else
	{
		d.open( "GET", "/action.php?url=" + url,true);		
	}


	d.send(null);
	document.getElementById("url").value = "";
}

function showLogs(){
	showProgress();
	pinterval = setInterval("showProgress()", 5000);
	document.getElementById("recentButton").innerHTML = "Hide";
	document.getElementById("progress").innerHTML = "Loading...";
	document.getElementById("recentButton").onclick = hideLogs;
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
	setInterval("viewDownloads()",10000);
	window.location = "/#downloads";
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

function hideLogs(){
	document.getElementById("progress").innerHTML = "";
	document.getElementById("recentButton").innerHTML = "View recent downloads";
	document.getElementById("recentButton").onclick = showLogs;	
	clearInterval(pinterval);
}