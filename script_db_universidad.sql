create database db_universidad;
use db_universidad;
create table departamento(
id_departamento int primary key not null,
nom_departamento varchar(50)
);
insert into departamento(id_departamento,nom_departamento) values 
(1, 'Matemáticas'),
(2, 'Informatica'),
(3, 'Agronomia'),
(4, 'Derecho'),
(5, 'Quimica y fisica');
select * from departamento;

create table profesores(
id_profesores integer(10) primary key not null,
nit_profesor varchar(9),
nombre varchar(25),
apellido1 varchar(50),
apellido2 varchar(50),
ciudad varchar(25),
direccion varchar(50),
telefono varchar(9),
fecha_nacimiento date,
sexo enum('H','M'),
cod_departamento int not null,
foreign key (cod_departamento) references departamento (id_departamento)
);
insert into profesores(id_profesores,nit_profesor, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, cod_departamento) values 
(1, '10949636', 'Luis', 'Piracoca', 'Restrepo', 'Boyaca', 'Calle 5 # 12-98', '310258968', '1988-12-20', 'H', 1),
(2, '10805425', 'Margot', 'Lóaiza', 'Parra', 'Armenia', 'bloque  10', '745869525', '1999-05-25', 'M', 2),
(3, '12365874', 'Jaimer', 'Marin', 'Paez', 'Pasto', 'circunvalar 21', '656258349', '1981-02-25', 'H', 3),
(4, '41914169', 'María', 'Parra', 'Morales', 'Bogota', 'Fontibon 23', '745905682', '1997-10-01', 'M', 1),
(5, '7523102', 'David', 'Vanegas', 'Lopez', 'Cali', 'San carlos', '744751933', '1988-01-30', 'H', 4);
 select * from profesores;

create table asignatura(
id_asignatura integer primary key not null,
nombre_asignatura varchar(100),
creditos float not null,
tipo enum('basica','obligatoria','optativa') not null,
curso tinyint(3),
cuatrimestre tinyint(3),
cod_profesores int not null,
cod_grado int not null,
foreign key(cod_profesores) references profesores(id_profesores),
foreign key(cod_grado) references grado(id_grado) 
);
insert into asignatura(id_asignatura, nombre_asignatura, creditos, tipo, curso, cuatrimestre, cod_profesores, cod_grado) values
    (1, 'Matemáticas ', 4.8, 'obligatoria', 1, 1, 1, 4),
    (2, 'Informatica', 3.2, 'basica', 2, 2, 2, 5),
    (3, 'Derecho', 4.1, 'optativa', 3, 3, 3, 2),
    (4, 'Quimica y fisica', 2.0, 'obligatoria', 1, 4, 4, 1),
    (5, 'Agronomia', 4.5, 'obligatoria', 3, 5, 5, 3);
    select * from asignatura;
    
create table grado(
id_grado integer primary key not null,
nombre_grado varchar(100)
);
insert into grado (id_grado, nombre_grado) values
    (1, 'Matematicas'),
    (2, 'Informatica'),
    (3, 'Derecho'),
    (4, 'Quimica y fisica'),
    (5, 'Agronomia');
    select * from grado;
    
create table alumno(
id_alumno int primary key not null,
nit_alunmo varchar(9),
nombre varchar(25),
apellido1 varchar(50),
apellido2 varchar(50),
ciudad varchar(25),
direccion varchar(50),
telefono varchar(9),
fecha_nacimiento date,
sexo enum('H','M')
);
insert into alumno(id_alumno, nit_alunmo, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento,sexo) values 
    (1, '102358625', 'Melissa', 'Vanegas', 'Calderon', 'Armenia', 'Calle 10', '74526239', '2008-05-20', 'M'),
    (2, '502608665', 'Mauricio', 'Gonzalez', 'Mejia ', 'Armenia', 'Carrera 15', '787654893', '2010-12-27', 'H'),
    (3, '589992389', 'Andres', 'Martínez', 'Vanegas', 'Cali', 'Carrera 89', '723445851', '2005-09-07', 'M'),
    (4, '215974674', 'Jorge', 'Rodriguez', 'Rodriguez', 'Buenaventura', 'Calle 5', '258723908', '2003-11-03', 'H'),
    (5, '765825647', 'Luisa', 'Ospina', 'Mendez', 'Caldas', 'Carrera 1', '743413331', '2006-06-17', 'M');
    select * from alumno;

create table curso_escolar(
id_curso_escolar integer(10) primary key not null,
año_inicio year,
año_final year
);
insert into curso_escolar (id_curso_escolar, año_inicio, año_final) values
    (1, 2023, 2024),
    (2, 2022, 2023),
    (3, 2021, 2022),
    (4, 2020, 2021),
    (5, 2019, 2020);
    select * from curso_escolar;

create table alumno_se_matricula_asignatura(
cod_alumno int not null,
cod_asignatura int not null,
cod_curso_escolar int not null,
foreign key(cod_alumno) references alumno(id_alumno),
foreign key(cod_asignatura) references asignatura(id_asignatura),
foreign key(cod_curso_escolar) references curso_escolar(id_curso_escolar)
);
insert into alumno_se_matricula_asignatura (cod_alumno, cod_asignatura, cod_curso_escolar) values
    (1, 2, 3),
    (4, 5, 1),
    (3,4, 3 ),
    (4, 4, 4),
    (5, 5, 5);
    select * from alumno_se_matricula_asignatura;
    
drop database db_universidad;