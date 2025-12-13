/* ============================================================
   SQLite-Compatible queries.sql
   Project: Health & Fitness Tracking System
   Author: Thomas Chen & Sean Young
   Date: 12/12/25
   Description:
   This file contains SQLite-compatible SQL queries implementing
   the functional requirements defined in the project report.
   ============================================================ */

/* ============================================================
   FUNCTIONAL REQUIREMENT 1 – User Management
   Description:
   Store, retrieve, and update user profile information.
   ============================================================ */

-- Create a new user account
INSERT INTO Person (User_ID, Email, Credit, FName, Middle_Initial, Lname, Height, Birthday, Challenge_ID)
VALUES (1010, 'newuser@example.com', 0, 'New', 'N', 'User', 170, '2000-01-01', 10001);

-- Retrieve user profile information
SELECT User_ID, Email, Credit, FName, Middle_Initial, Lname, Height, Birthday
FROM Person
WHERE User_ID = 1010;

-- Update user profile information
UPDATE Person
SET Email = 'updateduser@example.com',
    FName = 'Updated',
    Middle_Initial = 'U',
    LName = 'User',
    Height = 172,
    Birthday = '2000-02-02'
WHERE User_ID = 1010;


/* ============================================================
   FUNCTIONAL REQUIREMENT 2 – Activity Logging
   Description:
   Update and retrieve activity sessions on specific dates.
   ============================================================ */

-- Log an activity session
INSERT INTO Activities (Activities_ID, Calories_Burned, Activities_Hours, DL_ID)
VALUES (2010, 300, 1.5, 5001);

-- Log an activity type
INSERT INTO Activities_Type (Activities_ID, ATypes)
VALUES (2010, 'Running');

-- Retrieve activity session for a specific log
SELECT Activities_ID, Calories_Burned, Activities_Hours, DL_ID
FROM Activities
WHERE DL_ID = 5001;

-- Retrieve activity type from a specific activity session
SELECT Activities_ID, ATypes
FROM Activities_Type
WHERE Activities_ID = 2010;

-- Update activity information for a specific log
UPDATE Activities
SET Calories_Burned = 350,
    Activities_Hours = 2
WHERE DL_ID = 5001;

-- Update activity type for a specific activity
UPDATE Activities_Type
SET ATypes = 'Cycling'
WHERE Activities_ID = 2010;


/* ============================================================
   FUNCTIONAL REQUIREMENT 3 – Meal Logging
   Description:
   Record and analyze nutrition and meal intake.
   ============================================================ */

-- Log a meal
INSERT INTO Meal_Log (MealLog_ID, Calories_Goal, Protein, Fat, Carbs, Calories_Amount, DL_ID)
VALUES (3010, 2000, 100, 50, 250, 1800, 5001);

-- Log a Breakfast
INSERT INTO MealLog_Breakfast (MealLog_ID, MLBreakfast)
VALUES (3010, 'Oatmeal');

-- Log a Lunch
INSERT INTO MealLog_Lunch (MealLog_ID, MLLunch)
VALUES (3010, 'Chicken Salad');

-- Log a Dinner
INSERT INTO MealLog_Dinner (MealLog_ID, MLDinner)
VALUES (3010, 'Steak');

-- Log a Snack
INSERT INTO MealLog_Snack (MealLog_ID, MLSnack)
VALUES (3010, 'Protein Bar');

-- Retrieve eated stuff at specific dates
SELECT MealLog_ID, Calories_Goal, Protein, Fat, Carbs, Calories_Amount, DL_ID
FROM Meal_Log
WHERE DL_ID = 5001;

-- Retrieve a day's breakfast
SELECT MealLog_ID, MLBreakfast
FROM MealLog_Breakfast
WHERE MealLog_ID = 3010;

-- Retrieve a day's lunch
SELECT MealLog_ID, MLLunch
FROM MealLog_Lunch
WHERE MealLog_ID = 3010;

-- Retrieve a day's dinner
SELECT MealLog_ID, MLDinner
FROM MealLog_Dinner
WHERE MealLog_ID = 3010;

-- Retrieve a day's snack
SELECT MealLog_ID, MLSnack
FROM MealLog_Snack
WHERE MealLog_ID = 3010;

-- Update meal macros and calories
UPDATE Meal_Log
SET Calories_Goal = 2100,
    Protein = 110,
    Fat = 55,
    Carbs = 260,
    Calories_Amount = 1900
WHERE DL_ID = 5001;

-- Update meal breakfast
UPDATE MealLog_Breakfast
SET MLBreakfast = 'Eggs'
WHERE MealLog_ID = 3010;

-- Update meal lunch
UPDATE MealLog_Lunch
SET MLLunch = 'Rice Bowl'
WHERE MealLog_ID = 3010;

-- Update meal dinner
UPDATE MealLog_Dinner
SET MLDinner = 'Pasta'
WHERE MealLog_ID = 3010;

-- Update meal snack
UPDATE MealLog_Snack
SET MLSnack = 'Yogurt'
WHERE MealLog_ID = 3010;


/* ============================================================
   FUNCTIONAL REQUIREMENT 4 – Goals Management
   Description:
   Log, view, and update fitness goals.
   ============================================================ */

-- log a user goal
INSERT INTO Goals (Goal_ID, Daily_goal, Monthly_goal, Yearly_goal, DL_ID)
VALUES (4010, 'Drink water', 'Lose 5 lbs', 'Run a marathon', 5001);

-- view user goals
SELECT Goal_ID, Daily_goal, Monthly_goal, Yearly_goal, DL_ID
FROM Goals
WHERE DL_ID = 5001;

-- Update goal
UPDATE Goals
SET Daily_goal = 'Walk 10k steps',
    Monthly_goal = 'Gain muscle',
    Yearly_goal = 'Finish hiking trail'
WHERE Goal_ID = 4010;


/* ============================================================
   FUNCTIONAL REQUIREMENT 5 – Social Interactions
   Description:
   Manage friends and view friends’ activity.
   ============================================================ */

-- Log friend
INSERT INTO Friend (Friend_ID, Login_Status, PU_ID)
VALUES (5010, TRUE, 1010);

-- Log friend stats
INSERT INTO Friend_Stats (Friend_ID, FStats)
VALUES (5010, 'Top 10% Weekly Steps');

-- View friends information
SELECT Friend_ID, Login_Status
FROM Friend
WHERE PU_ID = 1010;

-- View friends stats
SELECT Friend_ID, FStats
FROM Friend_Stats
WHERE Friend_ID = 5010;


/* ============================================================
   FUNCTIONAL REQUIREMENT 6 – Challenges
   Description:
   Users can join daily challenges and special challenges and gain daily rivals credit.
   ============================================================ */

-- Log a challenge
INSERT INTO Challenges (Challenge_ID, Daily_Challenge, Challenge_Complete, DailyRivals_Credit, Special_Challenge)
VALUES (6010, 'Run 5 km', FALSE, 10, 'New Year Challenge');

-- View challenge
SELECT Challenge_ID, Daily_Challenge, Challenge_Complete, DailyRivals_Credit, Special_Challenge
FROM Challenges
WHERE Challenge_ID = 6010;

-- Update challenge completion
UPDATE Challenges
SET Challenge_Complete = TRUE
WHERE Challenge_ID = 6010;

-- if challenge is completed w+e add the daily rival credit to person's current credit
UPDATE Person
SET Credit = Credit + (
    SELECT DailyRivals_Credit
    FROM Challenges
    WHERE Challenges.Challenge_ID = Person.Challenge_ID
      AND Challenge_Complete = TRUE
)
WHERE EXISTS (
    SELECT 1
    FROM Challenges
    WHERE Challenges.Challenge_ID = Person.Challenge_ID
      AND Challenge_Complete = TRUE
);


/* ============================================================
   FUNCTIONAL REQUIREMENT 7 – Device Integration
   Description:
   Users can retrieve device sync status and update device usage.
   ============================================================ */

-- Log device usage
INSERT INTO Device (Device_ID, Phone, Smart_watch, Implanted_chip, PU_ID)
VALUES (7010, TRUE, FALSE, FALSE, 1010);

-- -- retrieve device status
SELECT Device_ID, Phone, Smart_watch, Implanted_chip, PU_ID
FROM Device
WHERE PU_ID = 1010;

-- Update person's device
UPDATE Device
SET Phone = FALSE,
    Smart_watch = TRUE,
    Implanted_chip = TRUE
WHERE PU_ID = 1010;


/* ============================================================
   FUNCTIONAL REQUIREMENT 8 – Health Metric Tracking
   Description:
   Log and retrieve health metrics such as steps, weight, sleep, and blood pressure.
   ============================================================ */

-- log a person's steps
INSERT INTO Steps (Step_ID, Step_Goal, Total_Steps, Daily_Steps, DL_ID)
VALUES (8010, 8000, 7500, 7500, 5001);

-- retreive a person's steps
SELECT Step_ID, Step_Goal, Total_Steps, Daily_Steps, DL_ID
FROM Steps
WHERE DL_ID = 5001;

-- log a person's weight
INSERT INTO Weight (Weight_ID, Total_Weight, Weight_Gain, Weight_Loss, DL_ID)
VALUES (9010, 150, 0, 2, 5001);

-- retreive a person's weight
SELECT Weight_ID, Total_Weight, Weight_Gain, Weight_Loss, DL_ID
FROM Weight
WHERE DL_ID = 5001;

-- log a person's sleep 
INSERT INTO Sleep_Hours (SleepHour_ID, Sleep_Quality, Hours_Slept, Sleep_Pattern, DL_ID)
VALUES (10010, 8, 7.5, '23:00', 5001);

-- retrieve a person's sleep
SELECT SleepHour_ID, Sleep_Quality, Hours_Slept, Sleep_Pattern, DL_ID
FROM Sleep_Hours
WHERE DL_ID = 5001;

-- log a person's blood pressure
INSERT INTO Blood_Pressure (Blood_ID, Blood_Status, DL_ID)
VALUES (11010, 120, 5001);

-- retrieve a person's blood pressure
SELECT Blood_ID, Blood_Status, DL_ID
FROM Blood_Pressure
WHERE DL_ID = 5001;


/* ============================================================
   FUNCTIONAL REQUIREMENT 9 – Medication Logging
   Description:
   Users must be able to log when they should take their medications and how much.
   ============================================================ */

   --Log the medication 
INSERT INTO Medication (Medication_ID, Medication_Time, Dosage, DL_ID)
VALUES (12010, '08:00', 1, 5001);

-- retrieve medication information
SELECT Medication_ID, Medication_Time, Dosage, DL_ID
FROM Medication
WHERE DL_ID = 5001;

-- update medication information
UPDATE Medication
SET Medication_Time = '09:00',
    Dosage = 2
WHERE DL_ID = 5001;


 /* ============================================================
   FUNCTIONAL REQUIREMENT 10 – medical record Logging
   Description:
   Log, view, retrieve medical record data organized by person.
   For specific records like allegies, diseases, and disabilities
   are sorted by Medical_ID
   ============================================================ */
-- log a person's medical record
INSERT INTO Medical_Record (Medical_ID, Past_surgeries, Past_Medication, PU_ID)
VALUES (13010, 'Appendix removal', 'Ibuprofen', 1010);

-- retrieve a person's medical record
SELECT Medical_ID, Past_surgeries, Past_Medication, PU_ID
FROM Medical_Record
WHERE PU_ID = 1010;

-- update a person's medical record
UPDATE Medical_Record
SET Past_surgeries = 'Tonsil removal',
    Past_Medication = 'Tylenol'
WHERE PU_ID = 1010;

-- log a person's medical record allegies
INSERT INTO Medical_Record_Allegies (Medical_ID, MRAllegies)
VALUES (13010, 'Peanuts');

-- retrieve a person's medical record allegies
SELECT Medical_ID, MRAllegies
FROM Medical_Record_Allegies
WHERE Medical_ID = 13010;

-- update a person's medical record allegies
UPDATE Medical_Record_Allegies
SET MRAllegies = 'Dust'
WHERE Medical_ID = 13010;

-- log a person's medical record diseases
INSERT INTO Medical_Record_Diseases (Medical_ID, MRDiseases)
VALUES (13010, 'Asthma');

-- retrieve a person's medical record diseases
SELECT Medical_ID, MRDiseases
FROM Medical_Record_Diseases
WHERE Medical_ID = 13010;

-- update a person's medical record diseases
UPDATE Medical_Record_Diseases
SET MRDiseases = 'None'
WHERE Medical_ID = 13010;

-- log a person's medical record disabilities
INSERT INTO Medical_Record_Disabilities (Medical_ID, MRDisabilities)
VALUES (13010, 'None');

-- retrieve a person's medical record disabilities
SELECT Medical_ID, MRDisabilities
FROM Medical_Record_Disabilities
WHERE Medical_ID = 13010;

-- update a person's medical record disabilities
UPDATE Medical_Record_Disabilities
SET MRDisabilities = 'Mobility impairment'
WHERE Medical_ID = 13010;


/* ============================================================
   FUNCTIONAL REQUIREMENT 10 – Daily Log
   Description:
   Log and retrieve daily activity logs.
   ============================================================ */
-- log a Daily log
INSERT INTO Daily_Log (Log_ID, Log_Date, PU_ID)
VALUES (14010, '2025-01-04', 1010);


-- retrieve a Daily log
SELECT Log_ID, Log_Date, PU_ID
FROM Daily_Log
WHERE PU_ID = 1010;
