use hospital_management_system;
                        
select count(*) from appointments;
select count(*) from billing;
select count(*) from doctors;
select count(*) from patients;
select count(*) from treatments;

#checking data types

describe appointments;
describe billing;
describe doctors;
describe patients;
describe treatments;


# Check null values in all column of all table

select count(*) as null_values_in_appointments
from appointments 
where appointment_id is null or 
patient_id is null or 
doctor_id is null or
appointment_date is null or 
appointment_time is null or 
reason_for_visit is null or
status is null;

select count(*) as null_values_in_billing
from billing 
where bill_id is null or 
patient_id is null or 
treatment_id is null or 
bill_date is null or 
amount is null or 
payment_method is null or
payment_status is null;

select count(*) as null_values_in_doctors
from doctors 
where doctor_id is null or 
first_name is null or 
last_name is null or
specialization is null or 
phone_number is null or 
year_experience is null or
hospital_branch is null;

select count(*) as null_values_in_patients
from patients
where patient_id is null or 
first_name is null or 
last_name is null or 
gender is null or 
date_of_birth is null or 
contact_number is null or 
address is null or 
registration_date is null or
insurance_provider is null or 
insurance_number is null or 
email is null;

select count(*) as null_values_in_treatments
from treatments
where treatment_id is null or 
appointment_id is null or 
treatment_type is null or
description is null or 
cost is null or 
treatment_date is null;

# Check duplicates in Main columns

select appointment_id, appointment_date 
from appointments
group by appointment_id, appointment_date
having count(appointment_id)>1 
and count(appointment_date)>1;

select bill_id,treatment_id,bill_date 
from billing
group by bill_id, treatment_id, bill_date
having count(bill_id)>1 
or count(treatment_id)>1 
or count(bill_date)>1;

select doctor_id 
from doctors
group by doctor_id 
having count(doctor_id)>1;

select patient_id
from patients
group by patient_id
having count(patient_id)>1;

select treatment_id, appointment_id
from treatments
group by treatment_id, appointment_id
having count(treatment_id)>1 
and count(appointment_id);

# data retrieving

select * from appointments;
select * from billing;
select * from doctors;
select * from patients;
select * from treatments;