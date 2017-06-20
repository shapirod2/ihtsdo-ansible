Moodle install:

to increase the file upload limits see:

https://docs.moodle.org/23/en/File_upload_size

Check upload filesize (php)
 php.ini: 
post_max_size = 400M
upload_max_filesize = 400M
max_execution_time = 600
Check config.php - name (after install to point to elearning etc.)
Check cron job is set up. ( https://docs.moodle.org/33/en/Cron )


Should set the above automatically however... 
- the php.ini depends on the php install
- the config.php name is correct up to the point when you want to make it live.
- the cron job is best run manually first to check all is ok.... and then set to run 
  automatically