# IHTSDO Development set up

Sets up
Base level:
java, nginx, the ihtsdo snapshot repositories

Basic Tools:

maven, git, subversion

If install_js: True 
Javascript frameworks/tools:

ruby-full
nodejs
latest npm
bower grunt grunt-cli
compass

To test:

run the ansible script then ssh onto the target machine

cd ~
mkdir git
cd git
git clone https://github.com/IHTSDO/angular-app-template.git
cd angular-app-template
mvn clean install