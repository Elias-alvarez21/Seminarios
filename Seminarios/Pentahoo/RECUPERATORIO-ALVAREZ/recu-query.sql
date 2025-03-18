create database recuperatorio;
use recuperatorio;

create table dimProv
(	csProv int primary key,
	version int,
	date_from datetime,
	date_to datetime,
	provincia varchar(50)
)


INSERT INTO recuperatorio.dbo.dimProv (csProv,version,date_from,date_to,provincia) VALUES
	 (1,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Buenos Aires'),
	 (2,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Córdoba'),
	 (3,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Mendoza'),
	 (4,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Santa Fe'),
	 (5,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Chubut'),
	 (6,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Corrientes'),
	 (7,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Neuquen'),
	 (8,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Salta'),
	 (9,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Jujuy');
INSERT INTO recuperatorio.dbo.dimProv (csProv,version,date_from,date_to,provincia) VALUES
	 (10,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Rio Negro'),
	 (11,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Misiones'),
	 (12,1,'1900-01-01 00:00:00.0','2200-01-01 00:00:00.0',N'Santiago del Estero');
