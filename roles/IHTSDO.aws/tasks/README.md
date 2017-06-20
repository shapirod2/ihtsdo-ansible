You will need to either have a secret/encrypted repository or supply on the command line the following values:

aws_s3accessKey & aws_s3secret

The values will be written into a ~/.aws/confg file 


ansible-playbook -i ~git/ansible-inventory/inventory/vagrantTest otf_mlds_backup.yml --extra-vars "aws_s3accessKey=SOME_KEY_VAL aws_s3secret=SOME_SECRET_VAL"

The default region is us-east-1