 create database breast_cancer;
 use breast_cancer;
CREATE TABLE `breast_cancer_copy` (
  `Age` int DEFAULT NULL,
  `Race` text,
  `Marital_Status` text,
  `T_Stage` text,
  `N_Stage` text,
  `Stage_ 6th` text,
  `differentiate` text,
  `Grade` int DEFAULT NULL,
  `A_Stage` text,
  `Tumor_Size` int DEFAULT NULL,
  `Estrogen_Status` text,
  `Progesterone_Status` text,
  `Regional_Node_Examined` int DEFAULT NULL,
  `Reginol_Node_Positive` int DEFAULT NULL,
  `Survival_Months` int DEFAULT NULL,
  `Status1` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into breast_cancer_copy select * from breast_cancer;

select* from breast_cancer_copy;

-- 1. What is the average age of patients in the dataset?
select round(avg(Age)) as Average_Age from breast_cancer_copy;

-- 2. What is the distribution of marital status among patients?
select count(Marital_Status) as Divorced_pt from breast_cancer_copy where Marital_Status = "Divorced";
select count(Marital_Status) as Single_pt from breast_cancer_copy where Marital_Status = "Single ";
select count(Marital_Status) as Married_pt from breast_cancer_copy where Marital_Status = "Married";
select count(Marital_Status) as Widowed_pt from breast_cancer_copy where Marital_Status = "Widowed";
select count(Marital_Status) as Separated_pt from breast_cancer_copy where Marital_Status = "Separated";

-- 3. What is the most common tumor grade in the dataset?
select Grade, count(Grade) as common_grade from breast_cancer_copy group by Grade order by common_grade desc;

-- 4. What is the average survival time (in months) for patients?
select round(avg(Survival_Months)) as Average_survival_time from breast_cancer_copy;

-- 5. Compare the average survival time between estrogen-positive and estrogen-negative patients.
select Estrogen_Status, round(avg(Survival_Months)) as Average_survival_time from breast_cancer_copy group by Estrogen_Status;

-- 6. Identify patients who survived more than 5 years. How many are there? 
select count(Survival_Months) as More_than_five from breast_cancer_copy where Survival_Months > 60;

-- 7. What is the average tumor size for each differentiation level?
SELECT differentiate as Differentiation_level, AVG(Tumor_Size) as average_tumor_size from breast_cancer_copy GROUP BY differentiate;

-- 8. How many patients fall into each cancer stage?
select Stage_6th, count(Stage_6th) as patients_fall_into from breast_cancer_copy group by Stage_6th order by patients_fall_into;

-- 9. What is the correlation between tumor size and the number of positive regional nodes?
select Tumor_Size, Reginol_Node_Positive from breast_cancer_copy;

-- 10. What percentage of patients are alive after 5 years?
 SELECT (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM breast_cancer_copy) AS Percentage_Alive_After_5_Years FROM breast_cancer_copy WHERE Survival_Months >= 60 AND Status1 = 'Alive';

-- 11. How does survival status vary by marital status?
SELECT Marital_Status, Status1, COUNT(*) AS Count_of_Patients, ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY Marital_Status), 2) AS Percentage FROM breast_cancer_copy GROUP BY Marital_Status, Status1 ORDER BY Marital_Status, Status1;

-- 12. What is the average number of regional nodes examined for each T Stage?
select round(avg(Regional_Node_Examined),2) as ave_num_range, T_Stage from breast_cancer_copy group by T_Stage;

-- 13. How many patients with poorly differentiated tumors are alive?
select count(differentiate), Status1 from breast_cancer_copy where differentiate = "Poorly differentiated" and Status1 = "Alive";
