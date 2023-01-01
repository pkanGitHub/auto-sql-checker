# import mysql.connector

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
    final_queries = []
    with open('queries.sql') as file:
        for line in file:
            li = line.strip()
            if not li.startswith('--'):
                queries.append(line.rstrip())
        # join queries from multiple lines into one line
        merged_queries = "".join(q.strip() for q in queries)
        # split queries by semicolon(;)
        final_queries.append(merged_queries.split(";"))

        return final_queries
        

def writeFile():
    line = readFile()
    with open("Queries.csv", "w") as file:
        for q in line:
            # file.write(f"{q}")
            print(q)
       
def main():
    writeFile()


main()