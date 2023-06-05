/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN 'Jan 1, 2016' AND 'Dec 31, 2019';
SELECT name FROM animals WHERE (neutered IS TRUE) AND (escape_attempts<3);
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS TRUE;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT name, species FROM animals;
ROLLBACK;
SELECT name, species FROM animals;


BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT name, species FROM animals;
COMMIT;
SELECT name, species FROM animals;


BEGIN WORK;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


BEGIN;
DELETE FROM animals WHERE date_of_birth > 'Jan 1, 2022';
SAVEPOINT save1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO save1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;


SELECT COUNT(*) AS "ALL ANIMALS" FROM animals;
SELECT COUNT(*) AS "NEVER TRIED ESCAPE" FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) AS "WEIGHT AVERAGE" FROM animals;
SELECT neutered, MAX(escape_attempts) AS "MOST ESCAPE ATTEMPTS" FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN 'Jan 1, 1990' AND 'Dec 31, 2000' GROUP BY species;