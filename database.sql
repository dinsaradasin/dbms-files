CREATE DATABASE hpms_db;
USE hpms_db;

CREATE TABLE person (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
ALTER TABLE person AUTO_INCREMENT = 101;

CREATE TABLE person_p_number (
    person_id INT,
    p_number VARCHAR(15),
    PRIMARY KEY (person_id, p_number),
    FOREIGN KEY (person_id) REFERENCES person(person_id) 
);

CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    dept_location VARCHAR(50),
    dept_p_number VARCHAR(15),        
    specialization VARCHAR(100) 
);



CREATE TABLE ward (
    ward_id INT AUTO_INCREMENT PRIMARY KEY,
    ward_name VARCHAR(50) NOT NULL,
    ward_type VARCHAR(50),
    capacity INT DEFAULT 0
);

CREATE TABLE bed (
    bed_number INT NOT NULL, 
    ward_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Available',
    PRIMARY KEY (bed_number, ward_id), 
    FOREIGN KEY (ward_id) REFERENCES ward(ward_id) 
);


CREATE TABLE patient (
    person_id INT PRIMARY KEY,
    blood_group VARCHAR(5),
    dob DATE,
    gender VARCHAR(10),  
    add_number VARCHAR(10),
    street VARCHAR(50),     
    city VARCHAR(20),        
    ward_id INT,      
    admission_date DATETIME, 
    discharge_date DATETIME,
    FOREIGN KEY (person_id) REFERENCES person(person_id),
    FOREIGN KEY (ward_id) REFERENCES ward(ward_id) 
);


CREATE TABLE doctor (
    person_id INT PRIMARY KEY,
    specialization VARCHAR(100),
    e_mail VARCHAR(100),      
    dept_id INT,
    FOREIGN KEY (person_id) REFERENCES person(person_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE appointment (
    app_id INT AUTO_INCREMENT PRIMARY KEY,
    app_date DATE NOT NULL,
    app_time TIME NOT NULL,
    app_status VARCHAR(20) DEFAULT 'Scheduled',
    app_type VARCHAR(50),    
    diagnosis TEXT,
    doctor_id INT,
    patient_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctor(person_id),
    FOREIGN KEY (patient_id) REFERENCES patient(person_id)
);


CREATE TABLE bill (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    bill_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    bill_status VARCHAR(20) DEFAULT 'Unpaid',
    app_id INT,
    patient_id INT,
    FOREIGN KEY (app_id) REFERENCES appointment(app_id),
    FOREIGN KEY (patient_id) REFERENCES patient(person_id)
);
ALTER TABLE bill AUTO_INCREMENT = 1001;