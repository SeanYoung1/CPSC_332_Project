CREATE TABLE Challenges (
    Challenge_ID        DECIMAL(20,0)   NOT NULL,
    Daily_Challenge     VARCHAR(500)    NOT NULL,
    Challenge_Complete  BOOLEAN         DEFAULT FALSE,
    DailyRivals_Credit  INT             NOT NULL,
    Special_Challenge   VARCHAR(500)    NOT NULL,
    PRIMARY KEY (Challenge_ID)
);

CREATE TABLE Person (
    User_ID             DECIMAL(20,0)   NOT NULL,
    Email               VARCHAR(50)     NOT NULL,
    Credit              INT             NOT NULL,
    Fname               VARCHAR(20)     NOT NULL,
    Middle_Initial      VARCHAR(5),
    Lname               VARCHAR(20)     NOT NULL,
    Height              FLOAT,
    Birthday            DATE            NOT NULL,
    Challenge_ID        DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (User_ID), 
    FOREIGN KEY (Challenge_ID) REFERENCES Challenges(Challenge_ID),
    UNIQUE (Email),
    CHECK (Height >= 0),
    CHECK (Credit >= 0)
);

CREATE TABLE Friend (
    Friend_ID           DECIMAL(20,0)   NOT NULL,
    Login_Status        BOOLEAN         DEFAULT FALSE,
    PU_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Friend_ID),
    FOREIGN KEY (PU_ID) REFERENCES Person(User_ID)
);

CREATE TABLE Friend_Stats (
    Friend_ID           DECIMAL(20,0)   NOT NULL,
    FStats              VARCHAR(150)    NOT NULL,
    PRIMARY KEY (Friend_ID, FStats),
    FOREIGN KEY (Friend_ID) REFERENCES Friend(Friend_ID)       
);

CREATE TABLE Device (
    Device_ID           DECIMAL(20,0)   NOT NULL,
    Phone               BOOLEAN         DEFAULT FALSE,
    Smart_watch         BOOLEAN         DEFAULT FALSE,
    Implanted_chip      BOOLEAN         DEFAULT FALSE,
    PU_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Device_ID),
    FOREIGN KEY (PU_ID) REFERENCES Person(User_ID)         
);

CREATE TABLE Medical_Record (
    Medical_ID          DECIMAL(20,0)   NOT NULL,
    Past_surgeries      VARCHAR(200),
    Past_Medication     VARCHAR(500),
    PU_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Medical_ID),
    FOREIGN KEY (PU_ID) REFERENCES Person(User_ID)         
);

CREATE TABLE Medical_Record_Allegies (
    Medical_ID          DECIMAL(20,0)   NOT NULL,
    MRAllegies          VARCHAR(500)    NOT NULL,
    PRIMARY KEY (Medical_ID, MRAllegies),
    FOREIGN KEY (Medical_ID) REFERENCES Medical_Record(Medical_ID)
);

CREATE TABLE Medical_Record_Diseases (
    Medical_ID          DECIMAL(20,0)   NOT NULL,
    MRDiseases          VARCHAR(500)    NOT NULL,
    PRIMARY KEY (Medical_ID, MRDiseases),
    FOREIGN KEY (Medical_ID) REFERENCES Medical_Record(Medical_ID)
);

CREATE TABLE Medical_Record_Disabilities (
    Medical_ID          DECIMAL(20,0)   NOT NULL,
    MRDisabilities      VARCHAR(500)    NOT NULL,
    PRIMARY KEY (Medical_ID, MRDisabilities),
    FOREIGN KEY (Medical_ID) REFERENCES Medical_Record(Medical_ID)
);

CREATE TABLE Daily_Log (
    Log_ID              DECIMAL(20,0)   NOT NULL,
    Log_Date            DATE            NOT NULL,
    PU_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Log_ID),
    UNIQUE (Log_Date, PU_ID),
    FOREIGN KEY (PU_ID) REFERENCES Person(User_ID)
);

CREATE TABLE Blood_Pressure (
    Blood_ID            DECIMAL(20,0)   NOT NULL,
    Blood_Status        INT,
    DL_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Blood_ID),
    FOREIGN KEY (DL_ID) REFERENCES Daily_Log(Log_ID),
    CHECK (Blood_Status >= 0)
);

CREATE TABLE Sleep_Hours (
    SleepHour_ID        DECIMAL(20,0)   NOT NULL,
    Sleep_Quality       INT,
    Hours_Slept         FLOAT,
    Sleep_Pattern       TIME,
    DL_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (SleepHour_ID),
    FOREIGN KEY (DL_ID) REFERENCES Daily_Log(Log_ID),
    CHECK (Sleep_Quality >= 0),
    CHECK (Hours_Slept >= 0.0)              
);

CREATE TABLE Weight (
    Weight_ID           DECIMAL(20,0)   NOT NULL,
    Total_Weight        INT,
    Weight_Gain         INT,
    Weight_Loss         INT,
    DL_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Weight_ID),
    FOREIGN KEY (DL_ID) REFERENCES Daily_Log(Log_ID),
    CHECK (Total_Weight >= 0)
);

CREATE TABLE Goals (
    Goal_ID             DECIMAL(20,0)   NOT NULL,
    Daily_goal          VARCHAR(500),
    Monthly_goal        VARCHAR(500),
    Yearly_goal         VARCHAR(500),
    DL_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Goal_ID),
    FOREIGN KEY (DL_ID) REFERENCES Daily_Log(Log_ID)
);

CREATE TABLE Challenges_Display (
    Display_ID          DECIMAL(20,0)   NOT NULL,
    Challenge_ID        DECIMAL(20,0)   NOT NULL,
    DL_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Display_ID),
    FOREIGN KEY (DL_ID) REFERENCES Daily_Log(Log_ID),
    FOREIGN KEY (Challenge_ID) REFERENCES Challenges(Challenge_ID)
);

CREATE TABLE Medication (
    Medication_ID       DECIMAL(20,0)   NOT NULL,
    Medication_Time     TIME,
    Dosage              INT,
    DL_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Medication_ID),
    FOREIGN KEY (DL_ID) REFERENCES Daily_Log(Log_ID),
    CHECK (Dosage >= 0)
);

CREATE TABLE Steps (
    Step_ID             DECIMAL(20,0)   NOT NULL,
    Step_Goal           INT,
    Total_Steps         INT,
    Daily_Steps         INT,
    DL_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Step_ID),
    FOREIGN KEY (DL_ID) REFERENCES Daily_Log(Log_ID),
    CHECK (Step_Goal >= 0),
    CHECK (Daily_Steps >= 0),
    CHECK (Total_Steps >= Daily_Steps)
);

CREATE TABLE Activities (
    Activities_ID       DECIMAL(20,0)   NOT NULL,
    Calories_Burned     INT,
    Activities_Hours     FLOAT,
    DL_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (Activities_ID),
    FOREIGN KEY (DL_ID) REFERENCES Daily_Log(Log_ID),
    CHECK (Calories_Burned >= 0),
    CHECK (Activities_Hours >= 0)          
);

CREATE TABLE Activities_Type (
    Activities_ID       DECIMAL(20,0)   NOT NULL,
    ATypes              VARCHAR(500)    NOT NULL,
    PRIMARY KEY (Activities_ID, ATypes),
    FOREIGN KEY (Activities_ID) REFERENCES Activities(Activities_ID)
);

CREATE TABLE Meal_Log (
    MealLog_ID          DECIMAL(20,0)   NOT NULL,
    Calories_Goal       INT,
    Protein             INT,
    Fat                 INT,
    Carbs               INT,
    Calories_Amount     INT,
    DL_ID               DECIMAL(20,0)   NOT NULL,
    PRIMARY KEY (MealLog_ID),
    FOREIGN KEY (DL_ID) REFERENCES Daily_Log(Log_ID),
    CHECK (Calories_Goal >= 0),
    CHECK (Protein >= 0),
    CHECK (Fat >= 0),
    CHECK (Carbs >= 0),
    CHECK (Calories_Amount >= 0)
);

CREATE TABLE MealLog_Breakfast (
    MealLog_ID          DECIMAL(20,0)   NOT NULL,
    MLBreakfast         VARCHAR(500)     NOT NULL,
    PRIMARY KEY (MealLog_ID, MLBreakfast),
    FOREIGN KEY (MealLog_ID) REFERENCES Meal_Log(MealLog_ID)
);

CREATE TABLE MealLog_Lunch (
    MealLog_ID          DECIMAL(20,0)   NOT NULL,
    MLLunch             VARCHAR(500)     NOT NULL,
    PRIMARY KEY (MealLog_ID, MLLunch),
    FOREIGN KEY (MealLog_ID) REFERENCES Meal_Log(MealLog_ID)
);

CREATE TABLE MealLog_Dinner (
    MealLog_ID          DECIMAL(20,0)   NOT NULL,
    MLDinner            VARCHAR(500)     NOT NULL,
    PRIMARY KEY (MealLog_ID, MLDinner),
    FOREIGN KEY (MealLog_ID) REFERENCES Meal_Log(MealLog_ID)
);

CREATE TABLE MealLog_Snack (
    MealLog_ID          DECIMAL(20,0)   NOT NULL,
    MLSnack             VARCHAR(500)     NOT NULL,
    PRIMARY KEY (MealLog_ID, MLSnack),
    FOREIGN KEY (MealLog_ID) REFERENCES Meal_Log(MealLog_ID)
);
