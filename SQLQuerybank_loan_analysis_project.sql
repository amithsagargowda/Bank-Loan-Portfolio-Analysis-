select * from bank_loan
-- KEY PERFORMANCE INDICATORS(KPI's) REQUIREMENTS:

-- TOTAL LOAN APPLICATIONS 
--total loan applications 
select count(id) as total_loan_applications from bank_loan 
  -- 38576 applications 

--month to date total applications 
select count(id) as mtd_total_loan_applications from bank_loan 
where month(issue_date) = 12 and year(issue_date) = 2021
  -- 4314 applications 


--previous month to date total applications 
select count(id) as pmtd_total_loan_applications from bank_loan 
where month(issue_date) = 11 and year(issue_date) = 2021
-- 4035 applications 

-- TOTAL FUNDED AMOUNT 
-- total funded amount
select sum(loan_amount) as total_funded_amount from bank_loan
-- 43,57,57,075

-- month to date total funded amount
select sum(loan_amount) as mtd_total_funded_amount from bank_loan
where month(issue_date) = 12 and year(issue_date) = 2021
-- 5,39,81,425

-- previous month to date total funded amount
select sum(loan_amount) as pmtd_total_funded_amount from bank_loan
where month(issue_date) = 11 and year(issue_date) = 2021
-- 4,77,54,825

--TOTAL AMOUNT RECEIVED 
-- total amount received to the bank
select sum(total_payment) as total_amount_received from bank_loan 
-- 47,30,70,933

-- month to date total amount received 
select sum(total_payment) as mtd_total_amount_received from bank_loan
where month(issue_date) = 12 and year(issue_date) = 2021
-- 5,80,74,380

-- previous month to date total amount received 
select sum(total_payment) as pmtd_total_amount_received from bank_loan
where month(issue_date) = 11 and year(issue_date) = 2021
-- 5,01,32,030

-- AVERAGE INTREST RATE 
-- average intrest rate 
select round(avg(int_rate),4)*100 as average_intrest_rate from bank_loan
-- 12.05


-- month to date intrest rate 
select round(avg(int_rate),4)*100 as mtd_average_intrest_rate from bank_loan
where month(issue_date) = 12 and year(issue_date) = 2021
-- 12.36

-- previous month to date intrest rate 
select round(avg(int_rate),4)*100 as pmtd_average_intrest_rate from bank_loan
where month(issue_date) = 11 and year(issue_date) = 2021
-- 11.94


-- AVERAGE DEBT TO INCOME RATIO
-- avg DTI
select round (avg(dti),4)*100 as avg_dti from bank_loan
-- 13.33

-- month to date avg DTI
select round (avg(dti),4)*100 as mtd_avg_dti from bank_loan
where month(issue_date) = 12 and year(issue_date) = 2021
-- 13.67

-- previous month to date avg DTI 
select round (avg(dti),4)*100 as Pmtd_avg_dti from bank_loan
where month(issue_date) = 11 and year(issue_date) = 2021
-- 13.3


-- GOOD LOAN VS BAD LOAN KPI's
select distinct loan_status from bank_loan

-- GOOD LOAN - loan status = fully paid, current
-- good loan applications percentage 
select (count(case when loan_status = 'Fully paid' or loan_status = 'Current' then id end)*100)
/
count(id) as good_loan_percentage
from  bank_loan
-- 86%

-- good loan applications 
select count(id) as good_loan_applications from bank_loan
where loan_status= 'Fully paid' or loan_status = 'Current' 
-- 33243 applications 

-- good loan funded amount
select sum(loan_amount) as good_loan_funded_amount from bank_loan
where loan_status= 'Fully paid' or loan_status = 'Current' 
-- 37,02,24,850

-- good loan total amount received 
select sum(total_payment) as good_loan_total_amt_received from bank_loan
where loan_status= 'Fully paid' or loan_status = 'Current' 
-- 43,57,86,170

-- BAD LOAN - LOAN STATUS= CHARGED OFF
-- BAD LOAN PERCENTAGE 
select (count(case when loan_status = 'Charged off' then id end)*100)
/
count(id) as bad_loan_percentage
from  bank_loan
-- 13%

-- bad loan applications 
select count(id) as bad_loan_applications from bank_loan
where loan_status= 'Charged off' 
-- 5333 applications 

-- bad loan fundeed amount
select sum(loan_amount) as bad_loan_funded_amount from bank_loan
where loan_status= 'Charged off'  
-- 6,55,32,225

-- Bad loan amount received 
select sum(total_payment) as bad_loan_total_amt_received from bank_loan
where loan_status= 'Charged off'
-- 3,72,84,763


-- LOAN STATUS GRIF VIEW 

SELECT 
loan_status,
count(id) as total_loan_applications,
sum(total_payment) as total_amount_received, 
sum(loan_amount) as total_funded_amount,
avg(int_rate*100) as intrest_rate,
avg(dti*100) as dti 
 FROM 
 bank_loan
group by loan_status

SELECT 
loan_status,
sum(total_payment)as mtd_total_amount_received,
sum(loan_amount) as mtd_total_funded_amount
from bank_loan 
where Month(issue_date) = 12 
group by loan_status


-- monthly trends by issue date 
select
      month(issue_date),
      datename(month,issue_date),
      count(id) as total_loan_applications,
      sum(loan_amount) as total_funded_amount,
      sum(total_payment) as totoal_amount_received
      from bank_loan
      group by month(issue_date), datename(month,issue_date)
      order by month(issue_date) 


--regional analysis by state 
select 
     address_state,
     count(id) as total_loan_applications,
      sum(loan_amount) as total_funded_amount,
      sum(total_payment) as totoal_amount_received
      from bank_loan
      group by address_state
      order by count(id)desc

-- long term analysis 
select 
    term,
     count(id) as total_loan_applications,
      sum(loan_amount) as total_funded_amount,
      sum(total_payment) as totoal_amount_received
      from bank_loan
      group by term
      order by term 

-- employee length analysis
select 
    emp_length,
     count(id) as total_loan_applications,
      sum(loan_amount) as total_funded_amount,
      sum(total_payment) as totoal_amount_received
      from bank_loan
      group by emp_length
      order by count(id)   desc


--loan purpose breakdown
select 
    purpose  ,
     count(id) as total_loan_applications,
      sum(loan_amount) as total_funded_amount,
      sum(total_payment) as totoal_amount_received
      from bank_loan
      group by purpose 
      order by count(id)   desc


-- home ownership anlysis 
select 
    home_ownership,
     count(id) as total_loan_applications,
      sum(loan_amount) as total_funded_amount,
      sum(total_payment) as totoal_amount_received
      from bank_loan
      group by home_ownership 
      order by count(id)   desc

select * from bank_loan

--early warning risk indicators
select *,risk_band =
case 
  WHEN loan_status = 'Charged Off' THEN 'High Risk'
  WHEN dti >= 0.20 AND int_rate >= 0.15 THEN 'High Risk'
  WHEN dti >= 0.15 OR int_rate >= 0.12 THEN 'Medium Risk'
  ELSE 'Low Risk'
  end
  from bank_loan