DROP TABLE Solicitante  CASCADE CONSTRAINTS;
DROP TABLE Curso CASCADE CONSTRAINTS;
DROP TABLE Solicitud CASCADE CONSTRAINTS;


CREATE TABLE Solicitante (
    DNIsol varchar(20) NOT NULL,
    nombresol varchar(20) NOT NULL,
    apellidossol varchar(40) NOT NULL,
    localidadsol varchar(20) NOT NULL,
    telefonosol varchar(20) NOT NULL,
    titulacionsol varchar(40) NOT NULL,
    centrosol varchar(40) NOT NULL,
    edadsol decimal(2, 0) NOT NULL,
    IBANsol varchar(40) NOT NULL,
    IDsol varchar(20) NOT NULL,

    CONSTRAINT PK_SOLICITANTE PRIMARY KEY (DNIsol)
);

CREATE TABLE Curso (
    titulocurso varchar(40) NOT NULL,
    fechacurso date NOT NULL,
    fechainicioins date NOT NULL,
    fechafinins date NOT NULL,
    precio decimal(10, 2) NOT NULL,
    estadoc varchar(20) NOT NULL,
    nplazas decimal(4, 0) NOT NULL,

    CONSTRAINT PK_CURSO PRIMARY KEY (titulocurso),
    CONSTRAINT CK_ESTADO_CURSO CHECK (estadoc in ('Planificado', 'Abierta', 'Cerrada', 'Cancelada')),
    CONSTRAINT CK_FECHA_CURSO CHECK (fechainicioins < fechafinins)
);

CREATE TABLE Solicitud (
    DNIsol varchar(20),
    titulocurso varchar(40),
    fecha date NOT NULL,
    estados varchar(20) NOT NULL,
    abonado decimal(10, 2) NOT NULL,

    CONSTRAINT PK_SOLICITUD PRIMARY KEY (DNIsol, titulocurso),
    CONSTRAINT FK_SOLICITUD_SOLICITANTE FOREIGN KEY (DNIsol) REFERENCES Solicitante (DNIsol),
    CONSTRAINT FK_SOLICITUD_CURSO FOREIGN KEY (titulocurso) REFERENCES Curso (titulocurso),
    CONSTRAINT CK_ESTADO_SOLICITUD CHECK (estados in ('Pre-inscrito', 'Inscrito', 'Cancelado'))
);