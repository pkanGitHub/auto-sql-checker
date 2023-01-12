import sys

def is_commented(input):
    if input.startswith('--'):
        return True
    elif input.startswith('/*'):
        return True
    elif input.endswith('*/'):
        return True
    else:
        return False

def readFile():
    queries = []
    # pass solution file name in the argument you want to read
    with open(f"./Solutions/MySQL/{sys.argv[1]}") as file:
        for line in file:
            li = line.strip()
            # remove commented lines
            if not is_commented(li):
                queries.append(line.rstrip())
            
        # join queries from multiple lines into one line
        # the " " is to join each line adding a space in between
        merged_queries = " ".join(q.strip() for q in queries)
        # split queries by semicolon(;)
        final_queries = merged_queries.split(";")

        return final_queries
        
def writeSolutionFile():
    line = readFile()
    with open("FormattedSolution.sql", "w") as file:
        for q in line:
            # write each queries in its own line in sql file
            file.write(f"{q.strip()}\n")
