/* Populate database with sample data. */

vet_clinic=# INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
vet_clinic-# VALUES
vet_clinic-#     (1, 'Agumon', '2020-02-03', 0, true, 10.23),
vet_clinic-#     (2, 'Gabumon', '2018-11-15', 2, true, 8),
vet_clinic-#     (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
vet_clinic-#     (4, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES (5, 'Charmander', '2020-02-08', 0, false, -11, NULL),
       (6, 'Plantmon', '2021-11-15', 2, true, -5.7, NULL),
       (7, 'Squirtle', '1993-04-02', 3, false, -12.13, NULL),
       (8, 'Angemon', '2005-06-12', 1, true, -45, NULL),
       (9, 'Boarmon', '2005-06-07', 7, true, 20.4, NULL),
       (10, 'Blossom', '1998-10-13', 3, true, 17, NULL),
       (11, 'Ditto', '2022-05-14', 4, true, 22, NULL);


-- Alter animals table
ALTER TABLE animals DROP CONSTRAINT animals_pkey;

ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals DROP COLUMN id;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-- Add elements into owners
INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Add elements into species
INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');


-- Update animals with species_id based on name
UPDATE animals
SET species_id = (
  CASE
    WHEN name ILIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END
);

-- Update animals with owner_id based on owner information

UPDATE animals
SET owner_id = (
  CASE
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  END
);



