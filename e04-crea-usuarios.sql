--@Autors: Montecillo Sandoval Jose Alejandro Oscar Guitierrez Castillo  
--@Fecha: 27 de Noviembre de 2019
--@Descricción: Script para la creación de Usuarios

--sqlplus / as sysdba 

DECLARE
  my_user     VARCHAR2(30) := 'usuario';
  my_password VARCHAR2(9)  := '1234';
  v_user number := 1;
  v_user2 number := 11;
  v_index number := 1 ;
  v_role VARCHAR2(8) := 'usersBD';
  BEGIN
  EXECUTE IMMEDIATE 'CREATE ROLE '||v_role;
  EXECUTE IMMEDIATE 'GRANT CREATE SESSION, SELECT any TABLE, INSERT any TABLE, UPDATE any TABLE, CREATE TABLE TO usersBD';
  for v_index in 1 .. 10 loop
  EXECUTE IMMEDIATE 'CREATE USER '||my_user||v_user||' IDENTIFIED BY '||my_password||'DEFAULT TABLESPACE users QUOTA UNLIMITED ON users PASSWORD expire';
  EXECUTE IMMEDIATE 'GRANT usersbd TO '||my_user||v_user;
  v_user := v_user + 1;
  END loop;
  for v_index in 1 .. 90 loop
  EXECUTE IMMEDIATE 'CREATE USER '||my_user||v_user2||' IDENTIFIED BY '||my_password|| 'DEFAULT TABLESPACE users PASSWORD expire';
  EXECUTE IMMEDIATE 'GRANT usersbd TO '||my_user||v_user2;
  v_user2 := v_user2 + 1;
  end loop;
  END;
  /
