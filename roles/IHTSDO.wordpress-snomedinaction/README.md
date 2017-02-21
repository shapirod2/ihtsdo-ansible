moving SIA


in order to change snomedinaction will need to change db settings/values : 

download 
wget https://github.com/interconnectit/Search-Replace-DB/archive/master.zip

unzip it.
  
get hard ip number/or new address etc. henceforth called "NEWVAL"
NOTE:s need to check if http or https assumption here is http

login to msql 
use wordpress

update wp_options set option_value = 'http://NEWVAL' where option_name = 'siteurl';
update wp_options set option_value = 'http://NEWVAL' where option_name = 'home';

exit mysql

then using script here: ./Search-Replace-DB-master

php srdb.cli.php -h localhost -n wordpress -u wordpress -p PASSWORD -s http://159.203.89.234 -r http://NEWVAL
php srdb.cli.php -h localhost -n wordpress -u wordpress -p PASSWORD -s http://www.snomedinaction.org -r http://NEWVAL


