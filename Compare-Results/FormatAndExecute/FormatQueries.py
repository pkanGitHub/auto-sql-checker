import sys

def readFile():
    queries = []
    # pass file name in the argument you want to read
    with open(f"./sqlFiles/{sys.argv[2]}") as file:
        for line in file:
            li = line.strip()
            # remove commented lines
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
    with open("./FormatAndExecute/FormattedQueries.sql", "w") as file:
        for q in line:
            # write each queries in its own line in sql file
            file.write(f"{q.strip()}\n")
