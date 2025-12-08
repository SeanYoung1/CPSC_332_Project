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

-- FR1-A: Create a new user account
INSERT INTO Users (user_id, username, email, created_at)
VALUES (:user_id, :username, :email, CURRENT_DATE);

-- FR1-B: Retrieve user profile information
SELECT user_id, username, email, height, weight
FROM Users
WHERE user_id = :user_id;

-- FR1-C: Update user profile information
UPDATE Users
SET height = :height,
    weight = :weight
WHERE user_id = :user_id;


/* ============================================================
   FUNCTIONAL REQUIREMENT 2 – Workout Logging
   Description:
   Log and retrieve workout session data.
   ============================================================ */

-- FR2-A: Log a workout session
INSERT INTO Workout (
    workout_id, user_id, activity_type,
    session_time, calories_burned, workout_date
)
VALUES (
    :workout_id, :user_id, :activity_type,
    :session_time, :calories_burned, :workout_date
);

-- FR2-B: Retrieve workouts for a specific user
SELECT activity_type, session_time, calories_burned, workout_date
FROM Workout
WHERE user_id = :user_id;


/* ============================================================
   FUNCTIONAL REQUIREMENT 3 – Nutrition Logging
   Description:
   Record and analyze nutrition and meal intake.
   ============================================================ */

-- FR3-A: Log a meal
INSERT INTO NutritionLog (
    nutrition_id, user_id, calories,
    protein, carbs, fats, meal_date
)
VALUES (
    :nutrition_id, :user_id, :calories,
    :protein, :carbs, :fats, :meal_date
);

-- FR3-B: Retrieve daily calorie intake
SELECT meal_date,
       SUM(calories) AS total_calories
FROM NutritionLog
WHERE user_id = :user_id
GROUP BY meal_date;


/* ============================================================
   FUNCTIONAL REQUIREMENT 4 – Goals Management
   Description:
   Set, update, and track fitness goals.
   ============================================================ */

-- FR4-A: Set a user goal
INSERT INTO Goals (goal_id, user_id, goal_type, target_value)
VALUES (:goal_id, :user_id, :goal_type, :target_value);

-- FR4-B: Update goal progress
UPDATE Goals
SET current_value = :current_value
WHERE goal_id = :goal_id;

-- FR4-C: View goal progress
SELECT goal_type, current_value, target_value
FROM Goals
WHERE user_id = :user_id;


/* ============================================================
   FUNCTIONAL REQUIREMENT 5 – Social Interactions
   Description:
   Manage friends and view friends’ activity.
   ============================================================ */

-- FR5-A: Add a friend request
INSERT INTO Friends (user_id, friend_id, status)
VALUES (:user_id, :friend_id, 'Pending');

-- FR5-B: Accept a friend request
UPDATE Friends
SET status = 'Accepted'
WHERE user_id = :user_id
  AND friend_id = :friend_id;

-- FR5-C: View friends' workouts
SELECT w.user_id, w.activity_type, w.workout_date
FROM Friends f
JOIN Workout w ON f.friend_id = w.user_id
WHERE f.user_id = :user_id
  AND f.status = 'Accepted';


/* ============================================================
   FUNCTIONAL REQUIREMENT 6 – Challenges
   Description:
   Join challenges, track points, and view leaderboards.
   ============================================================ */

-- FR6-A: Join a challenge
INSERT INTO ChallengeParticipants (challenge_id, user_id, points)
VALUES (:challenge_id, :user_id, 0);

-- FR6-B: View challenge leaderboard
SELECT user_id, points
FROM ChallengeParticipants
WHERE challenge_id = :challenge_id
ORDER BY points DESC;


/* ============================================================
   FUNCTIONAL REQUIREMENT 7 – Device Integration (Stored Data)
   Description:
   Store and retrieve health data imported from wearable devices.
   ============================================================ */

-- FR7: Retrieve device-imported health data
SELECT metric_type, metric_value, recorded_date
FROM HealthMetrics
WHERE user_id = :user_id
  AND source = 'Device';


/* ============================================================
   FUNCTIONAL REQUIREMENT 8 – Health Metric Tracking
   Description:
   Log and retrieve health metrics such as steps, heart rate,
   sleep, and blood pressure.
   ============================================================ */

-- FR8-A: Log health metrics
INSERT INTO HealthMetrics (
    metric_id, user_id, metric_type,
    metric_value, recorded_date
)
VALUES (
    :metric_id, :user_id, :metric_type,
    :metric_value, :recorded_date
);

-- FR8-B: Retrieve health metrics by date
SELECT metric_type, metric_value
FROM HealthMetrics
WHERE user_id = :user_id
  AND recorded_date = :recorded_date;


/* ============================================================
   FUNCTIONAL REQUIREMENT 9 – Health History Logging
   Description:
   View historical health data organized by date.
   ============================================================ */

-- FR9: Retrieve health history ordered by date
SELECT recorded_date, metric_type, metric_value
FROM HealthMetrics
WHERE user_id = :user_id
ORDER BY recorded_date;


/* ============================================================
   END OF FILE
   ============================================================ */


