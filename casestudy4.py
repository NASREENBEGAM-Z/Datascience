import mysql.connector 
import pandas as pd 
import seaborn as sns 
import matplotlib.pyplot as plt 
from sklearn.linear_model import LinearRegression 
from sklearn.model_selection import train_test_split 
from sklearn.metrics import mean_absolute_error 
 
# Step 1: Fetch Data from MySQL and Store in Excel As CSV file 
def fetch_data(query, conn): 
    return pd.read_sql(query, conn) 
 
conn = mysql.connector.connect( 
    host="localhost", 
    user="root", 
    password="nasreenbegam@2004", 
    database="company_training" 
) 
 
# Step 1: Read the data from CSV files 
students = pd.read_csv('students.csv') 
companies = pd.read_csv('companies.csv') 
company_requirements = pd.read_csv('company_requirements.csv') 
 
# Step 2: Check for validity & integrity of the data 
def check_data_validity(df): 
    print(df.info()) 
    print(df.isnull().sum()) 
 
check_data_validity(students) 
check_data_validity(companies) 
check_data_validity(company_requirements) 
 
# Step 3: Apply mathematical formula 
print("Mean work experience of students:", students['work_experience'].mean()) 
print("Median work experience of students:", 
students['work_experience'].median()) 
 
# Step 4: Predict the duration of company requirements based on resource_count 
X = company_requirements[['resource_count']] 
y = company_requirements['duration'] 
 
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, 
random_state=42) 
model = LinearRegression() 
model.fit(X_train, y_train) 
predictions = model.predict(X_test) 
 
# Step 8: Print and validate data 
print("Mean Absolute Error:", mean_absolute_error(y_test, predictions)) 
 
# Visualization 
# EDA: Distribution of courses enrolled by students 
plt.figure(figsize=(10, 6)) 
sns.countplot(x='course_enrolled', data=students) 
plt.title('Distribution of Courses Enrolled by Students') 
plt.xlabel('Course Enrolled') 
plt.ylabel('Number of Students') 
plt.xticks(rotation=90) 
plt.show() 
 
# EDA: Company requirements by technology 
plt.figure(figsize=(10, 6)) 
sns.countplot(x='technology', data=company_requirements) 
plt.title('Company Requirements by Technology') 
plt.xlabel('Technology') 
plt.ylabel('Number of Requirements') 
plt.xticks(rotation=90) 
plt.show() 