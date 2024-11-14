SELECT * FROM bank_loan_analysis.finance;

/*
> Year wise loan amount
> Grade-Subgrade wise revolution balance
> Total Payment For Verified Status Vs Non Verified Status
> State Wise and month wise Loan Status
> Home Ownership Vs Last Payment Date Stats.

*/

# kpi 1
select year(issue_D) as Year_of_issue_d, sum(loan_amnt) as Total_loan_amnt
from bank_loan_analysis.finance
group by year_of_issue_d
order by year_of_issue_d;

# kpi 2
select 
grade , sub_grade , sum(revol_bal) as total_revol_bal
from bank_loan_analysis.finance
group by grade , sub_grade 
order by grade , sub_grade;

# kpi 3
select verification_status ,
concat("$", format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from bank_loan_analysis.finance
group by verification_status;

# kpi 4 
select addr_state , last_credit_pull_D , loan_status
from bank_loan_analysis.finance
group by addr_state , last_credit_pull_d , loan_status
order by last_credit_pull_d;

# kpi 5
select 
home_ownership,
last_pymnt_d,
concat("$", format(round(sum(last_pymnt_amnt) /10000, 2), 2), "k") as total_amount
from bank_loan_analysis.finance
group by 
home_ownership, last_pymnt_d
order by 
last_pymnt_d Desc, home_ownership Desc;
