<link rel="stylesheet" href="/style.css">
<script src="/scripts.js" type="text/javascript"></script>
<title>Youtube Downloader</title>
<body>
<center>
<p>
<a href="/">Refresh</a>
</p>
<h1>
Youtube Audio Downloader
</h1>
<p>
<?php
	echo shell_exec("ls downloads | wc -l");
	echo " downloads so far :D";
?>
</p>
<p> <input class="textbox" type="text" id="url" placeholder="Paste a youtube URL here"> </p>
<p> <button class="button" onclick="download()">Download</button> </p>
<p>Or</p>
<p> <input class="textbox" type="text" id="query" placeholder="Type a track and artist here"> </p>
<p>
This will automatically download the first result of your search. (Works very well)<br>
<b>Only</b> use alpha-numeric characters in the search or it will break and not download your song :)<br>
<a href="/why.html">Here's why</a>
</p>
<p> <button class="button" onclick="search()">Search & Download</button> </p>
<p>
	Then wait for a link to appear below, then right click( or long press) and click Save Link.
</p>
<p><h1>Progess/Downloads</h1></p>
<p>
<button class="button" onclick="showLogs()">View Progress</button>
</p>
<p id="progress">
</p>
<button class="button" onclick="showDownloads()">View Downloads</button>
</center>

<p id="downloads">
</p>
</body>
