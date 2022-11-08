select top 10 *
from [International Debt]..international_debt


--finding the number of distinct countries 

SELECT 
   count(distinct country_name) AS total_distinct_countries
FROM [International Debt]..international_debt


--finding out the distinct debt indicators 

select 
    distinct indicator_code as distinct_debt_indicators
from [International Debt]..international_debt
order by distinct_debt_indicators


--totaling the amount of debt owed by the countries 
--find out the total amount of debt (in USD) that is owed by the different countries

SELECT 
    round((sum(debt)/1000000), 2) as total_debt
FROM [International Debt]..international_debt; 


--country with highest debt 
--find out the country that owns the highest amount of debt along with the amount

SELECT top 1
    country_name, 
    sum(debt) as total_debt
FROM [International Debt]..international_debt
GROUP BY country_name
ORDER BY total_debt desc


--average amount of debt across all indicators 
--find out on an average how much debt a country owes

SELECT top 10
    indicator_code AS debt_indicator,
    indicator_name,
    avg(debt) as average_debt
FROM [International Debt]..international_debt
GROUP BY indicator_code, indicator_name
ORDER BY average_debt desc


--The highest amount of principal repayments 
--find out which country owes the highest amount of debt in the category of long term debts

SELECT 
    country_name, 
    indicator_name
FROM [International Debt]..international_debt
WHERE debt = (SELECT 
                 max(debt)
             FROM [International Debt]..international_debt
             where indicator_code = 'DT.AMT.DLXF.CD')


--The most common debt indicator
-- most common indicator in which the countries owe their debt

select top 20
    indicator_code,
    count(indicator_code) as indicator_count
from [International Debt]..international_debt
group by indicator_code
order by indicator_count desc, indicator_code desc


--Other viable debt issues and conclusions
--find out the maximum amount of debt that each country has

select top 10
    country_name,
    max(debt) as maximum_debt
from [International Debt]..international_debt
group by country_name
order by maximum_debt desc


