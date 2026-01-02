use hospital_management_system;

select * from appointments;
select * from billing;
select * from doctors;
select * from patients;
select * from treatments;

# Exploratory Data Analysis -

# Check total patients?
select count(*) as patients
from patients;

# Total appointments?
select count(*) as appointments
from appointments;

# Total revenue of all branches?
select sum(amount) as hospitals_revenue
from billing;

# Total doctors?
select count(*) as doctors
from doctors;

# Check Total hospitals?
select count(distinct hospital_branch) as hospitals
from doctors;

# Check total appointments per month?
select count(appointment_id) as total_appointments,
monthname(appointment_date) as Months
from appointments
group by monthname(appointment_date)
order by count(appointment_id) 
asc;

# Check the average age of patient by its gender?
select round(avg(timestampdiff(Year, date_of_birth, curdate()))) as age, 
gender 
from patients
group by gender;

# Check status of the all appointments?
select count(*) as total_appointments, status
from appointments
group by status;

# What is the most common reason for visit of patients?
select count(reason_for_visit) as visits,reason_for_visit
from appointments
group by reason_for_visit;

# List the patients whose reason_for_visit is emergency?
select patient_id,reason_for_visit
from appointments
where reason_for_visit='Emergency';

# Identify the days where appointments are higher?
select count(appointment_id) as appointments,
dayname(appointment_date) as day
from appointments
group by dayname(appointment_date)
order by count(appointment_id) desc;

# Check patients by Gender?
select distinct gender,count(patient_id) as total_patients
from patients
group by gender;

# Patients more than 5 visits?
select patient_id,count(patient_id) as patients_more_than_3_visits
from appointments
group by patient_id
having count(patient_id)>5
order by count(patient_id) desc;

# Appointments per doctor?
select count(appointments.appointment_id) as total_appointments,doctors.doctor_id
from appointments
right join
doctors
on appointments.doctor_id=doctors.doctor_id
group by doctors.doctor_id;

# What is Average treatment cost for each doctor?
select round(avg(treatments.cost)) as average_treatment_cost,appointments.doctor_id
from treatments
right join
appointments
on treatments.appointment_id=appointments.appointment_id
group by appointments.doctor_id
order by appointments.doctor_id
asc;

# Which top 5 doctors treating maximum patients?
select count(appointments.patient_id) as total_patients, doctors.doctor_id
from appointments
right join
doctors
on appointments.doctor_id=doctors.doctor_id
group by doctors.doctor_id
order by count(appointments.patient_id)
desc
limit 5;

# Check monthly revenue trend?
select monthname(bill_date) as Months, 
sum(amount) as monthly_revenue
from billing
group by monthname(bill_date);

#  Day wise revenue trend?
select dayname(bill_date) as days,
sum(amount) as daily_revenue
from billing
group by dayname(bill_date);

# Months with minimum patient visits?
select monthname(appointment_date) as Months, 
count(appointment_id) as total_appointments
from appointments
group by monthname(appointment_date)
having count(appointment_id)<15;

# Check payment received by payment method?
select sum(amount) as revenue,payment_method
from billing
group by payment_method;

# Revenue by each doctor?
select distinct appointments.doctor_id,sum(billing.amount) as revenue
from appointments
right join billing
on appointments.patient_id=billing.patient_id
group by appointments.doctor_id
order by appointments.doctor_id asc;

# What is the payment status of all revenue?
select sum(amount) as revenue,payment_status
from billing
group by payment_status;

# Treatment costing more than average cost?
select treatment_type,cost
from treatments 
where cost>(select avg(cost) from treatments); 

# Doctors billing amount above average billing amount?
select billing.amount as above_average_billing,appointments.doctor_id
from billing
right join
appointments
on billing.patient_id=appointments.patient_id
where billing.amount>(select avg(billing.amount) from billing);

# patients with highest visits to hospital?
select patient_id,count(appointment_id) as total_appointments
from appointments
group by patient_id
having count(appointment_id)>1
order by count(appointment_id)
desc;

# appointment by hospital branch?
select count(appointments.appointment_id) as total_appointments, doctors.hospital_branch
from appointments
left join
doctors
on appointments.doctor_id=doctors.doctor_id
group by doctors.hospital_branch;

# List the patient who are taking chemotherapies?
select appointments.patient_id,treatments.treatment_type
from appointments
left join
treatments
on appointments.appointment_id=treatments.appointment_id
where treatments.treatment_type like 'Chemo%';

# List the patient which are treated between 1st to 6th month?
select appointments.patient_id,treatments.treatment_date
from appointments
right join
treatments
on appointments.appointment_id=treatments.appointment_id
where month(treatments.treatment_date) 
between 1 and 6
order by 
month(treatments.treatment_date) asc;

# Check the patient where appoints between 12 to 14 hour time?
select count(appointment_id),appointment_time
from appointments
group by appointment_time
having hour(appointment_time) between 12 and 16
order by count(appointment_id)
asc;