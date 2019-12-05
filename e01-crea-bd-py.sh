# @Autors: Montecillo Sandoval Jose Alejandro Oscar Guitierrez Castillo  
# @Fecha: 27 de Noviembre de 2019
# @Descricción: Creaciòn parametros para nuva DB
#Este scipt debe ser ejecutado por el usuario Oracle

#!/bin/bash


#0- Verificamos la existencia de las carpetas  /u01/disk1 /u01/disk2 y /u01/disk3
if [ -d /u01/disk1/ ];then
	echo "Carpeta /u01/disk1/ existe."
else
	mkdir /u01/disk1/
	echo "Creamos la carpeta."
fi
if [ -d /u01/disk2/ ];then
        echo "Carpeta /u01/disk2/ existe."
else
        mkdir /u01/disk2/
	echo "Creamos la carpeta."
fi
if [ -d /u01/disk3/ ];then
        echo "Carpeta /u01/disk3/ existe."
else
        mkdir /u01/disk3/
	echo "Creamos la carpeta."
fi
if [ -d /u01/app/oracle/oradata/MOCABD3/ ];then
	echo "La carpeta /u01/app/oracle/oradata/MOCABD3/ existe."
else
	mkdir /u01/app/oracle/oradata/MOCABD3/
	echo "Creamos la carpeta."
fi 


#1- Se estable un nuevo valor de ORACLE_SID 
echo "1- Configurando la variable ORACLE_SID."
export ORACLE_SID=mocabd3
echo "ORACLE_SID: ${ORACLE_SID}"

#2- Se crea un archivo de passwords unicamente con el usuario SYS
#password usado en la creación MOCA1234!
echo "2- Creando el archivo de passwords."   
if [ -f "/u01/app/oracle/product/18.0.0/dbhome_1/dbs/orapwmocabd3" ]; then
   echo "El archivo ya existe." 
else
   orapwd FORCE=Y \
	FILE='/u01/app/oracle/product/18.0.0/dbhome_1/dbs/orapwmocabd3' \
	FORMAT=12.2 \
	SYS=password
fi
#3- Creando archivo de parametros. 
echo "3.- Creando archivo de parametros básicos."
echo \
"db_name='mocabd3'
memory_target=768M
control_files=(/u01/disk1/control01.ctl,
	           /u01/disk2/control02.ctl,
	           /u01/disk3/control03.ctl)" > $ORACLE_HOME/dbs/initmocabd3.ora

#4- Cuando esto se crea se invoca el desde aqui e02-crea-bd-py.sql
sqlplus / as sysdba @e02-crea-bd-py.sql 

#5- Despues se ejecutan los archivos sql para que funcione correctamente la BD
sqlplys / as sysdba @e03-crea-bd-py.sql


