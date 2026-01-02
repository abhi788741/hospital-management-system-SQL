create database hospital_management_system;
use hospital_management_system;

create table appointments(appointment_id varchar(50) primary key, 
                          patient_id varchar(50),
                          doctor_id varchar(50), 
                          appointment_date date, 
                          appointment_time time, 
                         reason_for_visit varchar(50), 
                         status varchar(50));

create table billing(bill_id varchar(50), 
                     patient_id varchar(50),
                     treatment_id varchar(50) primary key,
                     bill_date date, 
                     amount int, 
                    payment_method varchar(50), 
                    payment_status varchar(50));
                    
create table doctors(doctor_id varchar(50), 
                     first_name varchar(50),
                    last_name varchar(50), 
                    specialization varchar(50),
                    phone_number varchar(50), 
                    year_experience int, 
                    hospital_branch varchar(50),
                    email varchar(50));
                    
create table patients(patient_id varchar(50), 
                      first_name varchar(50), last_name varchar(50),
                      gender varchar(50), 
                      date_of_birth date, 
                      contact_number varchar(50),
                     address varchar(50), 
                     registration_date date, 
                     insurance_provider varchar(50),
                     insurance_number varchar(50), 
                     email varchar(50));
                     
create table treatments(treatment_id varchar(50) primary key, 
                        appointment_id varchar(50) unique, 
                        treatment_type varchar(50), 
                        description varchar(50), 
                        cost int, 
                        treatment_date date);