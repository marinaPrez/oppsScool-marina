#!/bin/bash
#add fix to exercise6-fix here


#list all files, all arguments except last:

if (( $# < 2 )) ; then
    echo "You need to provide a minimum of 2 arguments"
    exit 1
fi


blocks=()
files_sum=0

#go over all arguments except last
for i in ${@:1:$#-1}; 
  do :
     blocks+=("$i")
     bytes=$(wc -c $i | awk '{print $1}')
     files_sum=$((files_sum + bytes))
  done

files_list="${blocks[@]}"

#dest folder is the last argument:
dest_folder="${@: -1}"

# check on which node we are running
this_server=`hostname`


case $this_server in
	       server1)      dest_server="server2" ;;
               server2)      dest_server="server1" ;;
esac


scp $files_list $dest_server:$dest_folder

#print sum of all files
echo $files_sum
