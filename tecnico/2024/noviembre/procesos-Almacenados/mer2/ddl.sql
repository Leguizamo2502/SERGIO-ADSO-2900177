


CREATE TABLE zoologico (
    id_zoologico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    direccion VARCHAR(30) NOT NULL
);

CREATE TABLE habitat (
    id_habitat INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    capacidad INT NOT NULL,
    id_zoologico INT NOT NULL,
    FOREIGN KEY (id_zoologico) REFERENCES zoologico(id_zoologico)
);


CREATE TABLE especie (
    id_especie INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL
);


CREATE TABLE animales (
    id_animal INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    genero VARCHAR(30) NOT NULL,
    id_especie INT NOT NULL,
    id_habitat INT NOT NULL,
    FOREIGN KEY (id_especie) REFERENCES especie(id_especie),
    FOREIGN KEY (id_habitat) REFERENCES habitat(id_habitat)
);


CREATE TABLE visitante (
    id_visitante INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    fecha_visita DATE NOT NULL,
    id_zoologico INT NOT NULL,
    FOREIGN KEY (id_zoologico) REFERENCES zoologico(id_zoologico)
);


CREATE TABLE tipoAlimento (
    id_tipoAlimento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL
);


CREATE TABLE alimentos (
    id_alimento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    cantidad INT NOT NULL,
    id_tipoAlimento INT NOT NULL,
    id_zoologico INT NOT NULL,
    FOREIGN KEY (id_tipoAlimento) REFERENCES tipoAlimento(id_tipoAlimento),
    FOREIGN KEY (id_zoologico) REFERENCES zoologico(id_zoologico)
);


CREATE TABLE listaAnimales (
    id_listaAnimales INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_zoologico INT NOT NULL,
    id_animal INT NOT NULL,
    FOREIGN KEY (id_zoologico) REFERENCES zoologico(id_zoologico),
    FOREIGN KEY (id_animal) REFERENCES animales(id_animal)
);


CREATE TABLE animales_alimentos (
    id_animales_alimentos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cantidad_dia INT NOT NULL,
    id_animal INT NOT NULL,
    id_alimento INT NOT NULL,
    FOREIGN KEY (id_animal) REFERENCES animales(id_animal),
    FOREIGN KEY (id_alimento) REFERENCES alimentos(id_alimento)
);
