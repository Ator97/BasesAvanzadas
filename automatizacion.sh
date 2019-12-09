#--@Authors Jose Alejando Montecillo Sandoval, Oscar Guitierrez Castillo
#--@Fecha 5-Dic-2019
#--@Descripcion Borrado y Recuperación de Control file
#!/bin/bash
export ORACLE_SID=JAMSBD3
sqlplus / as sysdba  @e01-control.sql 

echo "Ha salido de sqlplus"

if [ -f /u01/disk1/control01.ctl ];then
	echo "Moviendo archivos de control."
	mv /u01/disk1/control01.ctl /home/oracle/respaldos
else
	echo "El archivo de control no se encuentra"
fi
if [ -f /u01/disk2/control02.ctl ];then
	echo "Moviendo archivos de control."
	mv /u01/disk2/control02.ctl /home/oracle/respaldos
else
	echo "El archivo de control no se encuentra"
fi
if [ -f /u01/disk3/control03.ctl ];then
	echo "Moviendo archivos de control."
	mv /u01/disk2/control02.ctl /home/oracle/respaldos
else
	echo "El archivo de control no se encuentra"
fi
#Este es para probar con la base de Datos 2
#if [ -d /u01/app/oracle/oradata/JAMSBD2 ];then
#echo "Moviendo archivos de control."
#mv /u01/app/oracle/oradata/JAMSBD2/*.ctl /home/oracle/respaldos
#else
#echo "El archivo de control no se encuentra"
#fi
echo "show user;" | sqlplus / as sysdba 
echo "shutdown immediate;" | sqlplus / as sysdba 
echo "shutdown abort;" | sqlplus / as sysdba 

sqlplus / as sysdba @nuevo-control.sql
#sqlplus / as sysdba @control.sqlplus