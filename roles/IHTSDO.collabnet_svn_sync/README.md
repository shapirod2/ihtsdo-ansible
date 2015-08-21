# Synchronizes the subversion between an existing copy and colabnet

The following is or a debian/ubuntu based linux

1) First you will need to install the teamforge cli:

Install Alien: sudo apt-get install alien

Get the rpm:
wget https://ctf.open.collab.net/sf/frs/do/downloadFile/projects.labs/frs.teamforge_cli.teamforge_cli_version_1_8_0_0/frs21446?dl=1

Transform rpm into deb: sudo alien teamforge_cli-1.8.0.0-5183.x86_64.rpm

Install deb: sudo dpkg -i teamforge-cli_1.8.0.0-5184_amd64.deb

Add ctf onto path: 
  Edit environment file : sudo nano nano /etc/environment
  Add the following to the PATH statement: :/opt/collabnet/teamforge/add-ons/teamforge_cli/bin"
  save and exit
  
  
2) Test ctfcli/ set up as user
   
   type ctf & you should enter the ctf shell.
   In the shell type : server add ace https://csfe.aceworkspace.net
   You should add your user name & password....as that allows the scripts to hook into without any further intervention.
   
   NOTE not scripted as in theory this is a one off & it is installed on   svn.ihtsdotools.org
   
3) This script makes to following assumptions:

3.1) You have already created a repository at  /opt/svnrepo/current where any new/changed repositories will go.

3.2) You have installed & tested the teamforge cli above & are/have used a user with admin privileges on team forge.


ctf --script allprepourl.ctf > rep.txt
cat rep.txt | grep -o '/svnroot/.*' | sort | sed 's/\/svnroot\///g' > rep2.txt
grep -F -x -v -f svninfo.txt rep2.txt > rep3.txt

   
   
   
 
