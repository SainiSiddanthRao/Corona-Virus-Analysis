use intership;
show tables;
DESC `corona virus dataset`;
# 1st question
SELECT * FROM `corona virus dataset` WHERE province IS NULL;
# 2nd Question
SET SQL_SAFE_UPDATES = 0;
UPDATE `corona virus dataset`
SET 
    Province = IFNULL(Province, 0),
    `Country/Region` = IFNULL(`Country/Region`, 0),
    Latitude = IFNULL(Latitude, 0),
    Longitude = IFNULL(Longitude, 0),
    `Date` = IFNULL(`Date`, 0),
    Confirmed = IFNULL(Confirmed, 0),
    Deaths = IFNULL(Deaths, 0),
    Recovered = IFNULL(Recovered, 0)
WHERE 
    date > 0;
#3rd Question
SELECT COUNT(*) AS total_rows FROM `corona virus dataset`;
#4th Question
SELECT MIN(date) AS start_date, MAX(date) AS end_date
FROM `corona virus dataset`;
#5th question
SELECT COUNT(DISTINCT CONCAT(YEAR(Date), '-', MONTH(Date))) AS num_months
FROM `corona virus dataset`;
#6th Question
SELECT 
    MONTH(Date) AS month,
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM 
 `corona virus dataset`
GROUP BY 
    MONTH(Date);
#7th Question
SELECT Confirmed AS most_frequent_confirmed_value, COUNT(*) AS frequency
FROM `corona virus dataset`
GROUP BY Confirmed
ORDER BY frequency DESC
LIMIT 1;
#8th Question
SELECT 
    YEAR(`Date`) AS year,
    MIN(Confirmed) AS min_confirmed,
    MIN(Deaths) AS min_deaths,
    MIN(Recovered) AS min_recovered
FROM 
    `corona virus dataset`
GROUP BY 
    YEAR(`Date`);
# 9th Question
SELECT YEAR(Date) AS year,
       MAX(Confirmed) AS max_confirmed,
       MAX(Deaths) AS max_deaths,
       MAX(Recovered) AS max_recovered
FROM `corona virus dataset`
GROUP BY YEAR(Date);
# 10th Question
   SELECT YEAR(Date) AS year,
       MONTH(Date) AS month,
       SUM(Confirmed) AS total_confirmed,
       SUM(Deaths) AS total_deaths,
       SUM(Recovered) AS total_recovered
FROM `corona virus dataset`
GROUP BY YEAR(Date), MONTH(Date);
#11th Question
SELECT COUNT(Confirmed) AS total_cases,
       AVG(Confirmed) AS average_cases,
       VARIANCE(Confirmed) AS variance_cases,
       STDDEV(Confirmed) AS stdev_cases
FROM `corona virus dataset`;
#12th Question
SELECT YEAR(Date) AS year,
       MONTH(Date) AS month,
       COUNT(Deaths) AS total_deaths,
       AVG(Deaths) AS average_deaths,
       VARIANCE(Deaths) AS variance_deaths,
       STDDEV(Deaths) AS stdev_deaths
FROM `corona virus dataset`
GROUP BY YEAR(Date), MONTH(Date);
#13th Question
SELECT COUNT(Recovered) AS total_recovered_cases,
       AVG(Recovered) AS average_recovered_cases,
       VARIANCE(Recovered) AS variance_recovered_cases,
       STDDEV(Recovered) AS stdev_recovered_cases
FROM `corona virus dataset`;
# 14th Question
select `Country/Region`, MAX(Confirmed) AS max_confirmed_cases
FROM `corona virus dataset`
GROUP BY `Country/Region`
ORDER BY max_confirmed_cases DESC
LIMIT 1;
# 15th question
SELECT `Country/Region`, MIN(Deaths) AS min_death_cases
FROM `corona virus dataset`
GROUP BY `Country/Region`
ORDER BY min_death_cases ASC
LIMIT 1;
#16th Question
SELECT `Country/Region`, SUM(Recovered) AS total_recovered_cases
FROM `corona virus dataset`
GROUP BY `Country/Region`
ORDER BY total_recovered_cases DESC
LIMIT 5;