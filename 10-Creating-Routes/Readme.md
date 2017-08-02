# Creating Routes

## Objectives

- Create restful routes
- Examine HTTP methods and status codes
- Understand request and response


## REST

We are going to be following REST standards building this API.



## HTTP Methods



| Action  	| HTTP Verb 	| Path             	| Effect                           	|
|---------	|-----------	|------------------	|----------------------------------	|
| create  	| POST      	| /trips           	| Creates a new trip               	|
| index   	| GET       	| /trips           	| Shows/lists all trips            	|
| show    	| GET       	| /trips/<trip_id> 	| Shows a specific trip            	|
| update  	| PUT/PATCH 	| /trips/<trip_id> 	| Updates/replaces a specific trip 	|
| destroy 	| DELETE    	| /trips/<trip_id> 	| Deletes a specific trip          	|