# Hypermedia Applications Project 2022/23

## Magiche istruzioni per il setup del progetto
* [DB](#db)
* [Backend](#backend)
* [Frontend](#frontend)
* [Git](#git)
* [Useful resources](#useful-resources)

## DB
You can find the db schema in the `deliverables` folder of the project. If something doesn't sound right about it, or if you encounter problems during your implementation (eg. you notice that you need to add some attributes), let everyone know asap, as db changes could impact the entire structure of the project. Thanksthanks.

## Backend
### Quick start
Make sure to be confident with the concepts of [venv](#venv) and [pip](#pip) before following the quick start section. 

* Move to the `backend` folder of the project
* Create or activate your venv:

`python -m venv <name of your virtual environment>`

`.\<name of your virtual environment>\Scripts\activate`
* Install the required packages: `pip install -r requirements.txt`
* Add the db credentials to the `.env` file (create it if missing). In particular, you need to define the `host`, `user`, `password` and `database` environment variables.
*  Run the flask application: `flask --app server run`
*  Go to the provided url to check that everything is working correctly


### venv
A virtual environment is an isolated environment where you can install packages without affecting the global Python environment.

To create a virtual environment, navigate to your project directory in your command prompt or terminal and run the command `python -m venv <name of your virtual environment>`.

To activate the virtual environment, run the command `source <name of your virtual environment>/bin/activate` on macOS/Linux or `.\<name of your virtual environment>\Scripts\activate` on Windows.

Once activated, any packages you install will be installed in the virtual environment instead of the global Python environment. You can confirm that you are in the virtual environment by checking the prefix in your command prompt or terminal.

 To deactivate the virtual environment, simply run the command `deactivate`.

### Pip
_pip_ is the _package installer for Python_. You can use _pip_ to install packages from the Python Package Index and other indexes.

To use pip, first make sure you have Python installed on your computer. You can check if Python is installed by running the command `python --version` in your command prompt or terminal.

| Command | Description | 
|--|--|
| `pip install <package name>` | To install new packages |
| `pip install -r requirements.txt` | To install packages from a requirements.txt file |  
| `pip list` | To list the installed packages |
| `pip uninstall <package name>` | To uninstall a package |
| `pip freeze > requirements.txt` |  To generate the requirements.txt file |

### DotEnv
Dotenv is a Python library that allows you to load environment variables from a .env file.

Create a new file in your project directory called `.env`. This file should contain key-value pairs, with each variable on a separate line. For example:

    DATABASE_URL=postgres://user:password@localhost/mydatabase
    SECRET_KEY=mysecretkey

In your Python code, import the dotenv library and call the `load_dotenv` function to load the environment variables from the .env file. For example:

    import os
    from dotenv import load_dotenv
    
    load_dotenv()
    
    db_url = os.getenv("DATABASE_URL")
    secret_key = os.getenv("SECRET_KEY")



## Frontend
### Quick start

* Move to the `frontend` folder of the project
* Run the `npm i` command. This command will read all the dependencies that were defined in the `package.json` file and automatically installs them for you.
* Set the `VITE_APP_URL` to the server's url on the `.env` file of your frontend (create it if missing).
Example: `VITE_APP_URL=http://127.0.0.1:5000`

* Run the `npm run dev` command to start your application
* Go to the provided url to make sure that everything is working correctly


### DotEnv
The idea is the same as described in the backend section, but with some changes.
Refer to [this link](https://vitejs.dev/guide/env-and-mode.html) for a detailed guide.



## Git
Recommended: [GitHub Desktop | Simple collaboration from your desktop](https://desktop.github.com/)

General pattern:
* `Pull` before you start working to check what has been changed
* Do your awesome stuff

Now, let's say you're ready to push your incredibly valuable work for everyone else to enjoy, you should do something like that:
* `Pull` again: someone else could've pushed something while you were working
* Resolve possible conflicts. When in doubt, ask to your very friendly colleagues for lighting fast and reliable advice
* `Commit` your changes
* `Push` your changes

⚠️ **Please** don't leave commited changes unpushed ⚠️

Also, there's a really cool guide on the useful resources below :D


## Cat
![enter image description here](https://w0.peakpx.com/wallpaper/719/351/HD-wallpaper-happy-cat-pretty-beautiful-sweet-beauty-face-sleepy-animals-lovely-kitty-cat-sleeping-cat-face-hat-cute-paws-cats-kitten.jpg)

## Useful resources
[Introduction | Vue.js](https://vuejs.org/guide/introduction.html)

[Flask Documentation (2.3.x)](https://flask.palletsprojects.com/en/2.3.x/)

[TypeScript: The starting point for learning TypeScript](https://www.typescriptlang.org/docs/)

[Get started with Bootstrap · Bootstrap v5.3](https://getbootstrap.com/docs/5.3/getting-started/introduction/)

[git - the simple guide](https://rogerdudler.github.io/git-guide/)
