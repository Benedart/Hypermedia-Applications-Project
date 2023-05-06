from flask import Flask
from flask_cors import CORS
from flask_mysqldb import MySQL
import pandas as pd
from dotenv import load_dotenv
import json
import os

# TODO: handle null queries and input sanitization

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

@app.route("/getProjects", methods=['GET'])
def get_projects():
    cursor = mysql.connection.cursor()

    cursor.execute("select projectid, title, preview, stage from projects")
    projects = cursor.fetchall()
    cursor.close()

    return json.dumps(projects)


@app.route("/getProject/<projectid>", methods=['GET'])
def get_project(projectid):
    cursor = mysql.connection.cursor()

    query = """
        select projectid, p.title, p.description, stage, budget, yearoffoundation, supervisor, name, surname
        from projects as p join people on personId = supervisor
        where ProjectID = %s
    """
    tuple = (projectid,)

    cursor.execute(query, tuple)
    project = cursor.fetchone()
    cursor.close()

    # make the budget serializable for json
    # probably casting it to a string it's not the best solution, but for now it works
    project['budget'] = str(project['budget'])

    return json.dumps(project)


# ------------------- PEOPLE ------------------- #

@app.route("/getPeople", methods=['GET'])
def get_people():
    cursor = mysql.connection.cursor()

    cursor.execute("select * from people")
    people = cursor.fetchall()
    cursor.close()

    return json.dumps(people)


@app.route("/getPeopleFromProject/<projectid>", methods=['GET'])
def get_people_from_project(projectid):
    cursor = mysql.connection.cursor()

    query = """
        select personid, name, surname, role
        from people natural join partecipates
        where projectid = %s
    """
    tuple = (projectid,)

    cursor.execute(query, tuple)
    people = cursor.fetchall()
    cursor.close()

    return json.dumps(people)

# ------------------- AREAS ------------------- #

@app.route("/getAreasFromProject/<projectid>", methods=['GET'])
def get_areas_from_project(projectid):
    cursor = mysql.connection.cursor()

    query = """
        select areaid, title
        from areas natural join refers
        where projectid = %s
    """
    tuple = (projectid,)

    cursor.execute(query, tuple)
    areas = cursor.fetchall()
    cursor.close()

    return json.dumps(areas)


if __name__ == '__main__':
    app.run()