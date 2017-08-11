
run as root while setting the inventory (unless boto is installed)

sudo ansible-playbook -i ansible-inventory-master/dev -e "host=va.ihtsdotools.org" ihtsdo-ansible/aws-ec2.yml 