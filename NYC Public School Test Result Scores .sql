Select top 10  *
from [NYC Public School Test Scores]..schools_modified


--finding missing values
--Count rows with percent_tested missing and total number of schools 

select 
	sum(case when percent_tested is null then 1
                   else 0 end)as num_tested_missing,
    count (*) as num_schools
from [NYC Public School Test Scores]..schools_modified


--Count the number of unique building_code values

select
    count(distinct building_code) as num_school_buildings
from [NYC Public School Test Scores]..schools_modified

--Best schools for math
-- Select school and average_math
-- Filter for average_math 640 or higher
-- Display from largest to smallest average_math

select 
    school_name,
    average_math
from [NYC Public School Test Scores]..schools_modified
where average_math >= 640
order by average_math desc


-- Find lowest average_reading
select 
    min(average_reading) as lowest_reading
from [NYC Public School Test Scores]..schools_modified


--Best writing school
-- Find the top score for average_writing
-- Group the results by school
-- Sort by max_writing in descending order
-- Reduce output to one school

select top 1
    school_name,
    max(average_writing) as max_writing
from [NYC Public School Test Scores]..schools_modified
group by school_name
order by max_writing desc


--top 10 schools 
-- Calculate average_sat
-- Group by school_name
-- Sort by average_sat in descending order
-- Display the top ten results

select top 10
    school_name,
    sum(average_math + average_reading + average_writing) as average_sat
from [NYC Public School Test Scores]..schools_modified
group by school_name
order by average_sat desc


--Ranking boroughs
-- Select borough and a count of all schools, aliased as num_schools
-- Calculate the sum of average_math, average_reading, and average_writing, divided by a count of all schools, aliased as average_borough_sat
-- Organize results by borough
-- Display by average_borough_sat in descending order

select
    borough,
    count(*) as num_schools,
    sum(average_math + average_reading + average_writing)/ count(*) as average_borough_sat
from [NYC Public School Test Scores]..schools_modified
group by borough
order by average_borough_sat desc


--Brooklyn Numbers
-- Select school and average_math
-- Filter for schools in Brooklyn
-- Aggregate on school_name
-- Display results from highest average_math and restrict output to five rows

select top 5
    school_name,
    average_math
from [NYC Public School Test Scores]..schools_modified
where borough = 'Brooklyn'
group by school_name, average_math
order by average_math desc
