RUN {
   allocate channel d1_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d2_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d3_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d4_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d5_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d6_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d7_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d8_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d9_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d10_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d11_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d12_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d13_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d14_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d15_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   allocate channel d16_tape_backup DEVICE TYPE 'SBT_TAPE' PARMS 'ENV=(OSB_WS_PFILE=/data/app/12R1/dbs/scheduled_osbws.ora),SBT_LIBRARY=/data/app/12R1/lib/libosbws.so';
   BACKUP AS COMPRESSED BACKUPSET DEVICE TYPE sbt
   SECTION SIZE 10G
   INCREMENTAL LEVEL 1
   SKIP INACCESSIBLE
   TAG db_bk_l1_&2
   FORMAT '${NODE}/%d_db_l1_%T_%s_%p_%t'
   DATABASE;
   # backup AS COMPRESSED BACKUPSET all archive logs
   BACKUP DEVICE TYPE sbt
   SKIP INACCESSIBLE
   TAG ar_bk_l1_&2
   FORMAT '${NODE}/%d_al_l1_%T_%s_%p_%t'
   ARCHIVELOG ALL DELETE INPUT;
   BACKUP AS COMPRESSED BACKUPSET DEVICE TYPE sbt
   TAG cf_bk_l1_&2
   FORMAT '${NODE}/%d_cf_l1_%T_%s_%p_%t'
   CURRENT CONTROLFILE;
   release channel d1_tape_backup;
   release channel d2_tape_backup;
   release channel d3_tape_backup;
   release channel d4_tape_backup;
   release channel d5_tape_backup;
   release channel d6_tape_backup;
   release channel d7_tape_backup;
   release channel d8_tape_backup;
   release channel d9_tape_backup;
   release channel d10_tape_backup;
   release channel d11_tape_backup;
   release channel d12_tape_backup;
   release channel d13_tape_backup;
   release channel d14_tape_backup;
   release channel d15_tape_backup;
   release channel d16_tape_backup;
 }
