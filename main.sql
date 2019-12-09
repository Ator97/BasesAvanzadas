--@Autor(es): Alejandro Montecillo,Guitierrez Castillo Oscar  
--@Fecha creación: 7-Dic-2019
--@Descripción: Creando usuario, con permisos y llama a otros scripts 

CREATE USER MOCA_proy_admin identified BY 1234 DEFAULT TABLESPACE USERS  QUOTA unlimited on users; 

GRANT CREATE SESSION, CREATE TABLE, INSERT ANY TABLE,DROP ANY TABLE,CREATE SEQUENCE, CREATE PROCEDURE TO MOCA_proy_admin;
connect MOCA_proy_admin
prompt Importando scripts 
SHOW USER; 
@05-crea-tablas.slq
set define off
@e06-carga-inicial.sql 
set define on 
commit;