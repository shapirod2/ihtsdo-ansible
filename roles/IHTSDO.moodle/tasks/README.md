# Moodle Setup



To increase the upload size (assumption below being for Ubuntu):

You need to edit the following three settings in your php.ini file located at: /etc/php5/apache2/

Type "sudo nano /etc/php5/apache2/php.ini"
Press Ctrl and W and type "post_max_size"
Change the value to the number of Mb you want your site to accept as uploads
Press Ctrl and W and type "upload_max_filesize"
Change the value to the number of Mb you want your site to accept as uploads
Press Ctrl and W and type "max_execution_time"
Change the value to 600
Press Ctrl and O
Press Ctrl and X
Type sudo /etc/init.d/apache2 restart
Your new file size limit should now appear in Administration > Security > Site Policies > Maximum uploaded file size

