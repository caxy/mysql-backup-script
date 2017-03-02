# mysql-backup-sciprt
A shell script to backup MySQL databases

If you are running a MySQL server and want to make regular backups, the script below will keep the last 7 days' worth of backups in a directory. We're using the "--drop-table" option so that each table is recreated when you import it back in.

Once the script is created, you should add it to crontab so that it can run every night.

Script assumes you have a .my.cnf in your home directory 

```
[client]
user='root'
password='your_root_password_here'
```
