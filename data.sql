INSERT INTO animals (name) VALUES ('Agumon'), ('Gabumon'), ('Pikachu'), ('Devimon'), ('Charmander'), ('Plantmon'), ('Squirtle'), ('Angemon'), ('Boarmon'), ('Blossom');

INSERT INTO vets (name) VALUES ('William Tatcher'), ('Maisy Smith'), ('Stephanie Mendez'), ('Jack Harkness');


-- Optimization changes

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

-- Define constraints and foreign keys
ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD CONSTRAINT fk_animals_owner FOREIGN KEY (owner_id) REFERENCES owners (id);
ALTER TABLE visits ADD CONSTRAINT fk_visits_animal FOREIGN KEY (animal_id) REFERENCES animals (id);
ALTER TABLE visits ADD CONSTRAINT fk_visits_vet FOREIGN KEY (vet_id) REFERENCES vets (id);

-- Create indexes on frequently used columns
CREATE INDEX idx_animals_species_id ON animals(species_id);
CREATE INDEX idx_animals_owner_id ON animals(owner_id);
CREATE INDEX idx_visits_animal_id ON visits(animal_id);
CREATE INDEX idx_visits_vet_id ON visits(vet_id);


