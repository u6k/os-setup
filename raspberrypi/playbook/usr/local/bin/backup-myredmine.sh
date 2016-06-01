#!/bin/sh

#logger -t backup-redmine OPENSHIFT_SSH_ADDRESS=$OPENSHIFT_SSH_ADDRESS
#logger -t backup-redmine OPENSHIFT_MYSQL_HOST=$OPENSHIFT_MYSQL_HOST
#logger -t backup-redmine OPENSHIFT_MYSQL_PORT=$OPENSHIFT_MYSQL_PORT
#logger -t backup-redmine OPENSHIFT_MYSQL_USER=$OPENSHIFT_MYSQL_USER
#logger -t backup-redmine OPENSHIFT_MYSQL_PASS=$OPENSHIFT_MYSQL_PASS

ssh -i /home/u6k/.ssh/id_rsa_openshift $OPENSHIFT_SSH_ADDRESS "mysqldump -h $OPENSHIFT_MYSQL_HOST -P $OPENSHIFT_MYSQL_PORT -u $OPENSHIFT_MYSQL_USER --password=$OPENSHIFT_MYSQL_PASS --lock-all-tables myredmine" | gzip >/mnt/data/archive/backup/Redmine_on_OpenShift/myredmine_`date +%Y%m%d-%H%M%S`.sql.gz
logger -t backup-redmine MyRedmine backup done.
