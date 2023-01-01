# import mysql.connector
import sys

# def main():
#create a connector object
    # try:
    #     mydb = mysql.connector.connect(
    #         host="mysql-container",
    #         user="root",
    #         passwd="root",
    #         database="project2"
    #     )
    #     print("Successfully connected to the database!")
    # except Exception as err:
    #     print(f"Error Occured: {err}\nExiting program...")
    #     quit()

    # #create database cursor
    # mycursor = mydb.cursor()
    # if(user_choice == 1):
    #     get_employeesByRegions(mycursor)

def readFile():
    # read file and remove commented lines
    queries = []
    # pass file name in the argument you want to read
    with open(sys.argv[1]) as file:
        for line in file:
            li = line.strip()
            if not li.startswith('--'):
                queries.append(line.rstrip())
        # join queries from multiple lines into one line
        # the " " is to join each line adding a space in between
        merged_queries = " ".join(q.strip() for q in queries)
        # split queries by semicolon(;)
        final_queries = merged_queries.split(";")

        return final_queries
        

def writeFile():
    line = readFile()
    with open("FormattedQueries.sql", "w") as file:
        for q in line:
            # write each queries in its own line in csv file
            file.write(f"{q.strip()}\n")
       
def main():
    writeFile()


main()