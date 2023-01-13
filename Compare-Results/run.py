from FormatAndExecute.FormatQueries import *
from FormatAndExecute.FormatSolutionQueries import *
from FormatAndExecute.ExecuteQueries import *


def main():
    database = get_database()
    files = {'FormattedQueries.sql': 'Result_Data.xlsx', 'FormattedSolution.sql': 'Solution_Result.xlsx'}
    try:
        create_connector_engine(database)
        print(f"{database} connected, now processing...\n")
        writeFile()
        writeSolutionFile()
        for file, path in files.items():
            file = './FormatAndExecute/' + file
            create_workbook(path) 
            execute_formatted_file(database, path, file)
            remove_default_sheet(path)
            auto_adjust_column_width(path)
    except Exception as err:
        print(f"Error Occured: {err}")

main()