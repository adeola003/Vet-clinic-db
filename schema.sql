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

ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

