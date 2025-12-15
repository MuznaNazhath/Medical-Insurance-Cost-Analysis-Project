SELECT  *
FROM insurance_clean;


-- Avg cost by smoker
SELECT 
    smoker,
    AVG(charges) AS avg_insurance_cost
FROM insurance_clean
GROUP BY smoker;

-- Smokers typically have significantly higher average costs.

-- Avg Cost by BMI category
SELECT 
    bmi_category,
    AVG(charges) AS avg_insurance_cost
FROM insurance_clean
GROUP BY bmi_category
ORDER BY avg_insurance_cost DESC;

-- Average Insurance Cost by Age Group

SELECT 
    age_group,
    AVG(charges) AS avg_insurance_cost
FROM insurance_clean
GROUP BY age_group
ORDER BY avg_insurance_cost DESC;

-- Average Cost by Region

SELECT 
    region,
    AVG(charges) AS avg_insurance_cost
FROM insurance_clean
GROUP BY region
ORDER BY avg_insurance_cost DESC;

-- Regional impact is usually weaker than lifestyle factors.

-- High-Risk Customer Identification

SELECT 
    age,
    sex,
    bmi,
    bmi_category,
    smoker,
    region,
    charges
FROM insurance_clean
WHERE smoker = 'yes'
  AND bmi_category = 'Obese'
ORDER BY charges DESC;

-- Combined Risk Analysis (Age + Smoking)

SELECT 
    age_group,
    smoker,
    COUNT(*) AS customer_count,
    AVG(charges) AS avg_insurance_cost
FROM insurance_clean
GROUP BY age_group, smoker
ORDER BY avg_insurance_cost DESC;

-- Older smokers form the highest-risk segment.

-- BMI vs Smoking Impact

SELECT 
    bmi_category,
    smoker,
    COUNT(*) AS total_customers,
    AVG(charges) AS avg_insurance_cost
FROM insurance_clean
GROUP BY bmi_category, smoker
ORDER BY avg_insurance_cost DESC;

-- Top 10 Most Expensive Customers

SELECT TOP 10
    age,
    sex,
    smoker,
    bmi,
    bmi_category,
    region,
    charges
FROM insurance_clean
ORDER BY charges DESC;

-- Percentage of Smokers in Dataset

SELECT 
    CAST(
        100.0 * SUM(CASE WHEN smoker = 'yes' THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS smoker_percentage
FROM insurance_clean;
