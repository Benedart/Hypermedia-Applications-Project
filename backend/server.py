from flask import Flask
from flask_cors import CORS
import mysql.connector
from mysql.connector import Error
import pandas as pd
from dotenv import load_dotenv
import json
import os

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


@app.route("/getProjects", methods=['GET'])
def get_projects():
    cursor = db.cursor(dictionary=True)

    cursor.execute("select projectid, title, preview, stage from projects")
    projects = cursor.fetchall()

    return json.dumps(projects)


@app.route("/getPeople", methods=['GET'])
def get_people():
    cursor = db.cursor(dictionary=True)

    cursor.execute("select * from people")
    people = cursor.fetchall()

    return json.dumps(people)


if __name__ == '__main__':
    app.run()