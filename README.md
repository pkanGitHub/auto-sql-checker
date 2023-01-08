# Auto SQL Checkers (In development)

This Checker program is intend to use for IT 3380. As a PLA, it is sometimes really time consuming while having to check 30+ students with at least 10+ queries each. This program is design to make grading easier for myself by having the program auto execute the results from assignment files.

**GOAL:** the final version is aiming to compare the results and auto grade.

# Program SetUp and Require Modules

**!! HEADS UP !! This program is design to work with sql and python docker container from IT 3380.**

**Once** turn on SQL and Python container in docker.

1. Log into python server and re-direct into `app` directory.
2. Install the following modules:
   ```
   pip install pandas
   pip install sqlalchemy
   pip install openpyxl
   ```
3. Once installed, re-direct into project folder and follow instruction based on the version below...

## **(Ver1) Results onto Excel sheets**

This Version of SQL Checker is to read from given sql file and execute the results onto an Excel file.

### **Instruction:**

1. Get into `Results-onto-excel`'s project directory.

   In python container, run:

   ```
   python ExecuteQueries.py <file name for execution>
   ```

2. Then it'll prompt user for database name:

   ```
   Available databases:
   ---------------
   module2
   classicmodels
   employees
   sakila
   project2

   What database are you using?
   ```

3. Once finish the above steps, the program will then execute and output the results onto the Excel file by sheets.

## Resources used:

[Creat SQLAlchemy engine](https://hackersandslackers.com/python-database-management-sqlalchemy/#:~:text=Database%20Connection%20URIs)

[MySQL-Connector](https://docs.sqlalchemy.org/en/20/dialects/mysql.html#module-sqlalchemy.dialects.mysql.mysqlconnector)

[Export SQL to file](https://datatofish.com/export-sql-table-to-csv-python/)

[Pandas Dataframe](https://www.freecodecamp.org/news/connect-python-with-sql/#:~:text=Formatting%20Output%20into%20a%20pandas%20DataFrame)

[Create an empty excel file](https://www.tutorialspoint.com/How-to-create-an-empty-file-using-Python)

[Guides for Openpyxl](https://realpython.com/openpyxl-excel-spreadsheets-python/)

[Conditional Selections](https://youtu.be/SF4BNTOSC7s?t=178)
