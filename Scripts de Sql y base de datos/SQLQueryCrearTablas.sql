-- Tabla categoria
CREATE TABLE Categoria(
	IdCategoria INTEGER PRIMARY KEY IDENTITY,
	Nombre VARCHAR(50) NOT NULL UNIQUE,
	Descripcion VARCHAR(256) NULL
);


-- tabla productos
CREATE TABLE Producto(
	IdProducto INTEGER PRIMARY KEY IDENTITY,
	IdCategoria INTEGER NOT NULL,
	Nombre VARCHAR(50) NOT NULL UNIQUE,
	Descripcion VARCHAR(256) NULL,
	Cobertura VARCHAR(256) NOT NULL,
	Exclusion VARCHAR(256) NOT NULL,
	DocExpedicion VARCHAR(256) NULL,
	PrecioVenta DECIMAL(11,2) NOT NULL
	FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)
);



--Tabla persona
CREATE TABLE Cliente(
	IdCliente INTEGER PRIMARY KEY IDENTITY,
	TipoCliente VARCHAR(20) NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	TipoDocumento VARCHAR(20) NOT NULL,
	NumDocumento VARCHAR(20) NOT NULL,
	FechaNacimiento Datetime NULL,
	Direccion varchar(70) NULL,
	Telefono VARCHAR(20) NULL,
	Email VARCHAR(50) NULL
);


--Tabla Asesor de ventas
CREATE TABLE AsesorVenta(
	IdAsesorVenta INTEGER PRIMARY KEY IDENTITY,
	Nombres VARCHAR(100) NOT NULL,
	Apellidos VARCHAR(100) NOT NULL,
	NumDocumento VARCHAR(20) NOT NULL
);


--Tabla compañia aseguradora
CREATE TABLE CompañiaAseguradora(
	IdCompañia INTEGER PRIMARY KEY IDENTITY,
	Nombre VARCHAR(100) NOT NULL,
	Descripcion VARCHAR(256) NOT NULL
);


--Tabla ventas
CREATE TABLE Venta(
	IdVenta INTEGER PRIMARY KEY IDENTITY,
	IdCliente INTEGER NOT NULL,
	IdAsesorVenta INTEGER NOT NULL,
	IdCompañia INTEGER NOT NULL,
	NumComprobante VARCHAR(10) NOT NULL,
	Fecha DATETIME NOT NULL,
	Total DECIMAL(11,2) NOT NULL,
	Estado VARCHAR(20) NOT NULL
	FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente),
	FOREIGN KEY (IdAsesorVenta) REFERENCES AsesorVenta (IdAsesorVenta),
	FOREIGN KEY (IdCompañia) REFERENCES CompañiaAseguradora (IdCompañia)
);

--Tabla detalle_venta
CREATE TABLE DetalleVenta(
	IdDetalleVenta INTEGER PRIMARY KEY IDENTITY,
	IdVenta INTEGER NOT NULL,
	IdProducto INTEGER NOT NULL,
	Cantidad INTEGER NOT NULL,
	Precio DECIMAL(11,2) NOT NULL,
	Descuento DECIMAL(11,2)NOT NULL,
	FOREIGN KEY (IdVenta) REFERENCES Venta (IdVenta) ON DELETE CASCADE,
	FOREIGN KEY (IdProducto) REFERENCES Producto (IdProducto)
);



-- //inserts 

-- Inserts tabla Categoria

insert into Categoria (Nombre,Descripcion) values ('Seguros de vida','Cubre el riesgo de muerte, supervivencia e incapacidad. El seguro de vida cubre los riesgos que puedan afectar a la existencia, integridad o salud de las personas.');

insert into Categoria (Nombre,Descripcion) values ('Seguros de hogar','El Seguro de Hogar de la Agencia de Seguros Falabella protege tu inmueble y/o contenidos.');

-- inserts tabla producto

insert into Producto (IdCategoria, Nombre,Descripcion,Cobertura,Exclusion,DocExpedicion,PrecioVenta) 
  values (1,'Vida Individual','Este producto que está diseñado para atender segmentos de clientes o asociados, tiene por objeto otorgar cobertura en forma individual.','Muerte por cualquier causa, incapacidad total y permanente.','Suicidio o tentativa de suicidio ocurrido dentro del primer año de haber contratado la póliza','- Solicitud de seguro.
- Formato de historia médica cuando se requiera.
- Exámenes médicos cuando se requiera.',1000000.0);

insert into Producto (IdCategoria, Nombre,Descripcion,Cobertura,Exclusion,DocExpedicion,PrecioVenta) 
  values (1,'Vida Grupo Familiar','Indemnizar a los beneficiarios o al propio asegurado ante la ocurrencia de uno de los riesgos amparados.','Muerte por cualquier causa diferente a las excluidas en la póliza','Tener menos de 71 años de edad para la cobertura del riesgo de muerte','- Slip para Suscripción Ramos de Vida cuando se requiera según valor asegurado.',50000000.0);

 insert into Producto (IdCategoria, Nombre,Descripcion,Cobertura,Exclusion,DocExpedicion,PrecioVenta) 
  values (2,'Vivienda Segura','Amparar el patrimonio familiar representado en las casas de habitación o apartamentos, por los daños o pérdidas que se causen a consecuencia de accidentes, fenómenos de la naturaleza o actos de terceros,','Daños y pérdidas materiales','Terremoto, reacciones o explosiones, emision de radiaciones','- Solicitud de seguro diligenciada',30000000.0);


-- inserts tabla asesores ventas

insert into AsesorVenta (Nombres,Apellidos,NumDocumento) values ('José Antonio','Martínez',1065789741);

insert into AsesorVenta(Nombres,Apellidos,NumDocumento) 
values 
('Miguel Angel','Rodríguez','1065159357');


insert into AsesorVenta (Nombres,Apellidos,NumDocumento) values ('Ana Lucía','Hernandez',10657891);
insert into AsesorVenta (Nombres,Apellidos,NumDocumento) values ('María Fernanda','Rodriguez',10657123);


-- Inserts tabla compañias

insert into CompañiaAseguradora(Nombre,Descripcion) values ('Equidad Seguros','Somos una aseguradora cooperativa constituida para fomentar cultura de previsión y asegurar a las personas, sus familias, sus bienes y sus empresas.');


insert into CompañiaAseguradora(Nombre,Descripcion) values ('Sura Seguros','Te ofrecemos lo que necesitas para que te asegures de vivir al máximo.');

	

-- inserts tabla clientes

insert into Cliente (TipoCliente,Nombre,TipoDocumento,NumDocumento, FechaNacimiento,Direccion,Telefono,Email) 
values 
('Persona','Juan Sebastian martinez','Cedula','1065654789','','Cl. 74a #63-4','57815545','juanmartinez@gmail.com');


insert into Cliente (TipoCliente,Nombre,TipoDocumento,NumDocumento, FechaNacimiento,Direccion,Telefono,Email) 
values 
('Persona','Juan Pablo Lopez','Cedula','1065657951','','Cl. 74a #62-5','57815545','juanpablo@hotmail.com');

insert into Cliente (TipoCliente,Nombre,TipoDocumento,NumDocumento, FechaNacimiento,Direccion,Telefono,Email) 
values 
('Persona','Sara Sofía Torres','Cedula','1065852741','','Cl. 80a #62-9','57878965','sarast@gmail.com');


-- inserts tabla ventas

insert into Venta(IdCliente,IdAsesorVenta,IdCompañia,NumComprobante,Fecha,Total,Estado)
values(1,1,1,'0001','1/03/2019',10000000,'Aceptado')

insert into Venta(IdCliente,IdAsesorVenta,IdCompañia,NumComprobante,Fecha,Total,Estado)
values(2,1,2,'0002','1/03/2019',30000000.00,'Aceptado')

insert into Venta(IdCliente,IdAsesorVenta,IdCompañia,NumComprobante,Fecha,Total,Estado)
values(2,1,2,'0002','1/03/2019',30000000.00,'Aceptado')

insert into Venta(IdCliente,IdAsesorVenta,IdCompañia,NumComprobante,Fecha,Total,Estado)
values(3,4,2,'0004','1/03/2019',10000000.00,'Aceptado')

-- Inserts tabla DetalleVenta

Select * from DetalleVenta;

insert into DetalleVenta(IdVenta,IdProducto,Precio,Descuento)
values(1,1,30000000.00,0)

insert into DetalleVenta(IdVenta,IdProducto,Precio,Descuento)
values(3,3,10000000,0);

insert into DetalleVenta(IdVenta,IdProducto,Precio,Descuento)
values(4,13,10000000,0);
