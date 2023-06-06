/* Populate database with sample data. */

vet_clinic=# INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
vet_clinic-# VALUES
vet_clinic-#     (1, 'Agumon', '2020-02-03', 0, true, 10.23),
vet_clinic-#     (2, 'Gabumon', '2018-11-15', 2, true, 8),
vet_clinic-#     (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
vet_clinic-#     (4, 'Devimon', '2017-05-12', 5, true, 11);
