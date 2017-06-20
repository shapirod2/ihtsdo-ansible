You will need to either have a secret/encrypted repository or supply on the command line the following values:

aws_s3accessKey & aws_s3secret

The values will be written into a ~/.aws/confg file 


ansible-playbook -i ~git/ansible-inventory/inventory/vagrantTest otf_mlds_backup.yml --extra-vars "aws_s3accessKey=SOME_KEY_VAL aws_s3secret=SOME_SECRET_VAL"

The default region is us-east-1


echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list


export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
deb https://packages.cloud.google.com/apt cloud-sdk-trusty main
/home/adamf# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -


 gcloud auth activate-service-account read-only-user@ihtsdo-automation-tooling.iam.gserviceaccount.com --key-file ro.json
Activated service account credentials for: [read-only-user@ihtsdo-automation-tooling.iam.gserviceaccount.com]

gcloud config set project ihtsdo-automation-tooling

gcloud dns record-sets list -z=ihtsdotools

/usr/bin/gcloud
