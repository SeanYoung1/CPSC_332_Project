/* ============================================================
   File: queries.sql
   Project: Health & Fitness Tracking System
   Author: ______________________
   Date: ________________________

   Description:
   This file contains SQL queries that implement each
   functional requirement defined in the project report.
   Each query is labeled and commented according to the
   corresponding functional requirement.
   ============================================================ */


/* ============================================================
   FUNCTIONAL REQUIREMENT 1 – User Management
   Description:
   Store, retrieve, and update user profile information.
   ============================================================ */

-- Create a new user account
INSERT INTO Person (user_id, Email, Credit, FName, Middle_Initial, Lname, Height, Birthday)
VALUES (:user_id, :Email, 0, :FName, :Middle_Initial, :Lname, :Height, :Birthday);

-- Retrieve user profile information
SELECT user_id, Email, Credit, FName, Middle_Initial, Lname, Height, Birthday
FROM Person
WHERE user_id = :user_id;


-- Update user profile information
UPDATE Person
SET Email = :Email,
    FName = :Fname,
    Middle_Initial = :Middle_Initial,
    LName = :Lname,
    Height = :Height,
    Birthday = :Birthday
WHERE user_id = :user_id;

/* ============================================================
   FUNCTIONAL REQUIREMENT 2 – ACTIVITY Logging
   Description:
   Update and retrieve their activities on specific dates.
   ============================================================ */

-- Log a activity session
INSERT INTO Activities (Activities_ID, Calories_Burned, Activities_Hours, DL_ID)
VALUES (:Activities_ID, :Calories_Burned, :Activities_Hours, :DL_ID);

-- Log a activity type 
INSERT INTO Activities_Type (Activities_ID, ATypes)
VALUES (:Activities_ID, :ATypes);


-- Retrieve activity session for a specific log
SELECT Activities_ID, Calories_Burned, Activities_Hours, DL_ID
FROM Activities
WHERE DL_ID = :DL_ID;

-- Retrieve activity type from a specific activity session
SELECT Activities_ID, ATypes
FROM Activities_Type
WHERE Activities_ID = :Activities_ID;


-- Update activity information for a specific log
UPDATE Activities
SET Calories_Burned = :Calories_Burned,
    Activities_Hours = :Activities_Hours
WHERE DL_ID = :DL_ID;

-- Update activity type for a specific activity
UPDATE Activities_Type
SET ATypes = :ATypes
WHERE Activities_ID = :Activities_ID;

/* ============================================================
   FUNCTIONAL REQUIREMENT 3 – Meal Logging
   Description:
   Record and analyze nutrition and meal intake.
   ============================================================ */

-- Log a meal
INSERT INTO Meal_Log (MealLog_ID, Calories_Goal, Protein, Fat, Carbs, Calories_Amount, DL_ID)
VALUES (:MealLog_ID, :Calories_Goal, :Protein, :Fat, :Carbs, :Calories_Amount, :DL_ID);

-- Log a Breakfast
INSERT INTO MealLog_Breakfast (MealLog_ID, MLBreakfast)
VALUES (:MealLog_ID, :MLBreakfast);

-- Log a Lunch
INSERT INTO MealLog_Lunch (MealLog_ID, MLLunch)
VALUES (:MealLog_ID, :MLLunch);

-- Log a Dinner
INSERT INTO MealLog_Dinner (MealLog_ID, MLDinner)
VALUES (:MealLog_ID, :MLDinner);

-- Log a Snack
INSERT INTO MealLog_Snack (MealLog_ID, MLSnack)
VALUES (:MealLog_ID, :MLSnack);


-- Retrieve eated stuff at specific dates
SELECT MealLog_ID, Calories_Goal, Protein, Fat, Carbs, Calories_Amount, DL_ID
FROM Meal_Log
WHERE DL_ID = :DL_ID;

-- Retrieve a day's breakfast
SELECT MealLog_ID, MLBreakfast
FROM MealLog_Breakfast
WHERE MealLog_ID = :MealLog_ID;

-- Retrieve a day's lunch
SELECT MealLog_ID, MLLunch
FROM MealLog_Lunch
WHERE MealLog_ID = :MealLog_ID;

-- Retrieve a day's dinner
SELECT MealLog_ID, MLDinner
FROM MealLog_Dinner
WHERE MealLog_ID = :MealLog_ID;

-- Retrieve a day's snack
SELECT MealLog_ID, MLSnack
FROM MealLog_Snack
WHERE MealLog_ID = :MealLog_ID;

-- Update meal macros and calories
UPDATE Meal_Log
SET Calories_Goal = :Calories_Goal,
    Protein = :Protein,
    Fat = :Fat,
    Carbs = :Carbs,
    Calories_Amount = :Calories_Amount
WHERE DL_ID = :DL_ID;

-- Update meal breakfast
UPDATE MealLog_Breakfast
SET MLBreakfast = :MLBreakfast
WHERE MealLog_ID = :MealLog_ID;

-- Update meal lunch
UPDATE MealLog_Lunch
SET MLLunch = :MLLunch
WHERE MealLog_ID = :MealLog_ID;

-- Update meal dinner
UPDATE MealLog_Dinner
SET MLDinner = :MLDinner
WHERE MealLog_ID = :MealLog_ID;

-- Update meal snack
UPDATE MealLog_Snack
SET MLSnack = :MLSnack
WHERE MealLog_ID = :MealLog_ID;


/* ============================================================
   FUNCTIONAL REQUIREMENT 4 – Goals Management
   Description:
   Log, view, and update fitness goals.
   ============================================================ */

-- log a user goal
INSERT INTO Goals (Goal_ID, Daily_goal, Monthly_goal, Yearly_goal, DL_ID)
VALUES (:Goal_ID, :Daily_goal, :Monthly_goal, :Yearly_goal, :DL_ID);


-- view user goals
SELECT Goal_ID, Daily_goal, Monthly_goal, Yearly_goal, DL_ID
FROM Goals
WHERE DL_ID = :DL_ID;


-- Update goals
UPDATE Goals
SET Daily_goal = :Daily_goal,
    Monthly_goal = :Monthly_goal,
    Yearly_goal = :Yearly_goal
WHERE Goal_ID = :Goal_ID;


/* ============================================================
   FUNCTIONAL REQUIREMENT 5 – Social Interactions
   Description:
   Manage friends and view friends’ activity.
   ============================================================ */

-- log friend information
INSERT INTO Friend (Friend_ID, Login_Status, PU_ID)
VALUES (:Friend_ID, :Login_Status, :PU_ID);

-- log friend stats
INSERT INTO Friend_Stats (Friend_ID, FStats)
VALUES (:Friend_ID, :FStats);


-- View friends information
SELECT Friend_ID, Login_Status
FROM Friend
WHERE PU_ID = :PU_ID;

-- View friends stats
SELECT Friend_ID, FStats
FROM Friend_Stats
WHERE Friend_ID = :Friend_ID;


/* ============================================================
   FUNCTIONAL REQUIREMENT 6 – Challenges 
   Description:
   Users can join daily challenges and special challenges and gain daily Rivals Credit
   ============================================================ */

-- log challenges
INSERT INTO Challenges (Challenge_ID, Daily_Challenge, Challenge_Complete, DailyRivals_Credit, Special_Challenge)
VALUES (:Challenge_ID, :Daily_Challenge, :Challenge_Complete, :DailyRivals_Credit, :Special_Challenge);

-- View challenges
SELECT Challenge_ID, Daily_Challenge, Challenge_Complete, DailyRivals_Credit, Special_Challenge
FROM Challenges
WHERE Challenge_ID = :Challenge_ID;

--update challenges
UPDATE Challenges
SET Challenge_Complete = :Challenge_Complete
WHERE Challenge_ID = :Challenge_ID;

-- if challenge is completed w+e add the daily rival credit to person's current credit
UPDATE Person
JOIN Challenges ON Person.Challenge_ID = Challenges.Challenge_ID
SET Person.Credit = Person.Credit + Challenges.DailyRivals_Credit
WHERE Challenges.Challenge_Complete = TRUE;


/* ============================================================
   FUNCTIONAL REQUIREMENT 7 – Device Integration (Stored Data)
   Description:
   Users can retrieve which device is sync and also update to device usuage
   ============================================================ */

-- retrieve device status
SELECT Device_ID, Phone, Smart_watch, Implanted_chip, PU_ID
FROM Device
WHERE PU_ID = :PU_ID;


-- Update person's device
UPDATE Device
SET    Phone = :Phone,
       Smart_watch = :Smart_watch,
       Implanted_chip = :Implanted_chip
WHERE PU_ID = :PU_ID;

/* ============================================================
   FUNCTIONAL REQUIREMENT 8 – Health Metric Tracking
   Description:
   Log and retrieve health metrics such as weight, steps, sleep, and blood pressure.
   ============================================================ */

-- log a person's steps
INSERT INTO Steps (Step_ID, Step_Goal, Total_Steps, Daily_Steps, DL_ID)
VALUES (:Step_ID, :Step_Goal, :Total_Steps, :Daily_Steps, :DL_ID);

-- retreive a person's steps
SELECT Step_ID, Step_Goal, Total_Steps, Daily_Steps, DL_ID
FROM Steps
WHERE DL_ID = :DL_ID;


-- log a person's weight
INSERT INTO Weight (Weight_ID, Total_Weight, Weight_Gain, Weight_Loss, DL_ID)
VALUES (:Weight_ID, :Total_Weight, :Weight_Gain, :Weight_Loss, :DL_ID);

-- retreive a person's weight
SELECT Weight_ID, Total_Weight, Weight_Gain, Weight_Loss, DL_ID
FROM Weight
WHERE DL_ID = :DL_ID;


-- log a person's sleep 
INSERT INTO Sleep_Hours (SleepHour_ID, Sleep_Quality, Hours_Slept, Sleep_Pattern, DL_ID)
VALUES (:SleepHour_ID, :Sleep_Quality, :Hours_Slept, :Sleep_Pattern, :DL_ID);

-- retrieve a person's sleep
SELECT SleepHour_ID, Sleep_Quality, Hours_Slept, Sleep_Pattern, DL_ID
FROM Sleep_Hours
WHERE DL_ID = :DL_ID;


-- log a person's blood pressure
INSERT INTO Blood_Pressure (Blood_ID, Blood_Status, DL_ID)
VALUES (:Blood_ID, :Blood_Status, :DL_ID);

-- retrieve a person's blood pressure
SELECT Blood_ID, Blood_Status, DL_ID
FROM Blood_Pressure
WHERE DL_ID = :DL_ID;

/* ============================================================
   FUNCTIONAL REQUIREMENT 9 – Medication Logging
   Description:
Users must be able to log when they should take their medications and how much.
   ============================================================ */

   --Log the medication 
INSERT INTO Medication (Medication_ID, Medication_Time, Dosage, DL_ID)
VALUES (:Medication_ID, :Medication_Time, :Dosage, :DL_ID);


-- retrieve medication information
SELECT Medication_ID, Medication_Time, Dosage, DL_ID
FROM Medication
WHERE DL_ID = :DL_ID;


-- update medication information
UPDATE Medication
SET    Medication_Time = :Medication_Time,
       Dosage = :Dosage
WHERE DL_ID = :DL_ID;


 /* ============================================================
   FUNCTIONAL REQUIREMENT 10 – medical record Logging
   Description:
   Log, view, retrieve medical record data organized by person.
   For specific records like allegies, diseases, and disabilities
   are sorted by Medical_ID
   ============================================================ */
-- log a person's medical record
INSERT INTO Medical_Record (Medical_ID, Past_surgeries, Past_Medication, PU_ID)
VALUES (:Medical_ID, :Past_surgeries, :Past_Medication, :PU_ID);

-- retrieve a person's medical record
SELECT Medical_ID, Past_surgeries, Past_Medication, PU_ID
FROM   Medical_Record
WHERE  PU_ID = :PU_ID;


-- update a person's medical record
UPDATE Medical_Record
SET    Past_surgeries = :Past_surgeries,
       Past_Medication = :Past_Medication
WHERE  PU_ID = :PU_ID;


-- log a person's medical record allegies
INSERT INTO Medical_Record_Allegies (Medical_ID, MRAllegies)
VALUES (:Medical_ID, :MRAllegies);

-- retrieve a person's medical record allegies
SELECT Medical_ID, MRAllegies
FROM   Medical_Record_Allegies
WHERE  Medical_ID = :Medical_ID;

-- update a person's medical record allegies
UPDATE Medical_Record_Allegies
SET    MRAllegies = :MRAllegies
WHERE  Medical_ID = :Medical_ID;


-- log a person's medical record diseases
INSERT INTO Medical_Record_Diseases (Medical_ID, MRDiseases)
VALUES (:Medical_ID, :MRDiseases);

-- retrieve a person's medical record diseases
SELECT Medical_ID, MRDiseases
FROM Medical_Record_Diseases
WHERE Medical_ID = :Medical_ID;

-- update a person's medical record diseases
UPDATE Medical_Record_Diseases
SET    MRDiseases = :MRDiseases
WHERE  Medical_ID = :Medical_ID;


-- log a person's medical record disabilities
INSERT INTO Medical_Record_Disabilities (Medical_ID, MRDisabilities)
VALUES (:Medical_ID, :MRDisabilities);

-- retrieve a person's medical record disabilities
SELECT Medical_ID, MRDisabilities
FROM Medical_Record_Disabilities
WHERE Medical_ID = :Medical_ID;

-- update a person's medical record disabilities
UPDATE Medical_Record_Disabilities
SET    MRDisabilities = :MRDisabilities
WHERE  Medical_ID = :Medical_ID;


 /* ============================================================
   FUNCTIONAL REQUIREMENT10 – Daily log
   Description:
   View daly log.
   ============================================================ */

-- log a Daily log
INSERT INTO Daily_Log (Log_ID, Log_Date, PU_ID)
VALUES (:Log_ID, :Log_Date, :PU_ID);

-- retrieve a Daily log
SELECT Log_ID, Log_Date, PU_ID
FROM Daily_Log
WHERE PU_ID = :PU_ID;
