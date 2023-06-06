/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer PRIMARY KEY NOT NULL,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal);

    ALTER TABLE animals
vet_clinic-# ADD COLUMN species varchar(100);
