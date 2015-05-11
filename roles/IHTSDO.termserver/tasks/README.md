# This Script will install and deploy the IHTSDO Terminology server.

## Optional settings:

**set_db_content** - options True or False
This tells the script whether or not to set (or re-set is already extant) the 
database content including the indexes etc from a back up.

In essence it tells the main script to include the setdbcontent.yml

- include: setdbcontent.yml
  when: "set_db_content == True"
  
This should default to false.  
  
If you are looking to do this then there are a number of settings which must be supplied/set  
  
The 2 most basic ones are:

The base URL where the backup zip file should be downloaded from
**import_zip_base_url**: "https://s3.amazonaws.com/uat-term.backup.ihtsdo/"

The import file filname (also the folder name when zip is unzipped)
**import_term_serv_filename**: "snowowl_uat-term_20150508_1349"  

Then there is an optional setting:

**force_zip_download** - options True or False
This deletes the downloaded data folder and thus sparks a fresh download & fresh re-install.

e.g. within setdbcontent.yml
  
- name: Remove datadir so as to spark complete rebuild
  file: path={{import_term_serv_base_dir}} state=absent
  when: "force_zip_download == True"   



## Points to note

(1) If not running with 16 GB of ram the terminology server will fail to start as the JVM will not be able to gain sufficient memory

go to /opt/termserver/bin/dmk.sh
Change:
-Xms5g \
-Xmx10g \

to suit the machinery you are running on. Generally for basic development :
-Xms1g \
-Xmx2g \

Will do.





