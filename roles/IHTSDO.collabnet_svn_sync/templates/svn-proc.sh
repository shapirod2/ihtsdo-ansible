#!/usr/bin/env bash

# The following variables should be set by editing this script before running it:
# The base url of the svn repo
#base_dir="/home/adamf/svn/repos/old"
base_dir="/opt/svnrepo/current"
# A list of all repos to create and then sync
# Expecting format of a repeating list of :
#name
#url
#line (could be empty or sep vals etc to separate items e.g.
#dwfa
#https://csfe.aceworkspace.net/svn/repos/dwfa
#--

repo_list="./missing"

svn_user="{{ svn_user }}"
svn_pw="{{ svn_pw }}"

count=0
name=""
url=""

svnowner="www-data"

svnadmin=/usr/bin/svnadmin
svnsync=/usr/bin/svnsync
svn=/usr/bin/svn

# Prints a message to stdout with the current date and time.
echo_date() {
	echo -e "[`date +\"%Y-%m-%d %H:%M:%S\"`] $@"
}

# Prints an error message to stderr and exits the script with a non-zero status.
error_exit() {
	echo -e "[`date +\"%Y-%m-%d %H:%M:%S\"`] $@" >&2
	exit 1
}

# Main script starts here.
main() {
	echo_date "----------------------------"
	check_arguments
        checkbasedir
	iteratelist
	exit 0
}

check_arguments() {

	if [ "x$base_dir" = "x" ]; then
		error_exit "Please set the variable base_dir before running this script. Exiting with error."
	fi

	if [ "x$repo_list" = "x" ]; then
		error_exit "Please set the variable repo_list before running this script. Exiting with error."
	fi

}

checkbasedir(){
echo "Checking/Creating base_dir val = "$base_dir
mkdir -p $base_dir
}

iteratelist(){
cat $repo_list|while read line; do
#echo "Count 1 = "$count
count=$[$count +1]
#echo "Count 2 = "$count
# If counter = 0  the line = name
if [ $count -eq 1 ]; then
f_name=$line
fi
#if counter =1 then line = url
if [ $count -eq 2 ];
then
f_url=$line
fi
# if counter = 2 then call the add repo 
if [ $count -eq 3 ]; then
#echo "Adding Repo name =  "$f_name " :  url = "$f_url ;
addrepo
count=0
fi
done
}



addrepo(){
echo "Add repo Adding Repo name =  "$f_name " :  url = "$f_url ;
#count = 0
echo "***********************";
createrepo
add_prerevpropchange
initsvnsync
svnsync_data
setrepoowner
#svn info $base_dir/$line --username $svn_user --password $svn_pw

}

setrepoowner(){
echo "Setting owner to " $svnowner " for repo "$base_dir/$f_name
chown -R $svnowner:$svnowner $base_dir/$f_name
}

createrepo(){
echo "create repo "$base_dir/$f_name
$svnadmin create $base_dir/$f_name
}

add_prerevpropchange(){
echo "prerevpropchange $base_dir/$f_name/hooks/pre-revprop-change"
echo '#!/bin/sh' > $base_dir/$f_name/hooks/pre-revprop-change
chmod 755 $base_dir/$f_name/hooks/pre-revprop-change
}

initsvnsync(){
echo "svnsync init file://$base_dir/$f_name $f_url"
$svnsync init file://$base_dir/$f_name $f_url --username $svn_user --password $svn_pw
}


svnsync_data(){
echo "svnsync_data $base_dir/$f_name"
$svnsync --non-interactive sync file://$base_dir/$f_name --username $svn_user --password $svn_pw
}

postlog(){

}


# Ensures that only a single instance is running at any time
LOCKFILE="./instance.lock"

(
        flock -n 200 || error_exit "Another backup script is already running. Exiting with error."
        trap "rm $LOCKFILE" EXIT
        main
) 200> $LOCKFILE
