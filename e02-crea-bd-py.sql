startup nomount 
create database mocabd3 
user sys identified by sys_password
user system identified by system_password
logfile group 1 ( 
	'/u01/disk1/redo01a.log',
	'/u01/disk2/redo01b.log'
	) size 100m blocksize 512,
group 2 (
	'/u01/disk1/redo02a.log',
	'/u01/disk2/redo02b.log
	) size 100m blocksize 512,
group 3 ( 
	'/u01/disk1/redo03a.log',
	'/u01/disk2/redo03b.log'
	) size 100m blocksize 512

maxloghistory 1 
maxlogfiles 16
maxlogmembers 3
maxdatafiles 1024
character set AL32UTF8
national character set AL16UTF16
extent management local 
datafile '/u01/app/oracle/oradata/MOCABD3/system01.dbf'
size 700m reuse autoextend on next 10240k maxsize unlimited
sysaux datafile '/u01/app/oracle/oradata/MOCABD3/sysaux01.dbf'
size 550m reuse autoextend on next 10240k maxsize unlimited
default tablespace users
datafile '/u01/app/oracle/oradata/MOCABD3/users01.dbf'
size 500m reuse autoextend on maxsize unlimited
default temporary tablespace tempts1
tempfile '/u01/app/oracle/oradata/MOCABD3/temp01.dbf'
size 20m reuse autoextend on next 640k maxsize unlimited
undo tablespace undotbs1
datafile '/u01/app/oracle/oradata/MOCASBD3/undotbs01.dbf'
size 200m reuse autoextend on next 5120k maxsize unlimited
user_data tablespace usertbs
datafile '/u01/app/oracle/oradata/MOCABD3/usertbs01.dbf'
size 200m reuse autoextend on maxsize unlimited;
--La base ya se encuentra en modo open
--Actualizacion de contaseñas
alter user sys identified by system2;
alter user system identified by system2;
--Creacion de tablespaces adicionales
create tablespace apps_tbs logging
datafile '/u01/app/oracle/oradata/MOCABD3/apps01.dbf'
size 500m reuse autoextend on next 1280k maxsize unlimited
extent management local;
-- create a tablespace for indexes, separate from user tablespace
create tablespace indx_tbs logging
datafile '/u01/app/oracle/oradata/MOCABD3/indx01.dbf'
size 100m reuse autoextend on next 1280k maxsize unlimited
extent management local;











