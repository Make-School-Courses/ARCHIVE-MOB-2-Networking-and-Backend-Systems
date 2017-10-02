# Databases


## Objectives

- Setup mongodb
- Store data in your database
- Perform queries on your database

## Database Setup

### Installing & Running MongoDB

Another prerequisite besides python 3 is MongoDB. Whenever the flask server is running, you need to run a MongoDB instance as well. Otherwise the server won't be able to access the DB and will throw an exception.

You can test if MongoDB is installed by starting an instance of the DB with the following terminal command:

```mongod```

Upon successful start you should see the following message:

[initandlisten] waiting for connections on port 27017


Now your database is running and waiting for connections! Keep mongod running in the current terminal tab and open a new tab (CMD + T) in which you'll enter the terminal commands of the following steps. This will keep the database running which is required for your flask server to work.

If the command isn't recognized, you need to install MongoDB via homebrew:

```
brew update

brew install mongodb
```

Once the install completes you need to start the DB with this command:

```mongod```

mongod may notice that you have not specified a database directory. By default it uses /data/db. Because this folder may be missing, mongod may output the following error when run: 

Data directory /data/db not found., terminating


If this happens, create a database location for your user using the following command:

```sudo mkdir -p /data/db```

then change the ownership of the file as following:

```
sudo chown -R $USER /data/db
```

Now you should be able to run mongod.


*Note*

mongod has to be running before you can connect to your database.


### Download MongoDB Compass app

Download MongoDb Compass app:

https://www.mongodb.com/download-center?jmp=docs&_#compass


## Types of Databases

- Relational eg mySQL, postgres
- Non-relational / Document  based eg. mongodb
- Graph - neo4j

## ODM

Pymongo is an Object Document Mapper that makes interacting with our mongo database easier.

To use pymongo in your flask app, you have to import it:

```python
from pymongo import MongoClient
```

also setup pymongo and connect your database to your flask app:

```python
mongo = MongoClient('localhost', 27017)
app.db = mongo.local
```

*Note*

The database (local) matches the database we create in mongo

We access our database using attribute style access (mongo.local)
We can also use dictionary style access if you have weird characters in your database name
db = mongo['test-database']


### Documents

In mongo a single object or entry to our database is referred to as a document.

eg. a document representing a single user we create in our database.

## Collections

Collections are a group of related documents.

eg. a collection representing all the users we have in our database.


### Fetching documents from a collection aka Querying

Read the mongodb docs for fetching a single document:

[Fetching documents](http://api.mongodb.com/python/current/tutorial.html#getting-a-single-document-with-find-one)

## Schema

Document based databases are schemaless, that means they don't enforce strict rules on what kind of data should be in a document/collection

You can put in a user collection these two documents:

1.
{
 'user': 'Eliel',
 'location': [-121, 122]
}

2.
{
'user': 'John',
'location': 'San Francisco'
}


### Creating/inserting a document into a collection

[Mongodb inserting a document](http://api.mongodb.com/python/current/tutorial.html#inserting-a-document)


## Using Mongodb Compass

We will use the mongodb compass app to create our first mongo database and collection.


1. First we have to connect to mongodb. Make sure you are running mongod in terminal!
![0](0.png)


2. Create a new database by clicking then "create database" button
![1](1.png)


3. Name your database "local" and create a "users" collection
![3](3.png)


4. You should see your newly created database listed 
![4](4.png)


5. Click on your databas "local", you should see your users collection 
![5](5.png)


6. Click on "insert document" button to insert a document in the users collection
![6](6.png)


7. Add a "name" and "location" property with values
![7](7.png)


8. Insert a few documents
![8](8.png)



## Resources

[Pymongo Docs](http://api.mongodb.com/python/current/tutorial.html)



## Challenges

1. 
    a. Use the Mongod Compass app to create a database called local, and a collection called users.
    b. Create 2-5 user documents in your collection with the following properties:

    - name - string
    - age - number
    - location - string

2.

    a. Create another collection called *courses* with the following or more properties:

    - name - string
    - number - number
    - students - an array of students

    b. Create 2-5 course documents


3.

a. Import pymongo into a flask project. Setup your mongo database and add it to your flask app.

b. Create a 'courses' route that handles a post request to create a course

c. Make sure that before the course is inserted into our database, it has these two properties of a course:

- name - string
- number - number

d. Test your post route with a post request in Paw/postman/curl

e. Handle a get request to "courses" that looks for a course number from the url parameter, returns a 400 error if the course number parameter doesn't exit, and uses the course number to search our database courses collection for a document with the specified course number. Return a 200 and the course if its found.

e. Handle a get request to "courses" route that fetches and returns to the user all the courses in the database.

f. Create another route called "count_courses" that returns the number of course documents in our database.


*Hint* Remember to get your collection then perform actions on it.




