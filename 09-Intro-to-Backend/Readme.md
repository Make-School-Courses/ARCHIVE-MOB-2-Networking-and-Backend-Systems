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

Run ```virtualenv venv``` to setup our virtual environment.

Activate your virtual environment with:

```source venv/bin/activate```

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

Before we are able to store anything in our postgres database, we need to create it first.
The SQLAcademy library will help us connect to your database and execute queries, perform migrations etc.

The psycopg2 library helps us connect directly to the database, the SQLAcademy library wraps the psycopg2 library to provide us with a better interface.

![Postgres](pg-overview.png)

Install postgres with:

```brew install postgres```

## Creating our database



## Migrations



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


## Resources

1. Read the Flask documentation: http://flask.pocoo.org/docs/0.11/
2. Get started with the Flask quickstart tutorial: http://flask.pocoo.org/docs/0.11/quickstart/

## Challenges

1. Add a new route called my_page and return some text.
2. Use Paw or Postman to perform a get request to a "/pets" routes and return a list of your favorite pets
3. Add a new route handler that receives POST requests to the route `/pets` with JSON data in the body and returns that JSON data unmodified in the response body. Test the `/pets` route using Paw, Curl, Postman, or another tool to make HTTP POST requests to ensure it responds correctly with the same data given in the request.

