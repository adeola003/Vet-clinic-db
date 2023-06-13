--Tables
CREATE DATABASE new_clinic;

CREATE TABLE patients(
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR UNIQUE NOT NULL, 
	date_of_birth DATE
);

CREATE TABLE medical_histories(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	addimited_at TIMESTAMP, 
	patient_id BIGINT REFERENCES patients (id),
    status VARCHAR
);

CREATE TABLE treatments (
    id INT NOT NULL PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);

CREATE TABLE invoices (
    id INT NOT NULL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history__id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id INT NOT NULL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
);

-- Create the many-to-many relationship table between medical_histories and treatments
CREATE TABLE medical_history_treatments (
    medical_history_id BIGINT REFERENCES medical_histories(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY (medical_history_id, treatment_id)
);


