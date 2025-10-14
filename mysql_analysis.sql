-- MySQL: Schema and analysis queries for Student Mental Health dataset
-- Adjust the file path in LOAD DATA LOCAL INFILE to your local path

CREATE DATABASE IF NOT EXISTS mental_health;
USE mental_health;

-- Cleaned table schema (numeric booleans for Yes/No fields)
CREATE TABLE IF NOT EXISTS students_mental_health (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Year VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    Course VARCHAR(150),
    Year_study VARCHAR(50),
    GPA_range VARCHAR(50),
    GPA_num FLOAT,
    Marital_status TINYINT(1),
    Depression TINYINT(1),
    Anxiety TINYINT(1),
    Panic_attack TINYINT(1),
    Treatment TINYINT(1),
    Commit_Suicide TINYINT(1)
);

-- Example: load cleaned CSV (exported from notebook) into the table
-- CHANGE the path below to the local path of Student_Mental_health_CLEAN.csv
-- LOAD DATA LOCAL INFILE 'C:/path/Student_Mental_health_CLEAN.csv'
-- INTO TABLE students_mental_health
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"'
-- LINES TERMINATED BY '\n' IGNORE 1 ROWS
-- (Year, Gender, Age, Course, Year_study, GPA_range, GPA_num, Marital_status, Depression, Anxiety, Panic_attack, Treatment, Commit_Suicide);

-- Useful analysis queries:

-- 1) Total students
SELECT COUNT(*) AS total_students FROM students_mental_health;

-- 2) Counts and percentages for mental health indicators
SELECT 
    SUM(Depression) AS total_depressed,
    ROUND(AVG(Depression)*100,2) AS pct_depressed,
    SUM(Anxiety) AS total_anxious,
    ROUND(AVG(Anxiety)*100,2) AS pct_anxious
FROM students_mental_health;

-- 3) Depression by Gender
SELECT Gender, SUM(Depression) AS depressed_count, ROUND(AVG(Depression)*100,2) AS pct_depressed
FROM students_mental_health
GROUP BY Gender;

-- 4) Average GPA by Depression status
SELECT Depression, COUNT(*) AS n, ROUND(AVG(GPA_num),2) AS avg_gpa
FROM students_mental_health
GROUP BY Depression;

-- 5) Crosstab: Year_study vs Depression rate
SELECT Year_study, SUM(Depression) AS depressed_count, ROUND(AVG(Depression)*100,2) AS pct_depressed
FROM students_mental_health
GROUP BY Year_study
ORDER BY pct_depressed DESC;
