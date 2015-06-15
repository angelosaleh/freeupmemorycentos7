#!/usr/bin/sh

echo " --------- "
echo `date`
echo "running process to free up memory"
freecmd=`free -m | grep Mem:`
counter=0

for i in $(echo $freecmd | tr " " "\n")
do
  
  if [ "$counter" == 3 ] 
  then
  
    if [ "$i" -lt 1000 ]
    then
      echo "This is the free memory $i and is bad"
      echo "freeing up memory ..."
      echo 1 > /proc/sys/vm/drop_caches
      echo 2 > /proc/sys/vm/drop_caches
      echo 3 > /proc/sys/vm/drop_caches
    else
      echo "This is the free memory $i and is ok"
    fi
    exit 0
  fi
  
  let "counter++"
done
