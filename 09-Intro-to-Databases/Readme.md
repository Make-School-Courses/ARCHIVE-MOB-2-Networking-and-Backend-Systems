# Databases


## Objectives

- Model Data and learn about relationships
- Schemas 


## Vocabulary
- Entities
- Schema
- Queries
- Relational vs Non relational databases
- foriegn key


### What is a Database Management System?

You can think of it as a large collection of related data.
It is a representation of state.

Take for example we have the following entities and relationships for our trip planner API:

*Entities:*

Trips
Users


*Relationships:*

A User can have many trips.
A Trip can only belong to one User.



## ORM's and Data Models
## Why do we need to model data?

A data model is a collection of properties that describe a piece of data.

The relational representation of data is one of the most widely used models today, and hence we have Relational Databases like SQL, POSTGRESQL etc.

We also have other representations of data that are **document based** like MongoDB and graph based like **neo4j**

All these representations have pros and cons, and perform differently for different use cases.


## The Schema

A schema is a formal description of a particular piece of data.
Schemas describe the properties of an Entity, and they types of data those properties hold.

The schema of a table is the table name, its attributes, and types:
 
Eg. Entity: User
    Property: username
    Type: String

## Database Tables

Tables are generated from Schemas.

Example of what a table of Trips might look like

Trips in this example have 3 properties:

1. An id to prevent duplicates and identify a trip
2. A stops property of type "array of string(text)" that holds a list of stops in a given trip.


![Tables](tables.png)


## Database modeling



## Relationships

There are 3 main types of relationships in databases.
One-to-one -: Both tables can have only one record of each other
One-to-many -: One table holds a foriegn key 
Many-to-many -:

*Foreign key* :- This is an identifier that points to another table
Eg: 

![User Trips](user-trip-erd.png)


### What is an ORM

ORM stands for Object Relational Mapper. They create a representation of your database model in a datastructure of your language.

For python and flask we will be using **SQLAcademy**.

