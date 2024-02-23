create database veterinaria;
use veterinaria;

select nombre from raza;
select nombre, telefono from dueño;
select nombre from especie group by nombre;
select * from mascota where nombre like "m%";
select * from raza where nombre like "%e";
select nombre from especie where nombre not like "%r%";
desc mascota;
select d.nombre, m.nombre from dueño d inner join mascota m
on m.Dueño_idDueño = d.idDueño;

select m.nombre as Mascota, r.nombre as Raza, e.nombre as Especie from mascota m inner join raza r 
on m.raza_idRaza = r.idRaza inner join especie e 
on e.idEspecie = r.Especie_idEspecie;

select m.nombre MASCOTA, h.fecha FECHA_CONSULTA, h.diagnostico DIAGNOSTICO, h.motivoAtencion MOTIVO_CONSULTA  from mascota m inner join historial h
on  h.mascota_idMascota = m.idMascota;

select m.nombre MASCOTA, v.tipoVacuna VACUNAS from mascota m inner join historial h 
on m.idMascota = h.Mascota_idMascota inner join historial_has_vacuna hv
on hv.Historial_idHistorial = h.idHistorial inner join vacuna v
on v.idVacuna = hv.Vacuna_idVacuna;

select m.nombre MASCOTA, e.nombre ENFERMEDAD from mascota m inner join historial h 
on m.idMascota = h.Mascota_idMascota inner join historial_has_enfermedad he
on he.Historial_idHistorial = h.idHistorial inner join enfermedad e
on e.idEnfermedad = he.Enfermedad_idEnfermedad;


select d.nombre DUEÑO, m.nombre MASCOTA, c.fechaAtencion FECHA_ATENCION, v.nombre VETERINARIO from Mascota m inner join Historial h 
on h.Mascota_idMascota = m.idMascota inner join Cita c
on c.Historial_idHistorial = h.idHistorial inner join Dueño d
on d.idDueño = m.Dueño_idDueño inner join Veterinario v 
on v.idVeterinario = c.Veterinario_idVeterinario;

select m.nombre from mascota m where Raza_idRaza = (select idRaza from raza where nombre = "Pastor Aleman");

select d.nombre DUEÑO, m.nombre MASCOTA, me.nombre MES_NACIMIENTO, r.nombre RAZA, e.nombre ESPECIE, h.motivoAtencion MOTIVO_ATENCIÓN, 
h.diagnostico DIAGNÓSTICO, en.nombre ENFERMEDAD, ve.nombre VETERINARIO 
from mascota m inner join Dueño d 
on d.idDueño = m.Dueño_idDueño inner join historial h 
on h.mascota_idMascota = m.idMascota inner join mes me 
on me.idMes = m.Mes_idMes inner join raza r
on r.idRaza = m.Raza_idRaza inner join especie e
on e.idEspecie = r.Especie_idEspecie inner join historial_has_vacuna hv 
on hv.Historial_idHistorial = h.idHistorial inner join vacuna v
on v.idVacuna = hv.Vacuna_idVacuna inner join historial_has_enfermedad he
on he.Historial_idHistorial = h.idHistorial inner join enfermedad en 
on en.idEnfermedad = he.Enfermedad_idEnfermedad inner join cita c
on c.Historial_idHistorial = h.idHistorial inner join veterinario ve 
on ve.idVeterinario = c.Veterinario_idVeterinario;






