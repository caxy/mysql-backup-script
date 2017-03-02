#!/bin/sh

# Set this to the directory you want to store your backups in
basedir='/home/backups/mysql'

# Check to see if it exists. If not, create it
if [ ! -d $basedir ]; then
 mkdir -p $basedir
fi

# Get a list of databases
# Assumes you have your .my.cnf file set up in the user's home directory to automatically log in
for list in `mysql -e 'show databases' | grep -v Database` 

# Loop the databases
do echo $list is a database

# i is set to the number of days you want to keep
i=6 
while [ $i -gt 0 ]  
do
j=`expr $i + 1`

echo $basedir/$list.bk.$i.gz
if [ -r $basedir/$list.bk.$i.gz ] 
then
mv $basedir/$list.bk.$i.gz $basedir/$list.bk.$j.gz
fi

echo $i
i=`expr $i - 1`
done

mysqldump --add-drop-table $list > $basedir/$list.bk.1
gzip $basedir/$list.bk.1

done

echo "Completed"
