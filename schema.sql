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

-- Create the vets table
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  age INTEGER,
  date_of_graduation DATE
);

-- Create the species table
CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);


-- Create the specializations join table
CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);


-- Create the visits join table
CREATE TABLE visits (
  animal_id INTEGER REFERENCES animals(id),
  vet_id INTEGER REFERENCES vets(id),
  visit_date DATE,
  PRIMARY KEY (animal_id, vet_id, visit_date)
);
