

For use in development/reporting you will need to let non-local machines into 
the postgresql database

edit postgresql.conf and set

listen_addresses ='*'

edit pg_hba.conf 
Assuming a local network of 192.168.0.*:

host all all 192.168.0.0/24 md5
