create table vehicle(
VIN varchar(255),
car_type_id int,
model_year int);

Select * From vehicle

create table car_type(
car_type_id int,
car_make varchar(255),
car_model varchar(255));

select * from car_type

create table claim(
claim_number varchar(255),
status_id int,
policy_number varchar(255),
amount int,
claim_date varchar(255));

select * from claim

create table customer(
customer_number varchar(255),
first_name varchar(255),
last_name varchar(255),
street_address varchar(255),
city varchar(255),
state varchar(255),
postal_code int);

select * from customer

create table policy(
policy_number varchar(255),
policy_limit int,
deductible int,
expiration_date varchar(255),
VIN varchar(255),
customer_number varchar(255));

select * from policy

create table status(
status_id int,
status varchar(255));

select * from status

--What is the customer information for customer for customers who live in Los Angeles?
select * from customer where city = 'Los Angeles';

--What is the average value of all approved claims?
Select * from claim full join status on claim.status_id = status.status_id;
select avg(amount) as avg_amt from claim, status where claim.status_id = 2 and status.status = 'approved';

--What are the top 5 policies by claim count?
select policy_number, count(*) as claim_count from claim group by policy_number order by claim_count desc limit 5;

--what are the 5 policies by total claim count?
select policy_number, sum(amount) as total_claim_amount from claim group by policy_number order by total_claim_amount desc limit 5;

--What is the vehicle identification number (VIN) and model year for cars with a policy expiration date after october 31, 2019 and a model year
select * from policy inner join vehicle on policy.VIN = vehicle.VIN;
select policy.VIN, vehicle.model_year from policy, vehicle where
policy.expiration_date > '2019-10-31' and vehicle.model_year <= 1985;

--List the cities in New York or New Jesrey where customers who have policies with NO claims live.
Select distinct customer.city from customer join policy on policy.customer_number = customer.customer_number
left join claim on policy.policy_number = claim.policy_number where (customer.state = 'New York' or customer.state = 'New Jersey')
and claim.policy_number is null;




