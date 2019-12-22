# Database Systems (Car Dealership - Final Project)
My final project for Database Systems class in my university. The database's topic is car dealership, and contains the ERD, Schema, sample SQL, and the final report.

# Architecture / Philosophies
- Structured Query Language
- Entity Relationship Diagram (Relational Database Model)
- Database Schema
- Ten not-so-simple queries (with views, select statements, etcetera), two stored procedures, two stored functions, and one trigger.
- No frameworks, just pure SQL
- Coded with MariaDB version 10.4 (open-source version of MySQL)
- Coded in Indonesian

# SQL Concepts
- CREATE, INSERT, UPDATE, DELETE
- SELECT statements (complete with SELECT, FROM, WHERE, ORDER BY, GROUP BY, HAVING)
- Subqueries
- VIEW
- PROCEDURE (CURSOR included)
- FUNCTION
- TRIGGER

# Database Overview
- First, the Entity Relationship Diagram is used to determine the relations of the entities that exists in the database.
- Second, the Database Schema is created to visualize the SQL that would be used to create the tables.
- Third, CREATE-ing the tables and populating them with data using the INSERT statement. There is a total of 564 data inserted into the tables.
- SELECT statements are used to illustrate the commands that would be used to manipulate the database (real life application would probably be like this too).
- PROCEDURE statements are used to illustrate the commands that would be used to provide interactivity to the users, in this case, the sales/officers.
- FUNCTION statements are used to illustrate the concepts of processing a transaction (without using SET TRANSACTION), and calculating the remaining insurance time for each cars.
- TRIGGER statement is used to make the database more interactive by adding data to a 'log' table everytime the database is updated.

# SELECT Overview
- The first SELECT statement is used to display the name of every employees with their managers, also displaying the total count of the employees.
- The second SELECT statement is used to display the serial number, car name, car model, car production year, total count of modifications, original price in USD, modification price in USD, and the total price in Indonesian Rupiah.
- The third SELECT statement is used to display the employee name, their position, and their salary.
- The fourth SELECT statement is used to display a single column table that displays all of the employee information in a neat and tidy format.
- The fifth SELECT statement is used to encrpyt the name with this character: '*'
- The sixth SELECT statement is used to display the full name of the employee, their salary encrypted with $, their position, and all of their phone numbers. The encryption works as follows: if the salary could be divided by 1.000.000, then change it with $. Then, if possible, divide the rest of the salary with 500.000 and replace it with #. Example: 1.500.000 will be $#.
- The seventh SELECT statement is used to display a car that does not exist in a branch, but exists in the database.
- The eight SELECT statement is used to give employees a bonus. The algorithm works as follows: if the sum of the down payments received by the employees is more than 115.000.000, then give them a 20% bonus from their salary (bonus will be received in Yuan).
- The ninth SELECT statement is used to give customers a bonus. If a customer purchased a car from an employee whose ID is an odd number, and the car is newer than 2000, then he/she shall receive a doorprize.
- The tenth SELECT statement is used to hash the names of the employees with string functions.

# PROCEDURE Overview
- First procedure is called diskon_bonus. Input the customer's ID to the procedure and it shall do its work to find bonus prices of each orders. If the total price is lower than 1000000000, then do not give discount. Between 1 billion to 1.5 billion rupiah, then give the buyer 10% discount in Yuan. Between 1.5 billion to 2 billion, give the buyer 15% discount in Singaporean Dollars. Else, give the buyer 20% discount with USD.
- Second procedure is called checkmobil. The procedure is used to search for any cars with given keyword in the database. This procedure uses CURSOR to implement the search results.

# FUNCTION Overview
- The first function is used to purchase vehicles by inserting the paramters into the table as values.
- The second function is used to check the remaining time for insurance by subtracting current date and their purchase date.

# TRIGGER Overview
- The trigger is used before update on Order Mobil table. If a customer tried to purchase a vehicle without having sufficient funds (down payments), then the trigger will reject the purchase. If having sufficient funds, then the trigger will store the results in a separate table.

# Installations and Usage
Simply copy and paste the .txt file into your MariaDB / MySQL / XAMPP, then watch as the magic unfolds.

# Bugs
None found for now.

# Contribution
If you have any ideas on how to improve the algorithms, feel free to submit a pull request.

# License
MIT License.

# Changelog
### Version 1.0 - 22/12/2019
- Initial release.
