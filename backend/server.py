from flask import Flask
from flask_cors import CORS
from flask_mysqldb import MySQL
import pandas as pd
from dotenv import load_dotenv
import json
import os

# TODO: 
# - handle null queries and input sanitization
# - find a better way to make the budget serializable for json

# loading the .env
load_dotenv()

db_host = os.getenv("host")
db_user = os.getenv("user")
db_password = os.getenv("password")
db_database = os.getenv("database")

# flask app
app = Flask(__name__)
CORS(app, supports_credentials=True)

app.config['MYSQL_HOST'] = db_host
app.config['MYSQL_USER'] = db_user
app.config['MYSQL_PASSWORD'] = db_password
app.config['MYSQL_DB'] = db_database
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
 
mysql = MySQL(app)


@app.route("/")
def hello_world():
    return "MEOW!"


# ------------------- PROJECTS ------------------- #

# get all projects
@app.route("/getProjects", methods=['GET'])
def get_projects():
    cursor = mysql.connection.cursor()

    query = """
        select projectid, title, preview, stage, yearoffoundation as year
        from projects
    """
    cursor.execute(query)
    projects = cursor.fetchall()

    # get all areas for each project
    for project in projects:
        query = """
            select areaid, title
            from areas natural join refers
            where projectid = %s
        """
        tuple = (project['projectid'],)

        cursor.execute(query, tuple)
        project['areas'] = cursor.fetchall()

    cursor.close()

    return json.dumps(projects)


# get featured projects
@app.route("/getFeaturedProjects", methods=['GET'])
def get_featured_projects():
    cursor = mysql.connection.cursor()

    query = """
        select projectid, title, preview, stage, yearoffoundation as year
        from projects
        where featured = 1
    """
    cursor.execute(query)
    projects = cursor.fetchall()

    # get all areas for each project
    for project in projects:
        query = """
            select areaid, title
            from areas natural join refers
            where projectid = %s
        """
        tuple = (project['projectid'],)

        cursor.execute(query, tuple)
        project['areas'] = cursor.fetchall()

    cursor.close()

    return json.dumps(projects)


# get project details
@app.route("/getProject/<projectid>", methods=['GET'])
def get_project(projectid):
    cursor = mysql.connection.cursor()

    query = """
        select projectid, p.title, p.description, stage, budget, yearoffoundation, featured, supervisor, name, surname
        from projects as p join people on personId = supervisor
        where ProjectID = %s
    """
    tuple = (projectid,)

    cursor.execute(query, tuple)
    project = cursor.fetchone()

    # get all areas for the project
    query = """
        select areaid, title
        from areas natural join refers
        where projectid = %s
    """
    cursor.execute(query, tuple)
    project['areas'] = cursor.fetchall()
    cursor.close()

    # make the budget serializable for json
    # probably casting it to a string it's not the best solution, but for now it works
    project['budget'] = str(project['budget'])

    return json.dumps(project)


# get all years in which there are projects
@app.route("/getYears", methods=['GET'])
def get_years():
    cursor = mysql.connection.cursor()

    cursor.execute("select distinct yearoffoundation from projects order by yearoffoundation")
    years = cursor.fetchall()
    cursor.close()

    return json.dumps(years)

# get all stages in which there are projects
@app.route("/getStages", methods=['GET'])
def get_stages():
    cursor = mysql.connection.cursor()

    cursor.execute("select distinct stage from projects order by stage")
    stages = cursor.fetchall()
    cursor.close()

    return json.dumps(stages)

# get project min and max budget
@app.route("/getBudgetRange", methods=['GET'])
def get_budget_range():
    cursor = mysql.connection.cursor()

    query = """
        select min(budget) as min, max(budget) as max
        from projects
    """
    cursor.execute(query)
    budget_range = cursor.fetchone()
    cursor.close()

    # make it serializable for json
    budget_range['min'] = str(budget_range['min'])
    budget_range['max'] = str(budget_range['max'])

    return json.dumps(budget_range)


# get all projects which refer an area 
@app.route("/getProjectsFromArea/<areaid>", methods=['GET'])
def get_project_from_area(areaid):
    cursor = mysql.connection.cursor()

    query = """
        select projectid, title, stage, yearoffoundation as year, featured
        from projects natural join refers
        where areaid = %s
    """
    tuple = (areaid,)

    cursor.execute(query, tuple)
    projects = cursor.fetchall()
    cursor.close()

    return json.dumps(projects)



# ------------------- PEOPLE ------------------- #


'''
# get all people
@app.route("/getPeople", methods=['GET'])
def get_people():
    cursor = mysql.connection.cursor()

    cursor.execute("select * from people")
    people = cursor.fetchall()
    cursor.close()

    return json.dumps(people)
'''

# get all people
@app.route("/getPeople", methods=['GET'])
def get_people():
    cursor = mysql.connection.cursor()

    query = """
        select personid, name, surname, age, email, linkedin, role
        from people
    """
    cursor.execute(query)
    people = cursor.fetchall()
    cursor.close()

    return json.dumps(people)
    



# get all projects that each person supervises
@app.route("/getProjectsSupervisedFromPerson/<personid>", methods=['GET'])
def get_projects_supervied_from_person(personid):
    cursor = mysql.connection.cursor()

    query = """
        select projectid, title, stage, yearoffoundation as year, featured
        from projects join people on personid = supervisor
        where personid = %s
    """
    tuple = (personid,)

    cursor.execute(query, tuple)
    projects = cursor.fetchall()
    cursor.close()

    return json.dumps(projects)


    

# get all projects to which each person partecipates
@app.route("/getProjectsJoinedFromPerson/<personid>", methods=['GET'])
def get_projects_joined_from_person(personid):
    cursor = mysql.connection.cursor()

    query = """
        select projectid, title, stage, yearoffoundation as year, featured
        from projects natural join partecipates 
        where personid = %s
    """
    tuple = (personid,)

    cursor.execute(query, tuple)
    projects = cursor.fetchall()

    cursor.close()

    return json.dumps(projects)



#get person details 
@app.route("/getPerson/<personid>", methods=['GET'])
def get_person(personid):
    cursor = mysql.connection.cursor()

    query = """
        select personid, name, surname, age, email, linkedin, CV, role
        from people 
        where PersonID = %s
    """
    tuple = (personid,)

    cursor.execute(query, tuple)
    person = cursor.fetchone()
    cursor.close()
    return json.dumps(person)


    

# ------------------- AREAS ------------------- #

# get all areas
@app.route("/getAreas", methods=['GET'])
def get_areas():
    cursor = mysql.connection.cursor()

    cursor.execute("select * from areas")
    areas = cursor.fetchall()
    cursor.close()

    return json.dumps(areas)


# get all areas with associated projects
@app.route("/getAreaCards", methods=['GET'])
def get_areas_with_projects():
    cursor = mysql.connection.cursor()

    query = """
        select AreaID, Title
        from areas
        order by title
    """
    cursor.execute(query)
    areas = cursor.fetchall()

    # get all projects for each area
    for area in areas:
        query = """
            select ProjectID, Title
            from projects natural join refers
            where areaid = %s
        """
        tuple = (area['AreaID'],)

        cursor.execute(query, tuple)
        area['projects'] = cursor.fetchall()
        
    cursor.close()

    return json.dumps(areas)


# get area details
# TO DO: aggiungi link ai progetti
@app.route("/getArea/<areaid>", methods=['GET'])
def get_area(areaid):
    cursor = mysql.connection.cursor()

    query = """
        select AreaID, Title, Description
        from areas         
        where AreaID = %s
    """
    tuple = (areaid,)

    cursor.execute(query, tuple)
    project = cursor.fetchone()
    cursor.close()

    return json.dumps(project)



if __name__ == '__main__':
    app.run()