<?php

	##EDIT THIS LINE ##
	#$command = "sudo -u [USER] ../scripts/download.sh ";
	$command = "sudo -u tony ../scripts/download.sh ";
	###################
	$input = "";

	if (isset($_GET['url'])) {
		$input = $_GET['url'];
		$command .= "download ";
	}
	else{
		if (isset($_GET['query'])) {
			$input = $_GET['query'];
			$command .= "search ";
		}

	}

	if($input != ""){
		if(isset($_GET['type'])){
			$command .= "video $input";
			echo shell_exec("$command");
		}else{
			$command .= "audio $input";
			echo shell_exec("$command");
		}
	}
	
	if(isset($_GET['viewprogress'])){
		echo shell_exec("../scripts/show-progress.sh");
	}
	
	if(isset($_GET['viewDownloads'])){
		echo shell_exec("../scripts/view-downloads.sh");
	}

	if(isset($_GET['clearData'])){
		echo "Clearing data";
		shell_exec("../scripts/clearData.sh");
	}


?>