# Intro to Backend Systems 

In this portion of the class we are going to learn about internet architecture, HTTP, REST API design concepts, test-driven development, data modeling, representation, persistence, authentication, authorization, and documentation. After finishing this course, you will be prepared to design, build, and deploy your own RESTful web API services using Python, Flask, and other popular libraries and tools. These principles and concepts carry over to developing web services in other languages and frameworks as well.

## Objectives

- Learn how to setup a python environment for develpment
- Use git and github to manage your projects
- Use package managers to fetch and manage requirements
- Discover and practice restful patterns

## Python and Environment Setup

1. If you don't already have brew, install brew by following the instructions here: https://brew.sh: 
2. Install python3 with ```brew install python3```.
3. Install pip, the python package manager.
4. Install virtualenv with: pip3 install virtualenv


Lets create a basic virtual environment for Python3 and install the required packages.

Run ```virtualenv development``` to setup our virtual environment.

Activate your virtual environment with:

```source development/bin/activate```

Create a requirements.txt file containing these dependencies.

aniso8601==1.0.0
click==6.7
Flask==0.10.1
Flask-Jsonpify==1.5.0
Flask-RESTful==0.3.4
Flask-SQLAlchemy==2.2
itsdangerous==0.24
Jinja2==2.8
MarkupSafe==0.23
psycopg2==2.7.3
pytz==2015.4
six==1.9.0
SQLAlchemy==1.1.12
Werkzeug==0.10.4


## Database Setup

### Installing & Running MongoDB

Another prerequisite besides python 3 is MongoDB. Whenever the flask server is running, you need to run a MongoDB instance as well. Otherwise the server won't be able to access the DB and will throw an exception.

You can test if MongoDB is installed by starting an instance of the DB with the following terminal command:

mongod
Upon successful start you should see the following message:

[initandlisten] waiting for connections on port 27017
Now your database is running and waiting for connections! Keep mongod running in the current terminal tab and open a new tab (CMD + T) in which you'll enter the terminal commands of the following steps. This will keep the database running which is required for your flask server to work.

If the command isn't recognized, you need to install MongoDB via homebrew:

brew update
brew install mongodb
Once the install completes you need to start the DB with this command:

mongod
mongod may notice that you have not specified a database directory. By default it uses /data/db. Because this folder may be missing, mongod may output the following error when run: Data directory /data/db not found., terminating

If this happens, create a database location for your user using the following command:

    sudo mkdir -p /data/db
then change the ownership of the file as following:

sudo chown -R $USER /data/db
Now you should be able to run mongod. If you still run into issues try to consult this Stack Overflow question.

## Creating your first Flask app

```python
from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run()

```

Run ```python app.py``` in terminal and copy the url in the terminal into a browser.


### Working with Requests and JSON

Lets try returning a JSON response when we hit our person_route function:

```python
@app.route('/person')
def person_route():
    json_person = {"name": "Eliel", 'age': 23}
    return json_person

```

## Using the Python Debugger

We will be using the python debugger """ pdb """ for debugging our python code.

Lets start by inspecting our requests.

```python
....
...

import pdb

....
...

def get(self):
    pdb.set_trace()
    pass

```

Run ``` python server.py ``` in terminal and visit http://127.0.0.1:5000/

This gives us an interactive interface for inspecting our code.
For example, we can inspect what is coming in from a request by checking:

```python

request

request.json

request.headers

```

These shows us what in the request json, and request headers

Now, anytime you want to find out whats going on with your code, you can inspect it with pdb.


#### Useful pdb commands

Use:

- **p  object_name** to print an object.
- **c** to continue. This will cause your program to continue running normally, without pausing for debugging.

- **q** To quit debugging.
- **l** to find out where your breakpoint is in your code.
- **n** to go to the next line of execution.


## Basic flask setup
```python

from flask import Flask, request, make_response
from flask_restful import Resource, Api
from pymongo import MongoClient
from bson.objectid import ObjectId
from utils.mongo_json_encoder import JSONEncoder

# Basic Setup
# 1
app = Flask(__name__)
# 2
mongo = MongoClient('localhost', 27017)
# 3
app.db = mongo.develop_database
# 4
api = Api(app)

```

The first few lines are mostly boilerplate. First we import all the dependencies that we use throughout the rest of the file. Then we perform the following steps to set up the flask app:

We create a flask instance and assign it to the app variable
We establish a connection to our MongoDB service that's running locally
We specify a particular database (develop_database) which we'll use to store data. We assign it to app.db. Throughout the rest of server.py we'll access app.db whenever we need to communicate with the DB.
We create an instance of the flask_restful API. Later we'll add different endpoints to that API. The flask_restful library is not necessary for creating RESTful APIs, but it makes our lives a little easier by providing a specific format for defining endpoints for the different resources in our app.


## Resources

1. Read the Flask documentation: http://flask.pocoo.org/docs/0.11/
2. Get started with the Flask quickstart tutorial: http://flask.pocoo.org/docs/0.11/quickstart/

## Challenges

1. Add a new route called my_page and return some text.
2. Use Paw or Postman to perform a get request to a "/pets" routes and return a list of your favorite pets in JSON format.
3. Add a new route handler that receives POST requests to the route `/pets` with JSON data in the body and returns that JSON data unmodified in the response body. Test the `/pets` route using Paw, Curl, Postman, or another tool to make HTTP POST requests to ensure it responds correctly with the same data given in the request.

