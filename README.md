## File Browser
<br>
https://filebrowser.xyz/installation#docker<br>
<br>
<br>
Username: admin<br>
Password: admin<br>
<br>
https://filebrowser.xyz/
<br>
<br>
crontab -l
<code>
### Scanner file : Delete files 3 days ago
  01 01 * * *	/app/filebrowser/file_delete.sh > /dev/null 2>&1
<code>
