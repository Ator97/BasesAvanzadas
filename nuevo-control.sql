--!/bin/bash
-- @Autor: Montecillo Sandoval Jose Alejandro, Oscar Gutierrez Castillo
-- @Fecha: 25 de Noviembre de 2019
-- @Descricción: Creaciòn de un nuevo control file
startup nomount
create controlfile reuse database mocabd3 resetlogs noarchivelog
maxlogfiles 16
maxlogmembers 3
maxdatafiles 1024
maxinstances 1
maxloghistory 292
logfile
group 1 (
'/u01/disk1/redo01a.log',
'/u01/disk2/redo01b.log',
'/u01/disk3/redo01c.log'
) size 100m blocksize 512,
group 2 (
'/u01/disk1/redo02a.log',
'/u01/disk2/redo02b.log',
'/u01/disk3/redo02c.log'
) size 100m blocksize 512,
group 3 (
'/u01/disk1/redo03a.log',
'/u01/disk2/redo03b.log',
'/u01/disk3/redo03c.log'
) size 100m blocksize 512,
group 4 ( 
	'/u01/disk1/redo04a.log',
	'/u01/disk2/redo04b.log',
	'/u01/disk3/redo04c.log'
	) size 100m blocksize 512
datafile
'/u01/app/oracle/oradata/MOCABD3/system01.dbf',
'/u01/app/oracle/oradata/MOCABD3/sysaux01.dbf',
'/u01/app/oracle/oradata/MOCABD3/undotbs01.dbf',
'/u01/app/oracle/oradata/MOCABD3/users01.dbf',
'/u01/app/oracle/oradata/MOCABD3/usertbs01.dbf',
'/u01/app/oracle/oradata/MOCABD3/indx01.dbf',
'/u01/app/oracle/oradata/MOCABD3/apps01.dbf',
'/u01/app/oracle/oradata/MOCABD3/blob01.dbf',
'/u01/app/oracle/oradata/MOCABD3/partition01.dbf'
character set al32utf8
;


recover database using backup controlfile
alter database open resetlogs