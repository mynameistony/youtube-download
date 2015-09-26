#Tony's Youtube Downloader 

##This is just a pretty(ish) web interface for youtube-dl

##Dependencies:
-youtube-dl (duh)
-apache2
-php5
-soundconverter

##Quick install guide

1. Get the source code:
	`git clone https://github.com/mynameistony/youtube-download.git`

2. Install dependencies:
	`sudo apt-get install apache2 php5 soundconverter`

	-Install youtube-dl from their website for best results

3. Modify /webpage/action.php to use your user

4. Modify your sudoers file to allow the download script to run as your regular user:

	`sudo visudo` or `sudo nano /etc/sudoers`

	Add the following line, replacing user with your username:

	`www-data    ALL=(user) NOPASSWD: /path/to/youtube-download/scripts/download.sh`

5. Make Apache serve the /webpage folder from my package
	`sudo nano /etc/apache2/sites-available/000-default.conf`

	Change the "DocumentRoot" directive to point to the package

6. Restart the web server
	`sudo service apache2 restart`

7. Point your browser to 'localhost' or the servers IP address and enjoy :)

**Notes:

	-Steps 3 & 4 are so the songs/videos are downloaded as your user and you don't need to deal with weird permissions later on.