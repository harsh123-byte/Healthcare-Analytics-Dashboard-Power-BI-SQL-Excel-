# Healthcare-Analytics-Dashboard-Power-BI-SQL-Excel-
A Healthcare Data Analyst Project with the combination of (sql+Excel+Power BI)


1. EXCEL

    Cleaned and organized healthcare data in Excel to prepare patient, doctor, and billing information for analysis in Power BI.
    A Dataset of 7000+ rows and 11 Columns

  Columns Name -

                Patient_ID

                Admit_Date

                 Discharge_Date

                 Diagnosis

                 Bed_Occupancy	

                 Test

                 Doctor

                 Followup Date

                 Feedback

                 Billing Amount

                 Health Insurance Amount


  Open the Excel File (📄HealthcareEXCEL.XlSX ) in MS Excel 
  

  

 
 2. Power BI Dashboard

      Developed an interactive Power BI dashboard to visualize patient trends, doctor performance, and hospital revenue             insights.
   
      Power BI Dashboard Contains-
   
   
       A. Patient & Admission Insights

          -Total patients admitted (unique Patient_IDs).

          -Admission trends by month/week.

          -Average length of stay (Discharge_Date – Admit_Date).

          -follow_up Date.
   
      
      B. Resource Utilization

         -Bed occupancy analysis (General, ICU, Private).

         -ICU vs General vs Private bed demand trends.
   
       
      C. Diagnosis & Treatment Analysis

         -Top diseases diagnosed (Flu, Typhoid, Malaria, etc.).

         -Distribution of patients by tests conducted (MRI, CT Scan, Blood Test).

         -Doctor-wise patient counts (performance comparison).
   

      D. Financial Performance

        -Total Billing Amount generated.

        -Total Billing per patient.

        -comparison of Health Insurance Amount vs Total Billing Amount.
   

Open the Dashboard File ( 📄Healtcare DASHBOARD.pb.ix ) into Power BI Desktop 


Dashboard Background File ( 📄DashboardBG.webp) open it in Power BI Desktop by using canvas background column




  
   3. SQL ( Structured Query Language)

 -Performed analysis on hospital records to evaluate doctor performance, patient distribution, and top medical cases/tests.
 
 
 -Calculated billing trends, out-of-pocket expenses, revenue contribution, and patient feedback for insights into hospital operations.
 

 - SQLScript (📄HealthcareSQLscript.sql) open this Script File in any RDBMS ( like MYSQL )

     




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
                Billing Amount`, `Health Insurance Amount`,
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
      

      
     
     
    


