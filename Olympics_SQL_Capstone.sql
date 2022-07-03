/* Capstone Project(MySQL)

The modern Olympic Games or Olympics are the leading international sporting events featuring summer and winter sports competitions in which thousands of athletes from around the world participate in a variety of competitions. The Olympic Games are considered the world's foremost sports competition with more than 200 nations participating. The Olympic Games are normally held every four years, and since 1994, has alternated between the Summer and Winter Olympics every two years during the four-year period.
Their creation was inspired by the ancient Olympic Games (Ancient Greek: Ὀλυμπιακοί Ἀγῶνες), held in Olympia, Greece from the 8th century BC to the 4th century AD. Baron Pierre de Coubertin founded the International Olympic Committee (IOC) in 1894, leading to the first modern Games in Athens in 1896. The IOC is the governing body of the Olympic Movement, with the Olympic Charter defining its structure and authority.
The Olympic Games programme consists of 35 sports, 30 disciplines and 408 events. For example, wrestling is a Summer Olympic sport, comprising two disciplines: Greco-Roman and Freestyle. It is further broken down into fourteen events for men and four events for women, each representing a different weight class. The Summer Olympics programme includes 26 sports, while the Winter Olympics programme features 15 sports. Athletics, swimming, fencing, and artistic gymnastics are the only summer sports that have never been absent from the Olympic programme. Cross-country skiing, figure skating, ice hockey, Nordic combined, ski jumping, and speed skating have been featured at every Winter Olympics programme since its inception in 1924. Current Olympic sports, like badminton, basketball, and volleyball, first appeared on the programme as demonstration sports, and were later promoted to full Olympic sports. Some sports that were featured in earlier Games were later dropped from the programme.
Olympic Data set shows the data for the performance of each athlete over the years from 2000 to 2012 which includes both Summer and Winter olympics. The data set gives a detailed picture of medals won in each oylmpic sport and the countries these athletes represent.
-It has 10 coloumns variety of data with 8618 observations
-Data belongs to the IOC which conducts the olympic events
-Data shows the medal tally along with each sub-category
-Data also avails you to the age and the dates when the athlete won the medal
-The podium finishes also gives you an idea of how each country performed in various sports

Columns:
1)name: Gives the athletes' names who had a podium finish or won the medal in any sport of the event and participated in multiple events
2)age: Represents the age at which the athlete participated in olympic events over the years as the athletes represented and secured medals in multiple events
3)country: Shows the country or region to which the athlete represented as the athlete must be a national of the country he/she represents
4)year: Shows the 7 olympic events from 2000 to 2012 which includes both summer and winter games held
5)Date_Given: Shows the exact date of events in the calendar year
6)sports: Shows the sports and disciplines the olympic organises in each event
7)gold_medal: It shows the winner of the sport with 1st podium finish
8)silver_medal: It shows the 2nd place of the sport below the gold medal
9)bronze_medal: It shows the last podium finish of the sport and the 3rd in rank to the above two
10)total_medal: It gives the total of all the above medals won by an athlete in one particular event
*/

#Creating the new database 
create database olympics;

#making olympics database as default to perform queries
use olympics;

/*- I used PyMySQL to upload the csv file into the database.
Below is the code i used to upload the data along with the creation of new table 'olympics_table'

import pymysql; #importing the library
#establishing connection with the database
conn = pymysql.connect(
    host = 'localhost',
    user = 'root',
    password = '123456',
    db= 'olympics',
    )
cur = conn.cursor() #creating the connection cursor

from sqlalchemy import create_engine   #importing create engine
import pandas as pd   #pandas for uploading the csv file
df =pd.read_csv("C:/Users/CSC/Downloads/olympix_data_organized_with_header (1) (1).csv") #reading the file in pandas dataframe
db_connection_str = "mysql+pymysql://root:123456@127.0.0.1/olympics"   #connection string
db_connection = create_engine(db_connection_str)  #database connection
df.to_sql("olympics_table",db_connection)   #converting dataframe to sql
print("Data written successfully")   #output displayed
*/

#selecting the table created using PyMySQL
select *from olympics_table;

#1 Find the average number of medals won by each country

#1) Find the average number of medals won by each country

SELECT country,ROUND(AVG(total_medal)) as Average_medals
FROM olympics_table
GROUP BY country
order by Average_medals desc;

/*-It displays the Average medals(Total medals) won by each country in decending order.
-Zimbabwe is in top 1 with average of 4 medals , followed by Costa Rica with 2 medals
-There are no country with Zero medals
*/

#Average of total medals based on years

 select country, sum(total_medal)/count(distinct year) as Average_medals
 from olympics_table
 group by country
 order by average_medals desc;
 
 /*-Selecting the country column
   -Dividing the sum of total medals each country has secured by the different events of olympics(7)
   -grouped by the country 
   -result sorted by the average of medals in descending order
   
Interpretations:
* USA has the highest average of medals in 7 events of olympics with 187.4 average each event
* Second comes Russia with 109-110 medals in each event
* India is on the lower side with just 2.75 medals average
* There are lot of countries with just 1 medal as the average
*/

#2 Display the countries and the number of gold medals they have won in decreasing order

 select distinct country,sum(gold_medal) as Gold_medals from olympics_table
 group by country 
 order by sum(gold_medal) desc;
 
 /*-Selecting the country and sum of gold medals and changing the column name
 -grouping the data based on country
 -sorting the result based on gold medals in descending order
 
 Interpretations:
 -USA has the highest gold medals with 552
 -Russia and China come at second with 234 gold medals each and Germany is not far behind with 223 golds
 -lot of countries who haven't score a single gold medal in the list 
/**/

#3 Display the list of people and the medals they have won in descending order, grouped by their country

select name,sum(gold_medal) as Gold_medals,sum(silver_medal) as Silver_medals,sum(brone_medal) as Bronze_medals,sum(total_medal) as Total_medals,country from olympics_table
group by  name,country
order by total_medal desc;

/*-Select the name and differeny medal catgeories and adding them
-grouping the data by name and country
sorting the result based on total medals in decreasing order

Interpretations:
-Michael Phelps is the best performing athlete with 18 golds and 22 in total represnting USA
-Second comes Natalie Coughlin from USA with 12 medals in total
-third place is Aleksey Nemov from Russia with 6 medals in total
*/


#4 Display the list of people with the medals they have won according to their age

select name,age,total_medal from olympics_table;

/*-Selecting name, age and total medals of athletes from the table

Interpretations:
- Micheal Phelps is at top list who 8 golds at the age 25, 8 at age 19 and 6 at the age of 27,
-Similarly all athletes are dispalyed at what age they won medals and their tally
*/

#5 Which country has won the most number of medals (cumulative)

select country,sum(total_medal) as Medals_won
from olympics_table
group by country
order by Medals_won desc;

/*-Selecting the country, sum of total of medals 
-grouping the data by country
-sorting the result by medals won in descending order

Interpretations:
-USA is at the top of the list with total of 1312 medals
-Russia comes second with nearly half of USA with 768 medasls
-Germany comes at third with 629
*/

/*Normalisation of Olympics data:
-Normalization is the process to eliminate data redundancy and enhance data integrity in the table. 
-Normalization also helps to organize the data in the database. 
-It is a multi-step process that sets the data into tabular form and removes the duplicated data from the relational tables.

*Normalization is the process of reorganizing data in a database so that it meets two basic requirements:

-There is no redundancy of data, all data is stored in only one place.
-Data dependencies are logical,all related data items are stored together.
-Normalization is important for many reasons, but chiefly because it allows databases to take up as little disk space as possible, resulting in increased performance.

*Normalization is also known as data normalization.

- The first goal during data normalization is to detect and remove all duplicate data by logically grouping data redundancies together. Whenever a piece of data is dependent on another, the two should be stored in proximity within that data set.
- By getting rid of all anomalies and organizing unstructured data into a structured form, normalization greatly improves the usability of a data set. Data can be visualized more easily, insights could be extracted more efficiently, and information can be updated more quickly. As redundancies are merged together, the risk of errors and duplicates further making data even more disorganized is reduced. On top of all that, a normalized database takes less space, getting rid of many disk space problems, and increasing its overall performance significantly.

The three main types of normalization are listed below. Note: "NF" refers to "normal form
So, Normalisation was done as mentioned below to the given data:

#Olympics Data:
*Breaking into multiple tables:

-We can break the olympics table into 3 tables:
a)athlete_details(includes: name,age,sports,country)
b)medal_tally(includes: name,age,gold_medal,silver_medal,bronze_medal,total_medal)
c)events(includes: name,age,year,Date_Given)

*First normal form (1NF)
-Each cell contains only a single (atomic) value. So we do not have more than one value in the given data set.
-Every column in the table is uniquely named and do we do not have repeating names
-All values in the columns pertain to the same domain(Olympics)

*Second normal form(2NF)
-Tables in 2NF are in 1NF and not have any partial dependency (e.g. every non-prime attribute must be dependent on the table’s primary key).
-Hence we can make (name and age) as the primary key in all the tables and also the foreign key linking all the tables in the given data set.
-Partial Dependency – If the proper subset of candidate key determines non-prime attribute, it is called partial dependency
-We can also add a new column by assigning an unique id to each athlete 

*Third normal form (3NF)
-Tables in 3NF satisfy 2NF and have no transitive functional dependencies on the primary key.
-Boyce-Codd Normal Form (BCNF)	A stronger definition of 3NF is known as Boyce Codd's normal form.

*4NF	
-A relation is in 4NF as it is in Boyce Codd's normal form and has no multi-valued dependency.

*5NF
-5NF	A relation is in 5NF. If it is in 4NF and does not contain any join dependency, joining should be lossless.
*/
# Schema diagram is also included in the zip folder.
