# Creating Routes


## Objectives

- Create restful routes
- Examine HTTP methods and status codes
- Understand request and response


## REST & Resourceful Routing

We are going to be following REST standards building this API.
With REST every resource in your application maps out to a route that can be accessed.
Think **User** resource with user routes, trips resource with routes for trips


## Route types
### Nested Routes

When you have a collection of related resources as we do with users and trips, sometimes you want to nest one resource into another.

| Action  	| HTTP Verb 	| Path             	| Effect                           	        |
|---------	|-----------	|------------------	|-------------------------------------------|
| create  	| POST      	| /user/trips           	| Creates a new trip               	|
| index   	| GET       	| /user/trips           	| Shows/lists all trips            	|
| show    	| GET       	| /user/trips/<trip_id> 	| Shows a specific trip            	|
| update  	| PUT/PATCH 	| /user/trips/<trip_id> 	| Updates/replaces a specific trip 	|
| destroy 	| DELETE    	| /user/trips/<trip_id> 	| Deletes a specific trip          	|


## Adding RESTful routes in Flask

To attach a route to a resource in Flask, you use the ```add_resource(<Resource>, <Route>) ``` method.

Eg.

api.add_resource(User, '/user/')


## HTTP Status Codes and Responses

Full list of HTTP status codes:

http://www.restapitutorial.com/httpstatuscodes.html


## Challenges

1. Create a user route, validate that the parameters sent to the route has a username, email and password in the json payload sent to the server. Send back 200 when parameters match, 400 (Bad request) if parameters don't match


