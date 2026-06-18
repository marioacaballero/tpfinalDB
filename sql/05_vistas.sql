create or replace VIEW libros_prestados as
SELECT l.isbn, COUNT(p.id_prestamo) AS cantidad_prestamos
            FROM prestamo p 
            join ejemplar e on p.id_ejemplar = e.id_ejemplar
            join libro l on e.isbn  = l.isbn 
            where year(p.fecha_prestamo) = year(curdate())
            group by l.isbn 
            order by cantidad_prestamos desc;

create or replace view socios_prestamos as
select distinct p.id_socio from prestamo p 
where p.estado = 'VENCIDO' and p.fecha_devolucion is null;

create or replace view libro_ejemplar as
select l.isbn, count(e.id_ejemplar) from libro l 
join ejemplar e on l.isbn = e.isbn
group by l.isbn; 

create or replace view libros_ciencia_ficcion as
select l.isbn from libro l 
join ejemplar e on l.isbn = e.isbn 
join libro_genero lg on l.isbn = lg.id_libro 
join genero g on lg.id_genero = g.id_genero
where g.nombre = 'Ciencia Ficción';

create or replace view historial_prestamos as 
select s.dni, p.id_prestamo  from socio s 
join prestamo p on s.id_socio = p.id_socio
group by s.dni, p.id_prestamo
order by s.dni asc;


create or replace view autores_cant_libros as
select a.id_autor ,a.nombre , count(l.isbn ) as cantidad_libros from autor a 
join libro_autor la on a.id_autor = la.id_autor 
join libro l on la.id_libro = l.isbn 
group by a.id_autor;

create or replace view sanciones_ultimo_mes as
select month(s.fecha_inicio), COUNT(s.id_sancion ) from sancion s
where year(s.fecha_inicio) = year(CURDATE()) and month(s.fecha_inicio) between 1 and 12
group by month(s.fecha_inicio);
