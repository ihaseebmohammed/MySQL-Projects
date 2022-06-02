/*Mini Capstone Project
 
A fictional telco company that provided home phone and Internet services to 7043 customers in California in Quarter 3 of the fiscal year.

Data Description

10 observations with 33 variables

CustomerID: A unique ID that identifies each customer.
Count: A value used in reporting/dashboarding to sum up the number of customers in a filtered set.
Country: The country of the customer’s primary residence.
State: The state of the customer’s primary residence.
City: The city of the customer’s primary residence.
Zip Code: The zip code of the customer’s primary residence.
Lat Long: The combined latitude and longitude of the customer’s primary residence.
Latitude: The latitude of the customer’s primary residence.
Longitude: The longitude of the customer’s primary residence.
Gender: The customer’s gender: Male, Female
Senior Citizen: Indicates if the customer is 65 or older: Yes, No
Partner: Indicate if the customer has a partner: Yes, No
Dependents: Indicates if the customer lives with any dependents: Yes, No. Dependents could be children, parents, grandparents, etc.
Tenure Months: Indicates the total amount of months that the customer has been with the company by the end of the quarter specified above.
Phone Service: Indicates if the customer subscribes to home phone service with the company: Yes, No
Multiple Lines: Indicates if the customer subscribes to multiple telephone lines with the company: Yes, No
Internet Service: Indicates if the customer subscribes to Internet service with the company: No, DSL, Fiber Optic, Cable.
Online Security: Indicates if the customer subscribes to an additional online security service provided by the company: Yes, No
Online Backup: Indicates if the customer subscribes to an additional online backup service provided by the company: Yes, No
Device Protection: Indicates if the customer subscribes to an additional device protection plan for their Internet equipment provided by the company: Yes, No
Tech Support: Indicates if the customer subscribes to an additional technical support plan from the company with reduced wait times: Yes, No
Streaming TV: Indicates if the customer uses their Internet service to stream television programming from a third party provider: Yes, No. The company does not charge an additional fee for this service.
Streaming Movies: Indicates if the customer uses their Internet service to stream movies from a third party provider: Yes, No. The company does not charge an additional fee for this service.
Contract: Indicates the customer’s current contract type: Month-to-Month, One Year, Two Year.
Paperless Billing: Indicates if the customer has chosen paperless billing: Yes, No
Payment Method: Indicates how the customer pays their bill: Bank Withdrawal, Credit Card, Mailed Check
Monthly Charge: Indicates the customer’s current total monthly charge for all their services from the company.
Total Charges: Indicates the customer’s total charges, calculated to the end of the quarter specified above.
Churn Label: Yes = the customer left the company this quarter. No = the customer remained with the company. Directly related to Churn Value.
Churn Value: 1 = the customer left the company this quarter. 0 = the customer remained with the company. Directly related to Churn Label.
Churn Score: A value from 0-100 that is calculated using the predictive tool IBM SPSS Modeler. The model incorporates multiple factors known to cause churn. The higher the score, the more likely the customer will churn.
CLTV: Customer Lifetime Value. A predicted CLTV is calculated using corporate formulas and existing data. The higher the value, the more valuable the customer. High value customers should be monitored for churn.
Churn Reason: A customer’s specific reason for leaving the company. Directly related to Churn Category.
*/

#TELECOM CUSTOMER CHURN DATABASE CREATION

CREATE SCHEMA IF NOT EXISTS `telecom_customer_churn` DEFAULT CHARACTER SET utf8 ; #Creating database 'telecom_customer_churn'
USE `telecom_customer_churn` ; #To add columns and values

#Creating the table 'Customer address' with required data types

CREATE TABLE IF NOT EXISTS `telecom_customer_churn`.`Customer_address` (
  `Country` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Zip_code` INT NOT NULL,
  `Lat_Long` VARCHAR(45) NOT NULL,
  `Latitude` FLOAT NOT NULL,
  `Longitude` FLOAT NOT NULL,
  `CustomerID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE)
ENGINE = InnoDB;

#FOREIGN KEY (`CustomerID`)

INSERT INTO customer_address #Inserting values in the table
(Country,State,City,Zip_code,Lat_Long,Latitude,Longitude,CustomerID) #Columns in the table
values
('United_States','California','Los Angeles','90003','33.964131,-118.272783','33.964131','-118.272783','3668-QPYBK'),
('United_States','California','Los Angeles','90005','34.059281,-118.30742','34.059281','-118.307420','9237-HQITU'),
('United_States','California','Los Angeles','90006','34.048013,-118.293953','34.048013','-118.293953', '9305-CDSKC'),
('United_States','California','Los Angeles','90010','34.062125,-118.315709','34.062125','-118.315709','7892-POOKP'),
('United_States','California','Los Angeles','90015','34.039224,-118.266293','34.039224','-118.266293','0280-XJGEX'),
('United States','California','Los Angeles','90020','34.066367,-118.309868','34.066367','-118.309868','4190-MFLUW'),
('United States','California','Los Angeles','90022','34.02381,-118.156582','34.023810','-118.156582','8779-QRDMV'),
('United States','California','Los Angeles','90024','34.066303,-118.435479','34.066303','-118.435479','1066-JKSGK'),
('United States','California','Los Angeles','90028','34.099869,-118.326843','34.099869','-118.326843','6467-CHFZW'),
('United States','California','Los Angeles','90029','34.089953,-118.294824','34.089953','-118.294824','8665-UTDHZ');

#Creating the table 'Customer services' with required datatypes

CREATE TABLE IF NOT EXISTS `telecom_customer_churn`.`Customer_services` (
  `Phone_services` VARCHAR(45) NOT NULL,
  `Multiple_lines` VARCHAR(45) NOT NULL,
  `Internet_service` VARCHAR(45) NOT NULL,
  `Online_security` VARCHAR(45) NOT NULL,
  `Online_backup` VARCHAR(45) NOT NULL,
  `Device_protection` VARCHAR(45) NOT NULL,
  `Tech_support` VARCHAR(45) NOT NULL,
  `Streaming_TV` VARCHAR(45) NOT NULL,
  `Streaming_movies` VARCHAR(45) NOT NULL,
  `CustomerID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE)
ENGINE = InnoDB;

#FOREIGN KEY (`CustomerID`)

INSERT INTO customer_services #Inserting values in the table
(Phone_services,Multiple_lines,Internet_service,Online_security,Online_backup,Device_protection,Tech_support,Streaming_TV,Streaming_movies,CustomerID) #Specific variables within the table
VALUES
('Yes','No','DSL','Yes','Yes','No','No','No','No','3668-QPYBK'),
('Yes','No','Fiber optic','No','No','No','No','No','No','9237-HQITU'),
('Yes','Yes','Fiber optic','No','No','Yes','No','Yes','Yes','9305-CDSKC'),
('Yes','Yes','Fiber optic','No','No','Yes','Yes','Yes','Yes','7892-POOKP'),
('Yes','Yes','Fiber optic','No','Yes','Yes','No','Yes','Yes','0280-XJGEX'),
('Yes','No','DSL','No','No','Yes','Yes','No','No','4190-MFLUW'),
('No','No','DSL','No','No','Yes','No','No','Yes','8779-QRDMV'),
('Yes','No','No','No','No','No','No','No','No','1066-JKSGK'),
('Yes','Yes','Fiber optic','No','Yes','No','No','Yes','Yes','6467-CHFZW'),
('No','No','DSL','No','Yes','No','No','No','No','8665-UTDHZ');

#Creating the table 'Customer Outcome' with required data types
CREATE TABLE IF NOT EXISTS `telecom_customer_churn`.`Customer_Outcome` (
  `Churn_label` VARCHAR(40) NOT NULL,
  `Churn_value` INT NOT NULL,
  `Churn_reason` VARCHAR(45) NOT NULL,
  `Churn_score` FLOAT NOT NULL,
  `CLTV` FLOAT NOT NULL,
  `CustomerID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE)
ENGINE = InnoDB;

#FOREIGN KEY (`CustomerID`)

INSERT INTO customer_outcome #Inserting values in the table
(Churn_label,Churn_value,Churn_reason,Churn_score,CLTV,CustomerID) #Specific columns in the table
VALUES
('Yes','1','Competitor made better offer','86','3239','3668-QPYBK'),
('Yes','1','Moved','67','2701','9237-HQITU'),
('Yes','1','Moved','86','5372','9305-CDSKC'),	
('Yes','1','Moved','84','5003','7892-POOKP'),	
('Yes','1','Competitor had better devices','89','5340','0280-XJGEX'),	
('Yes','1','Competitor offered higher download speeds','78','5925','4190-MFLUW'),	
('Yes','1','Competitor offered more data','100','5433','8779-QRDMV'),	
('Yes','1','Competitor made better offer','92','4832','1066-JKSGK'),	
('Yes','1','Competitor had better devices','77','5789','6467-CHFZW'),	
('Yes','1','Competitor had better devices','97','2915','8665-UTDHZ');	


#Creating the table 'Customer deomgraphic information' with required data types

CREATE TABLE IF NOT EXISTS `telecom_customer_churn`.`Customer_demographic_information` (
  `CustomerID` VARCHAR(20) NOT NULL,
  `Gender` VARCHAR(20) NOT NULL,
  `Senior_Citizen` VARCHAR(20) NOT NULL,
  `Partner` VARCHAR(45) NOT NULL,
  `Dependents` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE)
ENGINE = InnoDB;

#FOREIGN KEY (`CustomerID`)

INSERT INTO customer_demographic_information #Insert values in the table
(CustomerID,Gender,Senior_Citizen,Partner,Dependents) #Specific columns of the table
VALUES
('3668-QPYBK','Male','No','No','No'),
('9237-HQITU','Female','No','No','Yes'),
('9305-CDSKC','Female','No','No','Yes'),
('7892-POOKP','Female','No','Yes','Yes'),
('0280-XJGEX','Male','No','No','Yes'),
('4190-MFLUW','Female','No','Yes','No'),
('8779-QRDMV','Male','Yes','No','No'),
('1066-JKSGK','Male','No','No','No'),
('6467-CHFZW','Male','No','Yes','Yes'),
('8665-UTDHZ','Male','No','Yes','No');


#Creating the table 'Customer account information' with required data types

CREATE TABLE IF NOT EXISTS `telecom_customer_churn`.`Customer_account_information` (
  `CustomerID` VARCHAR(20) NOT NULL,
  `Count` INT(20) NOT NULL,
  `Tenure_Months` FLOAT NOT NULL,
  `Contract` VARCHAR(45) NOT NULL,
  `Paperless_Billing` VARCHAR(45) NOT NULL,
  `Paymen_method` VARCHAR(45) NOT NULL,
  `Monthly_charges` FLOAT NOT NULL,
  `Total_charges` FLOAT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_account_information_Customer_address`
    FOREIGN KEY (`CustomerID`) #FOREIGN KEY
    REFERENCES `telecom_customer_churn`.`Customer_address` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_account_information_Customer_services1`
    FOREIGN KEY (`CustomerID`) #FOREIGN KEY
    REFERENCES `telecom_customer_churn`.`Customer_services` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_account_information_Customer_Outcome1`
    FOREIGN KEY (`CustomerID`) #FOREIGN KEY
    REFERENCES `telecom_customer_churn`.`Customer_Outcome` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_account_information_Customer_demographic_informat1`
    FOREIGN KEY (`CustomerID`) #FOREIGN KEY
    REFERENCES `telecom_customer_churn`.`Customer_demographic_information` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#FOREIGN KEY (`CustomerID`)

INSERT INTO customer_account_information #Inserting the values in the table
(CustomerID,Count,Tenure_Months,Contract,Paperless_Billing,Paymen_method,Monthly_charges,Total_charges) #Specific variables of the table
VALUES
('3668-QPYBK','1','2','Month-to-month','Yes','Mailed check','53.85','108.15'),
('9237-HQITU','1','2','Month-to-month','Yes','Electronic check','70.7','151.65'),
('9305-CDSKC','1','8','Month-to-month','Yes','Electronic check','99.65','820.5'),
('7892-POOKP','1','28','Month-to-month','Yes','Electronic check','104.8','3046.05'),
('0280-XJGEX','1','49','Month-to-month','Yes','Bank transfer(automatic)','103.7','5036.3'),
('4190-MFLUW','1','10','Month-to-month','No','Credit card(automatic)','55.2','528.35'),
('8779-QRDMV','1','1','Month-to-month','Yes','Electronic check','39.65','39.65'),
('1066-JKSGK','1','1','Month-to-month','No','Mailed check','20.15','20.15'),
('6467-CHFZW','1','47','Month-to-month','Yes','Electronic check','99.35','4749.15'),
('8665-UTDHZ','1','1','Month-to-month','No','Electronic check','30.2','30.2');



/* The given data is normalised as there are few interdependencies in the data

As shown above, the data set contains 33 variables, which can be classified into 5 groups based on their dependencies:
(1) Customer Address
Country: The country of the customer’s primary residence.
State: The state of the customer’s primary residence.
City: The city of the customer’s primary residence.
Zip Code: The zip code of the customer’s primary residence.
Lat Long: The combined latitude and longitude of the customer’s primary residence.
Latitude: The latitude of the customer’s primary residence.
Longitude: The longitude of the customer’s primary residence.

(2) Services Information

PhoneService: Whether the client has a phone service or not (Yes, No).
MultipleLines: Whether the client has multiple lines or not (No phone service, No, Yes).
InternetServices: Whether the client is subscribed to Internet service with the company (DSL, Fiber optic, No)
OnlineSecurity: Whether the client has online security or not (No internet service, No, Yes).
OnlineBackup: Whether the client has online backup or not (No internet service, No, Yes).
DeviceProtection: Whether the client has device protection or not (No internet service, No, Yes).
TechSupport: Whether the client has tech support or not (No internet service, No, Yes).
StreamingTV: Whether the client has streaming TV or not (No internet service, No, Yes).
StreamingMovies: Whether the client has streaming movies or not (No internet service, No, Yes)

(3)Customer Outcome

Churn Label: Yes = the customer left the company this quarter. No = the customer remained with the company. Directly related to Churn Value.
Churn Value: 1 = the customer left the company this quarter. 0 = the customer remained with the company. Directly related to Churn Label.
Churn Score: A value from 0-100 that is calculated using the predictive tool IBM SPSS Modeler. The model incorporates multiple factors known to cause churn. The higher the score, the more likely the customer will churn.
CLTV: Customer Lifetime Value. A predicted CLTV is calculated using corporate formulas and existing data. The higher the value, the more valuable the customer. High value customers should be monitored for churn.
Churn Reason: A customer’s specific reason for leaving the company. Directly related to Churn Category


(4) Demographic Information

gender: Whether the client is a female or a male (Female, Male).
SeniorCitizen: Whether the client is a senior citizen or not ( 0, 1).
Partner: Whether the client has a partner or not (Yes, No).
Dependents: Whether the client has dependents or not (Yes, No).

(5) Customer Account Information

tenure: Number of months the customer has stayed with the company (Multiple different numeric values).
Contract: Indicates the customer’s current contract type (Month-to-Month, One year, Two year).
PaperlessBilling: Whether the client has paperless billing or not (Yes, No).
PaymentMethod: The customer’s payment method (Electronic check, Mailed check, Bank transfer (automatic), Credit Card (automatic)).
MontlyCharges: The amount charged to the customer monthly (Multiple different numeric values).
TotalCharges: The total amount charged to the customer (Multiple different numeric values).


What Does Normalization Mean?
Normalization is the process of reorganizing data in a database so that it meets two basic requirements:

There is no redundancy of data, all data is stored in only one place.
Data dependencies are logical,all related data items are stored together.
Normalization is important for many reasons, but chiefly because it allows databases to take up as little disk space as possible, resulting in increased performance.

Normalization is also known as data normalization.

The first goal during data normalization is to detect and remove all duplicate data by logically grouping data redundancies together. Whenever a piece of data is dependent on another, the two should be stored in proximity within that data set.

By getting rid of all anomalies and organizing unstructured data into a structured form, normalization greatly improves the usability of a data set. Data can be visualized more easily, insights could be extracted more efficiently, and information can be updated more quickly. As redundancies are merged together, the risk of errors and duplicates further making data even more disorganized is reduced. On top of all that, a normalized database takes less space, getting rid of many disk space problems, and increasing its overall performance significantly.

The three main types of normalization are listed below. Note: "NF" refers to "normal form
So, Normalisation was done as mentioned below to the given data:

First normal form (1NF)
a)Each cell contains only a single (atomic) value.
b)Every column in the table is uniquely named.
c)All values in the columns pertain to the same domain.

Second normal form(2NF)
Tables in 2NF are in 1NF and not have any partial dependency (e.g. every non-prime attribute must be dependent on the table’s primary key).
Hence CustomerID is the primary key in all the tables and also the foreign key linking all the tables in the given data set.
Partial Dependency – If the proper subset of candidate key determines non-prime attribute, it is called partial dependency

Third normal form (3NF)

Tables in 3NF satisfy 2NF and have no transitive functional dependencies on the primary key.

Boyce-Codd Normal Form (BCNF)	A stronger definition of 3NF is known as Boyce Codd's normal form.

4NF	
A relation is in 4NF as it is in Boyce Codd's normal form and has no multi-valued dependency.

5NF
5NF	A relation is in 5NF. If it is in 4NF and does not contain any join dependency, joining should be lossless.


Tables in 3NF must be in 2NF and have no transitive functional dependencies on the primary key.

STEPS FOLLOWED:
1) Created Schema diagram based on the normalisation
2) Created database telecom_customer_churn
3) Created required tables
4)Inserted the values from excel sheet given
*/

