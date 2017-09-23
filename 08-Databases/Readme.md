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


### Download MongoDB Compass app

Download MongoDb Compass app:

https://www.mongodb.com/download-center?jmp=docs&_#compass


## Types of Databases

- Relational
- Non-relational / Document  based
- Graph

## ODM

Pymongo is an Object Document Mapper that makes interacting with our mongo database easier.


## Collections

### Documents

### Fetching documents from a collection

### Creating/inserting a document into a collections

