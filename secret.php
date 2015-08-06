<?php
	if(isset($_GET["pattern"])){
		if(isset($_GET["message"])){
			$message = $_GET["message"];
			if($message != ""){
				shell_exec("./updateTime.sh $message");
				echo "Updating message with pattern";
			}
		}
	}else{
		if(isset($_GET["message"])){
			#if(isset($_GET["color"])){
				$message = $_GET["message"];
				#$color = $_GET["color"];
				shell_exec("./updateTime.sh $message");
				echo "Updating message";
			#}
		}
	}
?>
<form action="/secret.php">
<p>
Don't use any weird characters, this is still very fragile :)
</p>
<p>
<input type="text" name="message" placeholder="Type a message :)">
</p>
<!--
And a color
<p>
<input type="color" name="color" >
</p>
or

<p>
<input type="radio" name="pattern">Pulse Heart
</p>
-->
<input type="submit" value="Update">
</form>