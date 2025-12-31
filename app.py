import random # for generating random IDS

# create user
# classes for each entity
class Challenges:
    def __init__(self, Challenge_ID, Daily_Challenge, Challenge_Complete, DailyRivals_Credit, Special_Challenge):
        self.Challenge_ID = Challenge_ID
        self.Daily_Challenge = Daily_Challenge
        self.Challenge_Complete = Challenge_Complete
        self.DailyRivals_Credit = DailyRivals_Credit
        self.Special_Challenge = Special_Challenge

class Person:
    def __init__(self, User_ID, Email, Credit, Fname, Middle_Initial, Lname, Height, Birthday, Challenge_ID):
        self.User_ID = User_ID
        self.Email = Email
        self.Credit = Credit
        self.Fname = Fname
        self.Middle_Initial = Middle_Initial
        self.Lname = Lname
        self.Height = Height
        self.Birthday = Birthday
        self.Challenge_ID = Challenge_ID
        
class Friend:
    def __init__(self, Friend_ID, Login_Status, PU_ID):
        self.Friend_ID = Friend_ID
        self.Login_Status = Login_Status
        self.PU_ID = PU_ID

class Friend_Stats:
    def __init__(self, Friend_ID, FStats):
        self.Friend_ID = Friend_ID
        self.FStats = FStats

class Device:
    def __init__(self, Device_ID, Phone, Smart_watch, Implanted_chip):
        self.Device_ID = Device_ID
        self.Phone = Phone
        self.Smart_watch = Smart_watch
        self.Implanted_chip = Implanted_chip
        
class Medical_Record:
    def __init__(self, Medical_ID, Past_surgeries, Past_Medication, PU_ID):
        self.Medical_ID = Medical_ID
        self.Past_surgeries = Past_surgeries
        self.Past_Medication = Past_Medication
        self.PU_ID = PU_ID

class Medical_Record_Allegies:
    def __init__(self, Medical_ID, MRAllegies):
        self.Medical_ID = Medical_ID
        self.MRAllegies = MRAllegies

class Medical_Record_Diseases:
    def __init__(self, Medical_ID, MRDiseases):
        self.Medical_ID = Medical_ID
        self.MRDiseases = MRDiseases

class Medical_Record_Disabilities:
    def __init__(self, Medical_ID, MRDisabilities):
        self.Medical_ID = Medical_ID
        self.MRDisabilities = MRDisabilities
        
class Daily_Log:
    def __init__(self, Log_ID, Log_Date, PU_ID):
        self.Log_ID = Log_ID
        self.Log_Date = Log_Date
        self.PU_ID = PU_ID
        
class Blood_Pressure:
    def __init__(self, Blood_ID, Blood_Status, DL_ID):
        self.Blood_ID = Blood_ID
        self.Blood_Status = Blood_Status
        self.DL_ID = DL_ID    

class Sleep_Hours:
    def __init__(self, SleepHour_ID, Sleep_Quality, Hours_Slept, DL_ID):
        self.SleepHour_ID = SleepHour_ID
        self.Sleep_Quality = Sleep_Quality
        self.Hours_Slept = Hours_Slept
        self.DL_ID = DL_ID

class Weight:
    def __init__(self, Weight_ID, Total_Weight, Weight_Gain, Weight_Loss, DL_ID):
        self.Weight_ID = Weight_ID
        self.Total_Weight = Total_Weight
        self.Weight_Gain = Weight_Gain
        self.Weight_Loss = Weight_Loss
        self.DL_ID = DL_ID

class Goals:
    def __init__(self, Goal_ID, Daily_goal, Monthly_goal, Yearly_goal, DL_ID):
        self.Goal_ID = Goal_ID
        self.Daily_goal = Daily_goal
        self.Monthly_goal = Monthly_goal
        self.Yearly_goal = Yearly_goal
        self.DL_ID = DL_ID

class Challenges_Display:
    def __init__(self, Display_ID, Challenge_ID, DL_ID):
        self.Display_ID = Display_ID
        self.Challenge_ID = Challenge_ID
        self.DL_ID = DL_ID
        
class Medication:
    def __init__(self, Medical_ID, Medication_Time, Dosage, DL_ID):
        self.Medical_ID = Medical_ID
        self.Medication_Time = Medication_Time
        self.Dosage = Dosage
        self.DL_ID = DL_ID
        
class Steps:
    def __init__(self, Step_ID, Step_Goal, Total_Steps, Daily_Steps, DL_ID):
        self.Step_ID = Step_ID
        self.Step_Goal = Step_Goal
        self.Total_Steps = Total_Steps
        self.Daily_Steps = Daily_Steps
        self.DL_ID = DL_ID
        
class Activities:
    def __init__(self, Activities_ID, Calories_Burned, Activities_Hours, DL_ID):
        self.Activities_ID = Activities_ID
        self.Calories_Burned = Calories_Burned
        self.Activities_Hours = Activities_Hours
        self.DL_ID = DL_ID

class Activities_Type:
    def __init__(self, Activities_ID, ATypes):
        self.Activities_ID = Activities_ID
        self.ATypes = ATypes
        
class Meal_Log:
    def __init__(self, MealLog_ID, Calories_Goal, Protein, Fat, Carbs, Calories_Amount, DL_ID):
        self.MealLog_ID = MealLog_ID
        self.Calories_Goal = Calories_Goal
        self.Protein = Protein
        self.Fat = Fat
        self.Carbs = Carbs
        self.Calories_Amount = Calories_Amount
        self.DL_ID = DL_ID

class MealLog_Breakfast:
    def __init__(self, MealLog_ID, MLBreakfast):
        self.MealLog_ID = MealLog_ID
        self.MLBreakfast = MLBreakfast

class MealLog_Lunch:
    def __init__(self, MealLog_ID, MLLunch):
        self.MealLog_ID = MealLog_ID
        self.MLLunch = MLLunch

class MealLog_Dinner:
    def __init__(self, MealLog_ID, MLDinner):
        self.MealLog_ID = MealLog_ID
        self.MLBreakfast = MLDinner
        
class MealLog_Snack:
    def __init__(self, MealLog_ID, MLSnack):
        self.MealLog_ID = MealLog_ID
        self.MLSnack = MLSnack
        
# log activity

# view challenges

# update goals


# query daily logs
def Random_User_ID():
    user_id = random.randint(1, 1_000_000)

    while user_id in Person.User_ID:
        user_id = random.randint(1, 1_000_000)
    
    print(user_id)
    return user_id

def main():
    # maybe make a account creation function first
    print("Welcome to the Health Tracking App, Health Rivals!")
    account_created = input("Do you have an account? (yes/no): ")
    if account_created.lower() == 'no':
        print("Let's create your account!")
        account = Person(
            User_ID = Random_User_ID(), # randomly generated ID
            Email = input("Enter your email: "),
            Credit = 0,
            Fname = input("Enter your first name: "),
            Middle_Initial = input("Enter your middle initial (If none, leave blank): "),
            Lname = input("Enter your last name: "),
            Height = input("Enter your height in inches (optional): "),
            Birthday = input("Enter your birthday: "),    
            Challenge_ID = () # randomly generated ID,                            
        )
    
        print("Account created successfully!")
    else:
        print("Welcome back! Please provide your user ID to log in.")
        while True:
            User_ID = input("User ID: ")
            if Person.User_ID:
                if User_ID in Person.User_ID:
                    print("Login successful!")
                    break
                    #else:
                    # print("User ID not found. Please try again.")
                else:
                    print("User ID not found. Please try again.")
            else:
                print("No users found.")
                break
    
    print(Person.User_ID)


    
    
        
    
if __name__ == "__main__":
    main()
