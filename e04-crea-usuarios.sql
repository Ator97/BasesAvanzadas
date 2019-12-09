--@Autors: Montecillo Sandoval Jose Alejandro Oscar Guitierrez Castillo  
--@Fecha: 27 de Noviembre de 2019
--@Descricción: Script para la creación de Usuarios
 
--sqlplus / as sysdba 
set serveroutput ON
DECLARE
  my_user     VARCHAR2(30) := 'USUARIO';
  my_password VARCHAR2(9)  := '1234';
  v_user 	  number := 1;
  v_user2 	  number := 11;
  v_index     number := 1 ;
  v_count     number (1,0);
  v_count2     number (1,0);
  v_role      VARCHAR2(8) := 'USERSBD';
BEGIN
  --Verificar si existe el rol y si no lo crea
  select count(*) into v_count2
  from dba_roles 
  where ROLE =v_role;
  if v_count2 > 0 THEN 
  	  dbms_output.put_line('El rol ya existe');
  else 
    	EXECUTE IMMEDIATE 'CREATE ROLE '||v_role;
    	EXECUTE IMMEDIATE 'GRANT CREATE SESSION, SELECT any TABLE, INSERT any TABLE, UPDATE any TABLE, CREATE TABLE TO usersBD';
  end if;
  for v_index in 1 .. 10 loop --Verificar si existe el usuario y si no, lo crea. 
    	select count(*) into v_count 
    	from dba_users
    	where username = my_user||v_user;
      if v_count > 0 then 
  	    dbms_output.put_line ('El usuario ya existe, no es necesario crearlo');
        EXECUTE IMMEDIATE 'DROP USER '||my_user||v_user2;
      else
  	    EXECUTE IMMEDIATE 'CREATE USER '||my_user||v_user||' IDENTIFIED BY '||my_password
  		    ||'QUOTA UNLIMITED ON users DEFAULT tablespace users PASSWORD expire';
 	      EXECUTE IMMEDIATE 'GRANT USERSBD TO '||my_user||v_user;
  	    v_user := v_user + 1;
      end if;
  END loop;
  for v_index in 1 .. 90 loop
    select count(*) into v_count 
    from dba_users
    where username = my_user||v_user2;
    if v_count > 0 then 
  	  dbms_output.put_line ('El usuario ya existe, no es necesario crearlo');
      EXECUTE IMMEDIATE 'DROP USER '||my_user||v_user2;
    else
 	    EXECUTE IMMEDIATE 'CREATE USER '||my_user||v_user2||' IDENTIFIED BY '||my_password||'PASSWORD expire';
  	  EXECUTE IMMEDIATE 'GRANT USERSBD TO '||my_user||v_user2;
  	  v_user2 := v_user2 + 1;
    END if;
  END loop;
END;
/
