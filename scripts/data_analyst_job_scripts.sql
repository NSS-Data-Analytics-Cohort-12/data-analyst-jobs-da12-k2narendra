-- The dataset for this exercise has been derived from the `Indeed Data Scientist/Analyst/Engineer` [dataset](https://www.kaggle.com/elroyggj/indeed-dataset-data-scientistanalystengineer) on kaggle.com. 

-- Before beginning to answer questions, take some time to review the data dictionary and familiarize yourself with the data that is contained in each column.

-- #### Provide the SQL queries and answers for the following questions/tasks using the data_analyst_jobs table you have created in PostgreSQL:

-- 1.	How many rows are in the data_analyst_jobs table?
select count(*) 
	from data_analyst_jobs;
-- Ans: 1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
select * 
from data_analyst_jobs 
limit 10;
-- Ans: "ExxonMobil"

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
select count(*) 
from data_analyst_jobs
where location='TN';
-- Ans:21
select count(*) 
from data_analyst_jobs
where location in('TN','KY');
--Ans: 27
	
-- 4.	How many postings in Tennessee have a star rating above 4?
select count(*) 
from data_analyst_jobs
where star_rating>4;
--Ans:416

-- 5.	How many postings in the dataset have a review count between 500 and 1000?
select count(*) 
from data_analyst_jobs
where review_count between (5000 and 1000);
--Ans 83

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
select location as state, avg(star_rating) as avg_rating
from data_analyst_jobs
group by location
order by avg_rating desc
--Ans: NE

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
select count(distinct title) from data_analyst_jobs;
--Ans: 881

-- 8.	How many unique job titles are there for California companies?
select count(distinct title) from data_analyst_jobs
	where location='CA';
--Ans: 230
-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
select count(company)
	from data_analyst_jobs 
	having count(avg(star_rating))>5000;

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
