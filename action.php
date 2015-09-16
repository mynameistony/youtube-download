<?php

	if (isset($_GET['url'])) {
		$url = $_GET['url'];
		if(isset($_GET['type'])){
			echo shell_exec("sudo -u tony ./download-video.sh ${url}");
		}else{
			echo shell_exec("sudo -u tony ./download.sh $url &");
		}
	}

	if (isset($_GET['query'])) {
		$query = $_GET['query'];
		echo "$query";
		if(isset($_GET['type'])){
			echo shell_exec("sudo -u tony ./search-video.sh ${query}");
		}else{
			echo shell_exec("sudo -u tony ./search.sh ${query} &");
		}
	
	}

	if(isset($_GET['viewprogress'])){
		echo shell_exec("./show-progress.sh");
	}
	
	if(isset($_GET['viewDownloads'])){
		echo shell_exec("./view-downloads.sh");
	}

	if(isset($_GET['clearData'])){
		echo "Clearing data";
		shell_exec("./clearData.sh");
	}


?>