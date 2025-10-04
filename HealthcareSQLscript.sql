Create Database HEALTHCARE;
USE HEALTHCARE;

-- 1. Find total number of patients treated by each doctor
SELECT Doctor, COUNT(DISTINCT Patient_ID) AS Total_Patients
FROM hospitalrecords
GROUP BY Doctor
ORDER BY Total_Patients DESC;

--  2. Show all patients treated by a specific doctor (e.g., 'Jay Sinha')
SELECT Patient_ID, Doctor, Diagnosis
FROM hospitalrecords
WHERE Doctor = 'Jay Sinha';

    
-- 3. Identify top 3 most common medical tests conducted
SELECT Test, COUNT(*) AS Test_Count
FROM hospitalrecords
GROUP BY Test
ORDER BY Test_Count DESC
LIMIT 3;

-- 4.  Top 3 most common diseases
SELECT Diagnosis, COUNT(*) AS Total_Cases
FROM hospitalrecords
GROUP BY Diagnosis
ORDER BY Total_Cases DESC
LIMIT 3;

-- 5. Compare total billing between ICU and General beds
SELECT Bed_Occupancy, SUM(`Billing Amount`) AS Total_Billing
FROM hospitalrecords
WHERE Bed_Occupancy IN ('ICU', 'General')
GROUP BY Bed_Occupancy;

-- 6. Find top 5 patients with the highest billing amount
SELECT Patient_ID, Doctor, Diagnosis, `Billing Amount`
FROM hospitalrecords
ORDER BY `Billing Amount` DESC
LIMIT 5;

-- 7. Calculate the difference between billed and insurance-covered amounts per patient
SELECT Patient_ID, Doctor, 
       `Billing Amount`, `Health Insurance Amount`,
       (`Billing Amount` - `Health Insurance Amount`) AS Out_of_Pocket_Expense
FROM hospitalrecords
ORDER BY Out_of_Pocket_Expense DESC;

-- 8. Revenue contribution by each doctor
SELECT Doctor, SUM(`Billing Amount`) AS Total_Revenue
FROM hospitalrecords
GROUP BY Doctor
ORDER BY Total_Revenue DESC;

-- 9. Average patient feedback score per doctor
SELECT Doctor, ROUND(AVG(Feedback),2) AS Avg_Feedback
FROM hospitalrecords
GROUP BY Doctor
ORDER BY Avg_Feedback DESC;

-- 10. Doctor with the highest patient load
SELECT Doctor, COUNT(Patient_ID) AS Patients_Handled
FROM hospitalrecords
GROUP BY Doctor
ORDER BY Patients_Handled DESC
LIMIT 1;
