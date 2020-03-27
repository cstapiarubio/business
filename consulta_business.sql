
/*1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?
select sum(amount) as ingreso_total
from billing
where charged_datetime >= '2012/03/01' AND charged_datetime < '2012/03/31';

2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?
select sum(amount) as ingreso_total, client_id
from billing
where client_id =2;

3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?

select domain_name, client_id
from sites
where client_id =10;

4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una 
identificación de 1? 
¿Qué pasa con el cliente = 20?

select year (created_datetime) as año, count(created_datetime) as sitios, client_id
from sites
where client_id = 1 
group by año;*/

/*5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios 
entre el 1 de enero de 2011 y el 15 de febrero de 2011?
select count(leads_id) as leads, site_id
from leads
 where registered_datetime >= '2011/01/01' AND registered_datetime < '2011/02/15'
 group by site_id;*/
 
/*6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que 
hemos generado para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?

select clients.first_name, clients.last_name, count(leads.leads_id) as leads
from clients 
inner join sites
on clients.client_id = sites.client_id
inner join leads
on sites.site_id = leads.site_id
where registered_datetime >= '2011/01/01' AND registered_datetime < '2011/12/31'
group by clients.client_id;*/

/*7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que 
hemos generado para cada cliente cada mes entre los meses 1 y 6 del año 2011?*/
select month (registered_datetime) as mes, clients.first_name, clients.last_name, count(leads.leads_id) as leads
from clients 
inner join sites
on clients.client_id = sites.client_id
inner join leads
on sites.site_id = leads.site_id
where registered_datetime >= '2011/01/01' AND registered_datetime < '2011/06/30'
group by clients.client_id;
/*8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de los sitios de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente. Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total de clientes potenciales generados en cada sitio en todo momento.

9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente.

10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente. Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)*/