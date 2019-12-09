--@Autor Jose Alejandro Montecillo Sandoval 
--@Fecha 5-dic-2019
--@Descripcion Inicio y detencion de la base de Datos

startup
show user
connect usuario1/1234
--create table IF NOT EXIST alumno(id number);
--insert into alumno values(2);
--commit; 
insert into BANCO (BANCO_ID, BANCO_DESCRIPCION) values (10, 'Shanahan-Grant');
commit;
exit