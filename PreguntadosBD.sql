USE Preguntados;
GO

-- Tabla Categoria
CREATE TABLE Categoria (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL
);
GO

-- Tabla Dificultad
CREATE TABLE Dificultad (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nivel NVARCHAR(50) NOT NULL
);
GO

-- Tabla Pregunta
CREATE TABLE Pregunta (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Texto NVARCHAR(MAX) NOT NULL,
    CategoriaId INT FOREIGN KEY REFERENCES Categoria(Id),
    DificultadId INT FOREIGN KEY REFERENCES Dificultad(Id)
);
GO

-- Tabla Respuesta
CREATE TABLE Respuesta (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Texto NVARCHAR(MAX) NOT NULL,
    EsCorrecta BIT NOT NULL,
    PreguntaId INT FOREIGN KEY REFERENCES Pregunta(Id)
);
GO

INSERT INTO Categoria (Nombre) 
VALUES 
    ('Geografía'),
    ('Historia'),
    ('Ciencia'),
    ('Entretenimiento'),
    ('Deportes');
GO

--Geografía
--Fácil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Cuál es la capital de Italia?', 1, 1),
    ('¿En qué continente se encuentra Brasil?', 1, 1),
    ('¿Cuál es el río más largo del mundo?', 1, 1),
    ('¿Cuál es el desierto más grande del mundo?', 1, 1),
    ('¿En qué país se encuentra la Torre Eiffel?', 1, 1);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Roma', 1, 1), ('Milán', 0, 1), ('Venecia', 0, 1), ('Nápoles', 0, 1),
    ('América del Sur', 1, 2), ('África', 0, 2), ('Asia', 0, 2), ('Europa', 0, 2),
    ('Amazonas', 1, 3), ('Nilo', 0, 3), ('Yangtsé', 0, 3), ('Misisipi', 0, 3),
    ('Sahara', 1, 4), ('Gobi', 0, 4), ('Atacama', 0, 4), ('Kalahari', 0, 4),
    ('Francia', 1, 5), ('Italia', 0, 5), ('España', 0, 5), ('Alemania', 0, 5);
GO

--Medio
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Qué país tiene más costas en el mundo?', 1, 2),
    ('¿Dónde se encuentra el Monte Everest?', 1, 2),
    ('¿Cuál es el país más pequeño del mundo?', 1, 2),
    ('¿Qué mar separa Europa de África?', 1, 2),
    ('¿Cuál es la ciudad más poblada del mundo?', 1, 2);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Canadá', 1, 6), ('Rusia', 0, 6), ('Australia', 0, 6), ('Indonesia', 0, 6),
    ('En la frontera entre Nepal y China', 1, 7), ('India', 0, 7), ('Pakistán', 0, 7), ('Afganistán', 0, 7),
    ('Ciudad del Vaticano', 1, 8), ('Mónaco', 0, 8), ('San Marino', 0, 8), ('Liechtenstein', 0, 8),
    ('Mar Mediterráneo', 1, 9), ('Mar Rojo', 0, 9), ('Mar Negro', 0, 9), ('Mar Caspio', 0, 9),
    ('Tokio', 1, 10), ('Delhi', 0, 10), ('Shanghai', 0, 10), ('São Paulo', 0, 10);
GO
--Difícil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Cuál es el país con más islas en el mundo?', 1, 3),
    ('¿Dónde está el desierto de Atacama?', 1, 3),
    ('¿Qué país tiene la mayor población musulmana?', 1, 3),
    ('¿Cuál es la capital de Mongolia?', 1, 3),
    ('¿Qué país tiene la selva más grande del mundo?', 1, 3);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Suecia', 1, 11), ('Noruega', 0, 11), ('Filipinas', 0, 11), ('Grecia', 0, 11),
    ('Chile', 1, 12), ('Perú', 0, 12), ('Argentina', 0, 12), ('Bolivia', 0, 12),
    ('Indonesia', 1, 13), ('Pakistán', 0, 13), ('Bangladés', 0, 13), ('Turquía', 0, 13),
    ('Ulán Bator', 1, 14), ('Biskek', 0, 14), ('Astana', 0, 14), ('Dushambé', 0, 14),
    ('Brasil', 1, 15), ('Congo', 0, 15), ('Indonesia', 0, 15), ('Madagascar', 0, 15);
GO
--Historia
--Fácil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Quién fue el primer presidente de los Estados Unidos?', 2, 1),
    ('¿En qué año terminó la Segunda Guerra Mundial?', 2, 1),
    ('¿Quién descubrió América?', 2, 1),
    ('¿Qué imperio construyó el Coliseo?', 2, 1),
    ('¿Quién fue el líder del Imperio Napoleónico?', 2, 1);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('George Washington', 1, 16), ('Abraham Lincoln', 0, 16), ('Thomas Jefferson', 0, 16), ('John Adams', 0, 16),
    ('1945', 1, 17), ('1939', 0, 17), ('1941', 0, 17), ('1944', 0, 17),
    ('Cristóbal Colón', 1, 18), ('Amerigo Vespucci', 0, 18), ('Fernando de Magallanes', 0, 18), ('Hernán Cortés', 0, 18),
    ('Imperio Romano', 1, 19), ('Imperio Griego', 0, 19), ('Imperio Bizantino', 0, 19), ('Imperio Otomano', 0, 19),
    ('Napoleón Bonaparte', 1, 20), ('Luis XIV', 0, 20), ('Carlos Magno', 0, 20), ('Felipe II', 0, 20);
GO
--Medio
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿En qué año comenzó la Revolución Francesa?', 2, 2),
    ('¿Qué civilización construyó las pirámides de Giza?', 2, 2),
    ('¿Quién fue el primer emperador de Roma?', 2, 2),
    ('¿En qué año cayó el Imperio Romano de Occidente?', 2, 2),
    ('¿Qué país lideró la Revolución Industrial?', 2, 2);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('1789', 1, 21), ('1776', 0, 21), ('1799', 0, 21), ('1804', 0, 21),
    ('Egipto', 1, 22), ('Mesopotamia', 0, 22), ('Asiria', 0, 22), ('Babilonia', 0, 22),
    ('Augusto', 1, 23), ('Julio César', 0, 23), ('Tiberio', 0, 23), ('Nerón', 0, 23),
    ('476 d.C.', 1, 24), ('410 d.C.', 0, 24), ('395 d.C.', 0, 24), ('1453 d.C.', 0, 24),
    ('Reino Unido', 1, 25), ('Alemania', 0, 25), ('Francia', 0, 25), ('Estados Unidos', 0, 25);
GO
--Difícil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Quién fue el primer faraón de Egipto?', 2, 3),
    ('¿Cuál es el documento más antiguo conocido que tiene el código de leyes escrito?', 2, 3),
    ('¿Qué guerra se luchó entre 1337 y 1453?', 2, 3),
    ('¿Quién fue el fundador del Imperio Mongol?', 2, 3),
    ('¿En qué año se firmó la Carta Magna?', 2, 3);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Narmer', 1, 26), ('Tutankamón', 0, 26), ('Ramsés II', 0, 26), ('Cleopatra', 0, 26),
    ('Código de Hammurabi', 1, 27), ('Edicto de Asoka', 0, 27), ('Las Doce Tablas', 0, 27), ('Ley de las XII Tablas', 0, 27),
    ('La Guerra de los Cien Años', 1, 28), ('La Guerra de las Rosas', 0, 28), ('La Guerra de Sucesión Española', 0, 28), ('La Guerra de los Treinta Años', 0, 28),
    ('Gengis Kan', 1, 29), ('Kublai Kan', 0, 29), ('Tamerlán', 0, 29), ('Ogodei Kan', 0, 29),
    ('1215', 1, 30), ('1066', 0, 30), ('1492', 0, 30), ('1689', 0, 30);
GO
--Ciencia
--Fácil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Cuál es el planeta más cercano al Sol?', 3, 1),
    ('¿Qué gas respiramos?', 3, 1),
    ('¿Qué animal es conocido como el "rey de la selva"?', 3, 1),
    ('¿Cuántos sentidos tiene el ser humano?', 3, 1),
    ('¿Qué tipo de animal es una ballena?', 3, 1);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Mercurio', 1, 31), ('Venus', 0, 31), ('Tierra', 0, 31), ('Marte', 0, 31),
    ('Oxígeno', 1, 32), ('Nitrógeno', 0, 32), ('Hidrógeno', 0, 32), ('Dióxido de carbono', 0, 32),
    ('León', 1, 33), ('Tigre', 0, 33), ('Elefante', 0, 33), ('Jirafa', 0, 33),
    ('Cinco', 1, 34), ('Cuatro', 0, 34), ('Seis', 0, 34), ('Siete', 0, 34),
    ('Mamífero', 1, 35), ('Pez', 0, 35), ('Anfibio', 0, 35), ('Reptil', 0, 35);
GO
--Medio
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Qué es el H2O?', 3, 2),
    ('¿Quién formuló la teoría de la relatividad?', 3, 2),
    ('¿Cuál es el órgano más grande del cuerpo humano?', 3, 2),
    ('¿Qué científico descubrió la penicilina?', 3, 2),
    ('¿Cuál es el elemento químico más abundante en la atmósfera terrestre?', 3, 2);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Agua', 1, 36), ('Dióxido de carbono', 0, 36), ('Oxígeno', 0, 36), ('Hidrógeno', 0, 36),
    ('Albert Einstein', 1, 37), ('Isaac Newton', 0, 37), ('Galileo Galilei', 0, 37), ('Nikola Tesla', 0, 37),
    ('La piel', 1, 38), ('El corazón', 0, 38), ('El hígado', 0, 38), ('Los pulmones', 0, 38),
    ('Alexander Fleming', 1, 39), ('Louis Pasteur', 0, 39), ('Marie Curie', 0, 39), ('Gregor Mendel', 0, 39),
    ('Nitrógeno', 1, 40), ('Oxígeno', 0, 40), ('Argón', 0, 40), ('Dióxido de carbono', 0, 40);
GO
--Difícil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Cuál es la partícula subatómica con carga negativa?', 3, 3),
    ('¿Qué es el bosón de Higgs?', 3, 3),
    ('¿Qué es un agujero negro?', 3, 3),
    ('¿Quién desarrolló la teoría de la evolución por selección natural?', 3, 3),
    ('¿Qué es el ADN?', 3, 3);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Electrón', 1, 41), ('Protón', 0, 41), ('Neutrón', 0, 41), ('Quark', 0, 41),
    ('Una partícula fundamental que da masa a otras partículas', 1, 42), ('Una estrella colapsada', 0, 42), ('Una forma de energía', 0, 42), ('Un tipo de materia oscura', 0, 42),
    ('Una región del espacio donde la gravedad es tan fuerte que nada puede escapar', 1, 43), ('Una galaxia', 0, 43), ('Un planeta', 0, 43), ('Una estrella', 0, 43),
    ('Charles Darwin', 1, 44), ('Gregor Mendel', 0, 44), ('Louis Pasteur', 0, 44), ('Alfred Wallace', 0, 44),
    ('Ácido desoxirribonucleico', 1, 45), ('Proteína', 0, 45), ('Enzima', 0, 45), ('Lípido', 0, 45);
GO
--Entretenimiento
--Fácil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Cuál es el nombre del ratón más famoso de Disney?', 4, 1),
    ('¿Qué superhéroe es conocido como el Hombre de Acero?', 4, 1),
    ('¿En qué película animada aparece el personaje Simba?', 4, 1),
    ('¿Quién es el director de la película "Titanic"?', 4, 1),
    ('¿Qué serie de televisión popular tiene a un grupo de amigos viviendo en Nueva York?', 4, 1);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Mickey Mouse', 1, 41), ('Donald Duck', 0, 41), ('Goofy', 0, 41), ('Pluto', 0, 41),
    ('Superman', 1, 42), ('Batman', 0, 42), ('Spiderman', 0, 42), ('Hulk', 0, 42),
    ('El Rey León', 1, 43), ('Aladdín', 0, 43), ('La Sirenita', 0, 43), ('Blancanieves', 0, 43),
    ('James Cameron', 1, 44), ('Steven Spielberg', 0, 44), ('Christopher Nolan', 0, 44), ('Quentin Tarantino', 0, 44),
    ('Friends', 1, 45), ('The Office', 0, 45), ('Seinfeld', 0, 45), ('How I Met Your Mother', 0, 45);
GO
--Medio
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Qué banda británica lanzó el álbum "Abbey Road"?', 4, 2),
    ('¿Quién es el creador de la serie animada "Los Simpson"?', 4, 2),
    ('¿En qué año se estrenó la primera película de "Star Wars"?', 4, 2),
    ('¿Qué actor interpretó a Jack Sparrow en "Piratas del Caribe"?', 4, 2),
    ('¿Cuál es la película animada más taquillera de todos los tiempos?', 4, 2);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('The Beatles', 1, 46), ('The Rolling Stones', 0, 46), ('Pink Floyd', 0, 46), ('Led Zeppelin', 0, 46),
    ('Matt Groening', 1, 47), ('Seth MacFarlane', 0, 47), ('Trey Parker', 0, 47), ('Mike Judge', 0, 47),
    ('1977', 1, 48), ('1980', 0, 48), ('1983', 0, 48), ('1974', 0, 48),
    ('Johnny Depp', 1, 49), ('Orlando Bloom', 0, 49), ('Brad Pitt', 0, 49), ('Tom Cruise', 0, 49),
    ('Frozen', 1, 50), ('Toy Story 3', 0, 50), ('El Rey León', 0, 50), ('Shrek 2', 0, 50);
GO
--Difícil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Quién escribió la novela "Cien años de soledad"?', 4, 3),
    ('¿Qué película ganó el primer premio Oscar a Mejor Película?', 4, 3),
    ('¿En qué año se lanzó el videojuego "The Legend of Zelda"?', 4, 3),
    ('¿Quién es el creador de "Harry Potter"?', 4, 3),
    ('¿Qué cantante es conocido como "El Rey del Pop"?', 4, 3);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Gabriel García Márquez', 1, 51), ('Mario Vargas Llosa', 0, 51), ('Isabel Allende', 0, 51), ('Julio Cortázar', 0, 51),
    ('Wings', 1, 52), ('Gone with the Wind', 0, 52), ('The Jazz Singer', 0, 52), ('All Quiet on the Western Front', 0, 52),
    ('1986', 1, 53), ('1985', 0, 53), ('1984', 0, 53), ('1987', 0, 53),
    ('J.K. Rowling', 1, 54), ('J.R.R. Tolkien', 0, 54), ('George R.R. Martin', 0, 54), ('Stephen King', 0, 54),
    ('Michael Jackson', 1, 55), ('Elvis Presley', 0, 55), ('Prince', 0, 55), ('David Bowie', 0, 55);
GO
--Deporte
--Fácil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Qué país ganó la Copa Mundial de la FIFA 2018?', 5, 1),
    ('¿Qué deporte se practica en Wimbledon?', 5, 1),
    ('¿Cuántos jugadores tiene un equipo de fútbol en el campo?', 5, 1),
    ('¿Qué atleta es conocido como "El Rayo"?', 5, 1),
    ('¿Qué deporte se juega con una pelota ovalada y postes en forma de "H"?', 5, 1);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Francia', 1, 56), ('Croacia', 0, 56), ('Alemania', 0, 56), ('Brasil', 0, 56),
    ('Tenis', 1, 57), ('Golf', 0, 57), ('Críquet', 0, 57), ('Fútbol', 0, 57),
    ('11', 1, 58), ('10', 0, 58), ('12', 0, 58), ('9', 0, 58),
    ('Usain Bolt', 1, 59), ('Michael Phelps', 0, 59), ('Cristiano Ronaldo', 0, 59), ('LeBron James', 0, 59),
    ('Rugby', 1, 60), ('Fútbol americano', 0, 60), ('Baloncesto', 0, 60), ('Hockey', 0, 60);
GO
--Medio
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Quién tiene el récord de más goles en una Copa Mundial de la FIFA?', 5, 2),
    ('¿En qué ciudad se celebraron los Juegos Olímpicos de 2008?', 5, 2),
    ('¿Cuál es el equipo de la NBA con más campeonatos ganados?', 5, 2),
    ('¿Qué deporte se juega en el "Super Bowl"?', 5, 2),
    ('¿En qué país se originó el judo?', 5, 2);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Miroslav Klose', 1, 61), ('Ronaldo', 0, 61), ('Pelé', 0, 61), ('Gerd Müller', 0, 61),
    ('Pekín', 1, 62), ('Londres', 0, 62), ('Atenas', 0, 62), ('Sídney', 0, 62),
    ('Los Angeles Lakers', 1, 63), ('Boston Celtics', 0, 63), ('Chicago Bulls', 0, 63), ('Golden State Warriors', 0, 63),
    ('Fútbol americano', 1, 64), ('Baloncesto', 0, 64), ('Béisbol', 0, 64), ('Hockey', 0, 64),
    ('Japón', 1, 65), ('Corea del Sur', 0, 65), ('China', 0, 65), ('Rusia', 0, 65);
GO
--Difícil
INSERT INTO Pregunta (Texto, CategoriaId, DificultadId) 
VALUES 
    ('¿Quién es el máximo goleador en la historia de la Champions League?', 5, 3),
    ('¿Qué equipo de béisbol tiene más títulos de la Serie Mundial?', 5, 3),
    ('¿Qué país ha ganado más medallas en los Juegos Olímpicos de Verano?', 5, 3),
    ('¿Cuál es el país con más victorias en el Tour de Francia?', 5, 3),
    ('¿En qué año ganó Rafael Nadal su primer título de Roland Garros?', 5, 3);
GO

INSERT INTO Respuesta (Texto, EsCorrecta, PreguntaId) 
VALUES 
    ('Cristiano Ronaldo', 1, 66), ('Lionel Messi', 0, 66), ('Raúl', 0, 66), ('Robert Lewandowski', 0, 66),
    ('New York Yankees', 1, 67), ('Los Angeles Dodgers', 0, 67), ('San Francisco Giants', 0, 67), ('St. Louis Cardinals', 0, 67),
    ('Estados Unidos', 1, 68), ('China', 0, 68), ('Rusia', 0, 68), ('Reino Unido', 0, 68),
    ('Francia', 1, 69), ('España', 0, 69), ('Italia', 0, 69), ('Bélgica', 0, 69),
    ('2005', 1, 70), ('2004', 0, 70), ('2006', 0, 70), ('2003', 0, 70);
GO

