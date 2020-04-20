#!/bin/sh

source /home/oracle/.bash_profile
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
TAG=$$

cd $SCRIPT_DIR
alias SEDCM="/bin/sed -e 's#VHOME#${ORACLE_HOME}#g;s#VSID#${DB}#g' "
for DB in `awk -F: '/^[^#]/ { print $1 }' /etc/oratab | grep -v ASM`; do
  SEDCM ${SCRIPT_DIR}/dbs/osbws.ora.template > ${ORACLE_HOME}/dbs/osbws${DB}.ora
  echo "configure channel device type sbt parms 'SBT_LIBRARY=${ORACLE_HOME}/lib/libosbws.so BLKSIZE=1048576 SBT_PARMS=(OSB_WS_PFILE=${ORACLE_HOME}/dbs/osbws${DB}.ora)';" > /home/oracle/scr/rman/scripts/config_${DB}_s3.scr
  echo "CONFIGURE DEVICE TYPE sbt PARALLELISM 16 BACKUP TYPE TO BACKUPSET;" >> /home/oracle/scr/rman/scripts/config_${DB}_s3.scr


 cp /home/oracle/deploy_s3/rman/*.scr /home/oracle/scr/rman/scripts
cp /home/oracle/deploy_s3/rman/*.sh /home/oracle/scr/rman
cp /home/oracle/deploy_s3/dbs/*.ora $ORACLE_HOME/dbs

# set the hostname to update the S3 backup directory path
  NODE=`hostname -s`
# Register the database in the catalog

##rman target / catalog rman/gomab1914@pdorarman01.css.local/rman01 @/home/oracle/scr/rman/scripts/register.scr

#enable S3 backup configurations for the database in the catalog
##rman target / catalog rman/gomab1914@pdorarman01.css.local/rman01 @/home/oracle/scr/rman/scripts/config_${DB}_s3.scr
rman target / @/home/oracle/scr/rman/scripts/config_${DB}_s3.scr


  ORACLE_SID=${DB}
#  rman target / @/home/oracle/scr/rman/scripts/config_${DB}_s3.scr

done

if [[ -d ${ORACLE_HOME}/dbs/osbws_wallet ]]; then
  rm -rf ${ORACLE_HOME}/dbs/osbws_wallet
fi
cp -rp /home/oracle/deploy_s3/dbs/osbws_wallet ${ORACLE_HOME}/dbs
cp -rp /home/oracle/deploy_s3/lib/* ${ORACLE_HOME}/lib

cd ${ORACLE_HOME}/lib
ln -s $ORACLE_HOME/lib/libosbws.so libobk.so
