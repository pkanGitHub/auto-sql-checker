import mysql.connector
import pandas as pd
from FormatQueries import *
from sqlalchemy import create_engine
import os

def get_database():
    print("\nAvailable databases: ")
    print("---------------")
    print("module2") #mod2, mod12
    print("classicmodels") #module6, mod10, mod11
    print("employees") #project1
    print("sakila") #midterm proj
    print("project2\n") #proj2, final proj
    database = input("What database are you using? ")

    if database != 'module2' and database != 'classicmodels' and database != 'employees' and database != 'sakila' and database != 'project2':
        print(f"{database} does not exist in the avaliable databases")
        return get_database()
    return database

def create_connector_object(database_name):
    # mydb = mysql.connector.connect(
    #     host="mysql-container",
    #     user="root",
    #     passwd="root",
    #     database=f"{database_name}"
    # )
    engine_uri = f"mysql+mysqlconnector://root:root@mysql-container:3306/{database_name}"
    connection = create_engine(engine_uri)

    return connection


def read_formatted_file(database):
    mydb = create_connector_object(database)
    # mycursor = mydb.cursor()
    with open ('FormattedQueries.sql') as file:
        queries_file = file.readline()
        pd_query = pd.read_sql(queries_file, mydb)
        try:
            # mycursor.execute(queries_file)
            # result = mycursor.fetchall()
            # for query in result:
            #     print(query)
                
            df = pd.DataFrame(pd_query)
            df.to_csv(r'Result_Data.csv', index = False)
            print('Successfully write to csv file')
        except Exception as err:
            print(f"Error Occured: {err}")

def main():
    writeFile()
    database = get_database()
    read_formatted_file(database)
    try:
        create_connector_object(database)
        print("Successfully connected to the database!")
    except Exception as err:
        print(f"Error Occured: {err}")

main()