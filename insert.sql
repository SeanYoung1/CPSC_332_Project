/* ============================================================
   INSERT TEST DATA FOR FITNESS APP DATABASE
   ============================================================ */

/* ---------- CHALLENGES ---------- */
INSERT INTO Challenges (Challenge_ID, Daily_Challenge, Challenge_Complete, DailyRivals_Credit, Special_Challenge)
VALUES
    (10001, 'Do 20 push-ups', FALSE, 10, 'New Year Challenge'),
    (10002, 'Walk 5,000 steps', TRUE, 8, 'Weekend Boost'),
    (10003, 'Eat a healthy breakfast', FALSE, 5, 'Wellness Week');

/* ---------- PERSON ---------- */
INSERT INTO Person (User_ID, Email, Credit, Fname, Middle_Initial, Lname, Height, Birthday, Challenge_ID)
VALUES
    (1001, 'sean@example.com', 50, 'Sean', 'A', 'Chen', 175.0, '2005-01-01', 10001),
    (1002, 'amy@example.com', 30, 'Amy', NULL, 'Lee', 165.0, '2004-03-14', 10002),
    (1003, 'john@example.com', 80, 'John', 'B', 'Park', 180.0, '2003-07-22', 10003);

/* ---------- FRIEND ---------- */
INSERT INTO Friend (Friend_ID, Login_Status, PU_ID)
VALUES
    (2001, TRUE, 1001),
    (2002, FALSE, 1002),
    (2003, TRUE, 1003);

/* ---------- FRIEND STATS ---------- */
INSERT INTO Friend_Stats (Friend_ID, FStats)
VALUES
    (2001, 'Top 10% Weekly Steps'),
    (2001, 'Completed 5 Challenges'),
    (2002, 'Achieved Daily Goal Twice'),
    (2003, 'New User');

/* ---------- DEVICE ---------- */
INSERT INTO Device (Device_ID, Phone, Smart_watch, Implanted_chip, PU_ID)
VALUES
    (3001, TRUE, FALSE, FALSE, 1001),
    (3002, TRUE, TRUE, FALSE, 1002),
    (3003, FALSE, TRUE, TRUE, 1003);

/* ---------- MEDICAL RECORD ---------- */
INSERT INTO Medical_Record (Medical_ID, Past_surgeries, Past_Medication, PU_ID)
VALUES
    (4001, 'Appendix removal', 'Ibuprofen', 1001),
    (4002, NULL, 'Tylenol', 1002),
    (4003, 'Knee surgery', NULL, 1003);

/* ---------- MEDICAL ALLERGIES ---------- */
INSERT INTO Medical_Record_Allegies (Medical_ID, MRAllegies)
VALUES
    (4001, 'Peanuts'),
    (4002, 'Dust'),
    (4003, 'None');

/* ---------- MEDICAL DISEASES ---------- */
INSERT INTO Medical_Record_Diseases (Medical_ID, MRDiseases)
VALUES
    (4001, 'Asthma'),
    (4002, 'None'),
    (4003, 'High Blood Pressure');

/* ---------- MEDICAL DISABILITIES ---------- */
INSERT INTO Medical_Record_Disabilities (Medical_ID, MRDisabilities)
VALUES
    (4001, 'None'),
    (4002, 'None'),
    (4003, 'Mobility impairment');

/* ---------- DAILY LOG ---------- */
INSERT INTO Daily_Log (Log_ID, Log_Date, PU_ID)
VALUES
    (5001, '2025-01-01', 1001),
    (5002, '2025-01-02', 1002),
    (5003, '2025-01-03', 1003);

/* ---------- BLOOD PRESSURE ---------- */
INSERT INTO Blood_Pressure (Blood_ID, Blood_Status, DL_ID)
VALUES
    (6001, 120, 5001),
    (6002, 130, 5002),
    (6003, 110, 5003);

/* ---------- SLEEP HOURS ---------- */
INSERT INTO Sleep_Hours (SleepHour_ID, Sleep_Quality, Hours_Slept, Sleep_Pattern, DL_ID)
VALUES
    (7001, 8, 7.5, '23:00', 5001),
    (7002, 6, 5.0, '01:00', 5002),
    (7003, 9, 8.0, '22:30', 5003);

/* ---------- WEIGHT ---------- */
INSERT INTO Weight (Weight_ID, Total_Weight, Weight_Gain, Weight_Loss, DL_ID)
VALUES
    (8001, 150, 0, 2, 5001),
    (8002, 130, 1, 0, 5002),
    (8003, 180, 2, 1, 5003);

/* ---------- GOALS ---------- */
INSERT INTO Goals (Goal_ID, Daily_goal, Monthly_goal, Yearly_goal, DL_ID)
VALUES
    (9001, 'Drink 8 cups water', 'Lose 5 lbs', 'Run a marathon', 5001),
    (9002, 'Walk 10k steps', 'Gain muscle', 'Finish hiking trail', 5002),
    (9003, 'Eat healthy', 'Reduce sugar', 'Improve stamina', 5003);

/* ---------- DISPLAY CHALLENGES ---------- */
INSERT INTO Challenges_Display (Display_ID, Challenge_ID, DL_ID)
VALUES
    (1, 10001, 5001), 
    (2, 10002, 5002),  
    (3, 10003, 5003);

/* ---------- MEDICATION ---------- */
INSERT INTO Medication (Medication_ID, Medication_Time, Dosage, DL_ID)
VALUES
    (11001, '08:00', 1, 5001),
    (11002, '09:30', 2, 5002),
    (11003, '07:45', 1, 5003);

/* ---------- STEPS ---------- */
INSERT INTO Steps (Step_ID, Step_Goal, Total_Steps, Daily_Steps, DL_ID)
VALUES
    (12001, 8000, 7500, 7500, 5001),
    (12002, 10000, 5000, 5000, 5002),
    (12003, 6000, 6000, 6000, 5003);

/* ---------- ACTIVITIES ---------- */
INSERT INTO Activities (Activities_ID, Calories_Burned, Activities_Hours, DL_ID)
VALUES
    (13001, 300, 1.0, 5001),
    (13002, 450, 1.5, 5002),
    (13003, 200, 0.5, 5003);

/* ---------- ACTIVITIES TYPE ---------- */
INSERT INTO Activities_Type (Activities_ID, ATypes)
VALUES
    (13001, 'Running'),
    (13002, 'Cycling'),
    (13003, 'Yoga');

/* ---------- MEAL LOG ---------- */
INSERT INTO Meal_Log (MealLog_ID, Calories_Goal, Protein, Fat, Carbs, Calories_Amount, DL_ID)
VALUES
    (14001, 2000, 100, 50, 250, 1800, 5001),
    (14002, 1800, 80, 60, 200, 1500, 5002),
    (14003, 2200, 120, 40, 300, 2000, 5003);

/* ---------- MEAL SUBTABLES ---------- */
INSERT INTO MealLog_Breakfast (MealLog_ID, MLBreakfast)
VALUES
    (14001, 'Oatmeal'),
    (14002, 'Eggs'),
    (14003, 'Fruit Bowl');

INSERT INTO MealLog_Lunch (MealLog_ID, MLLunch)
VALUES
    (14001, 'Chicken Salad'),
    (14002, 'Rice Bowl'),
    (14003, 'Sandwich');

INSERT INTO MealLog_Dinner (MealLog_ID, MLDinner)
VALUES
    (14001, 'Steak'),
    (14002, 'Pasta'),
    (14003, 'Soup');

INSERT INTO MealLog_Snack (MealLog_ID, MLSnack)
VALUES
    (14001, 'Protein Bar'),
    (14002, 'Yogurt'),
    (14003, 'Nuts');
