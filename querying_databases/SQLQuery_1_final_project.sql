
-- Problem 1
-- Find the total number of crimes recorded in the CRIME table.
SELECT COUNT(*) AS Total_Crimes
FROM chicago_crime;

-- Problem 2
-- Retrieve first 10 rows from the CRIME table.
SELECT *
FROM chicago_crime
LIMIT 10;

-- Problem 3
-- How many crimes involve an arrest?
SELECT COUNT(*) AS Crimes_With_Arrest
FROM chicago_crime
WHERE ARREST = 'true';

-- Problem 4
-- Which unique types of crimes have been recorded at GAS STATION locations?
SELECT DISTINCT PRIMARY_TYPE
FROM chicago_crime
WHERE LOCATION_DESCRIPTION = 'GAS STATION';

-- Problem 5
-- In the CENUS_DATA table list all Community Areas whose names start with the letter ‘B’.
SELECT COMMUNITY_AREA_NAME
FROM chicago_socioeconomic_data
WHERE COMMUNITY_AREA_NAME LIKE 'B%';

-- Problem 6
-- Which schools in Community Areas 10 to 15 are healthy school certified?
SELECT NAME_OF_SCHOOL, COMMUNITY_AREA_NUMBER
FROM chicago_public_schools
WHERE COMMUNITY_AREA_NUMBER BETWEEN 10 AND 15
AND HEALTHY_SCHOOL_CERTIFIED = 'Yes';

-- Problem 7
-- What is the average school Safety Score?
SELECT AVG(SAFETY_SCORE) AS Average_Safety_Score
FROM chicago_public_schools;

-- Problem 8
-- List the top 5 Community Areas by average College Enrollment [number of students]
SELECT COMMUNITY_AREA_NAME, AVG(COLLEGE_ENROLLMENT) AS Average_College_Enrollment
FROM chicago_public_schools
GROUP BY COMMUNITY_AREA_NAME
ORDER BY Average_College_Enrollment DESC
LIMIT 5;

-- Problem 9
-- Use a sub-query to determine which Community Area has the least value for school Safety Score?
SELECT COMMUNITY_AREA_NAME, SAFETY_SCORE
FROM chicago_public_schools
WHERE SAFETY_SCORE = (
    SELECT MIN(SAFETY_SCORE)
    FROM chicago_public_schools
);

-- Problem 10
-- [Without using an explicit JOIN operator] Find the Per Capita Income of the Community Area which has a school Safety Score of 1.
SELECT PER_CAPITA_INCOME
FROM chicago_socioeconomic_data
WHERE COMMUNITY_AREA_NUMBER = (
    SELECT COMMUNITY_AREA_NUMBER
    FROM chicago_public_schools
    WHERE CAST(SAFETY_SCORE AS INT) = 1
    LIMIT 1
);
