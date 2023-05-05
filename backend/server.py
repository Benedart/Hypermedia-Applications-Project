from flask import Flask
from flask_cors import CORS
import mysql.connector
from mysql.connector import Error
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

# db connection handling
db = mysql.connector.connect(
  host=db_host,
  user=db_user,
  password=db_password,
  database=db_database
)

# flask app
app = Flask(__name__)
CORS(app, supports_credentials=True)

@app.route("/")
def hello_world():
    return "MEOW!"


# ------------------- PROJECTS ------------------- #

@app.route("/getProjects", methods=['GET'])
def get_projects():
    cursor = db.cursor(dictionary=True)

    cursor.execute("select projectid, title, preview, stage from projects")
    projects = cursor.fetchall()

    return json.dumps(projects)


@app.route("/getProject/<projectid>", methods=['GET'])
def get_project(projectid):
    cursor = db.cursor(dictionary=True)

    query = """
        select projectid, p.title, p.description, budget, yearoffoundation, supervisor, name, surname, a.areaid, a.title as area, a.type
        from ((projects as p join people on personId = supervisor) natural join refers as r) join areas as a on r.areaId = a.areaId
        where ProjectID = %s
    """
    tuple = (projectid,)

    cursor.execute(query, tuple)
    project = cursor.fetchone()

    # make the budget serializable for json
    # probably casting it to a string it's not the best solution, but for now it works
    project['budget'] = str(project['budget'])

    return json.dumps(project)


# ------------------- PEOPLE ------------------- #

@app.route("/getPeople", methods=['GET'])
def get_people():
    cursor = db.cursor(dictionary=True)

    cursor.execute("select * from people")
    people = cursor.fetchall()

    return json.dumps(people)


# ------------------- AREAS ------------------- #


if __name__ == '__main__':
    app.run()