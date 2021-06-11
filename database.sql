DROP DATABASE pelis;

--Create a db
CREATE DATABASE pelis; 

--Connect to the db
\c pelis;

--Create the tables
CREATE TABLE peliculas (
    id INT,
    pelicula VARCHAR(100),
    ano_estreno INT,
    director VARCHAR(25),
    PRIMARY KEY(id)
);

CREATE TABLE reparto (
    id INT,
    actor VARCHAR(50),
    FOREIGN KEY(id) REFERENCES peliculas(id)
);

--Copy data
\COPY peliculas FROM 'references/peliculas.csv' csv header;
\COPY reparto FROM 'references/reparto.csv' csv header;

--Obtain id TITANIC
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

--Obtain ACTORS from TITANIC
SELECT actor FROM reparto WHERE id = 2;

--Obtain FILMS of HARRISON FORD
SELECT actor,COUNT(actor) 
AS NUMBERS_HARRISON_FORD_FILMS
FROM reparto WHERE actor = 'Harrison Ford'
GROUP BY actor;

--FILMS BETWEEN 1990-1999
SELECT pelicula FROM peliculas WHERE ano_estreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;

--Count Lenght
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo
FROM peliculas;

--Obtain max length
SELECT MAX(LENGTH(pelicula)) AS longitud_titulo_maximo
FROM peliculas;

--Group by films
SELECT peliculas.id, peliculas.pelicula, reparto.actor
FROM peliculas
INNER JOIN reparto ON reparto.id = peliculas.id;