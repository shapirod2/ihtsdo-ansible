For Backup to aws:
You will need to either have a secret/encrypted repository or supply on the command line the following values:

s3accessKey & s3secret

The values will be written into a ~/.aws/confg file 


ansible-playbook -i ~git/ansible-inventory/inventory/vagrantTest crowd.yml --extra-vars "s3accessKey=SOME_KEY_VAL s3secret=SOME_SECRET_VAL"

The default region is us-east-1