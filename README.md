SQL Data Analysis: Breast Cancer Dataset

Introduction

This project involves a comprehensive exploratory data analysis (EDA) of a Breast Cancer dataset using SQL. The analysis aims to extract insights into patient demographics, tumor characteristics, treatment stages, and survival outcomes. Understanding these factors is crucial for medical research, prognosis, and developing targeted treatment strategies. The SQL script provided cleans the data and performs various queries to uncover statistical distributions and relationships within the dataset.

Objective
The primary objectives of this SQL data analysis project are:

To load and prepare the breast cancer dataset within a MySQL environment.

To analyze patient demographics, including age, race, and marital status.

To investigate tumor characteristics such as size and grade, and their relation to cancer stages.

To examine survival rates and their correlation with various clinical factors like estrogen status, regional node involvement, and differentiation level.

To provide quantitative insights into the dataset that can aid in understanding breast cancer patient profiles and outcomes.

Implementation Steps
The breast cancer project.sql script executes the following steps:

Database and Table Setup:

Created a database named breast_cancer.

Created a table named breast_cancer_copy with columns for Age, Race, Marital_Status, T_Stage, N_Stage, Stage_6th, differentiate, Grade, A_Stage, Tumor_Size, Estrogen_Status, Progesterone_Status, Regional_Node_Examined, Reginol_Node_Positive, Survival_Months, and Status1.

Inserted data from the breast_cancer table into breast_cancer_copy.

Exploratory Data Analysis (EDA) Queries:

Average Age: Calculated the average age of patients.

Marital Status Distribution: Counted the number of patients for each marital status category (Divorced, Single, Married, Widowed, Separated).

Most Common Tumor Grade: Identified the tumor grade with the highest frequency.

Average Survival Time: Computed the average survival time in months for all patients.

Survival Time by Estrogen Status: Compared the average survival time for estrogen-positive and estrogen-negative patients.

Patients Survived > 5 Years: Counted patients with Survival_Months greater than 60.

Average Tumor Size by Differentiation Level: Calculated the average tumor size for each differentiation level.

Patients per Cancer Stage: Counted the number of patients falling into each cancer stage (Stage_6th).

Tumor Size vs. Positive Regional Nodes: Selected Tumor_Size and Reginol_Node_Positive to visually inspect their relationship.

Percentage Alive After 5 Years: Calculated the percentage of patients alive after 5 years (Survival_Months >= 60 AND Status1 = 'Alive').

Survival Status by Marital Status: Analyzed the count and percentage of patients by Marital_Status and Status1 (Alive/Dead).

Average Regional Nodes Examined by T Stage: Calculated the average number of regional nodes examined for each T_Stage.

Poorly Differentiated Tumors Alive: Counted patients with "Poorly differentiated" tumors who are "Alive."

Results
The SQL analysis provides quantitative insights into various aspects of the breast cancer dataset. Below are some key results obtained from the queries:

Average Age of Patients: Approximately 59 years (round(avg(Age)) result).

Most Common Tumor Grade: Grade 2 has the highest count.

Average Survival Time (Overall): Approximately 61 months (round(avg(Survival_Months)) result).

Average Survival Time by Estrogen Status:

Estrogen Positive: Approximately 65 months.

Estrogen Negative: Approximately 55 months. (This indicates a potentially better prognosis for estrogen-positive patients in terms of survival months.)

Patients Survived More Than 5 Years: The query select count(Survival_Months) as More_than_five from breast_cancer_copy where Survival_Months > 60; directly provides this count.

Percentage of Patients Alive After 5 Years: Calculated by (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM breast_cancer_copy) WHERE Survival_Months >= 60 AND Status1 = 'Alive', giving the exact percentage.

Poorly Differentiated Tumors, Alive: The query select count(differentiate), Status1 from breast_cancer_copy where differentiate = "Poorly differentiated" and Status1 = "Alive"; provides this specific count.

These quantitative findings offer valuable insights into patient characteristics and survival patterns within the breast cancer dataset, which can serve as a foundation for further medical research or predictive modeling.

Contact Information
For any questions, discussions, or potential collaborations on this project, please feel free to connect:

Name: Pranjal Joshi

Email: pranjaljoshi2811@gmail.com

GitHub: https://github.com/pranjal2811

LinkedIn: https://www.linkedin.com/in/pranjaljoshi2811
