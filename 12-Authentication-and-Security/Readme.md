# Authentication and Security

## Objectives

- Learn about password hashing
- Integrate login to your API
- Learn about different ways provisioning authentication in your web app
- Learn the difference between authentication and authorization

## Vocabulary

- Authentication
- Authorization
- Tokens
- Hashing
- Salt


## Authentication

Before we allow a user to access their account, we need a way to ensure that the user has permission to access their account.

1. We need to provide them with a way to provide credentials describing who they are(login)
2. Give them access to their resources, but

## Authentication Options

- JSON Web Tokens
- HTTP Basic Auth
- OAuth
- Authentication Tokens


## HTTP Basic Auth

We talked about headers and how they carry extra information about a request. Headers are used to carry authentication information for a request. 
We will use headers (Authenticaiton headers) to pass authentication information from a client(iOS, paw) to our server.

HTTP Basic Auth:

https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication

## General account creation and login 

1. The user makes a request to create an account.
2. Their password is hashed and stored in the database. At no point is the plain-text (unencrypted) password ever written to the hard drive.
3. When the user attempts to login, the hash of the password they entered from the request is checked against the hash of their real password (retrieved from the database).
4. If the hashes match, the user is granted access. If not, the user is told they entered invalid login credentials.
5. Steps 3 and 4 repeat every time someone tries to login to their account.

*Note*: Do not let the user know if they username or password was invalid. If they can narrow it down to just passwords or username, they can keep guessing till they figure it out.

## #1 Signing up a user

To sign up a user, we need to store their password in the database. But we should never store passwords in plain text! Instead we are going to hash the password and store the hash in the database instead

## #2 Hashing passwords with BCrypt

We will be using the BCrypt library to hash our passwords.
Link to brcypt library and docs: https://pypi.python.org/pypi/bcrypt/3.1.0

Hashing refers to the process of passing our plain text password to a hashing algorithm. Hashing algorithms are one way functions that turn our plain text passwords into a fixed lenght string that cannot be reversed.
If the input of the hash function is changed in any way, the output changes.

We generally store the hashed version of our passwords in the database. When we login a user,
we check the hashed password in our database and compare it with the login password sent from a client to verify that they are the same.



### Salt

Salt is added to the hash function to make it harder for hash collisions and brute force attacks.


### Hashing passwords in python and flask
The salt for our hash function is referred to as the bcrypt_rounds. This makes it harder to guess the password, but takes longer for bcrypt to hash the password.


#### Test hashing passwords 

Use this link to test hashing passwords online:

[Test password hashing online](https://www.dailycred.com/article/bcrypt-calculator)


*Hashing passwords in python:*

```python
...

app.bcrypt_rounds = 12

# Convert password to utf-8 string
encodedPassword = password.encode('utf-8')

hashed = bcrypt.hashpw(
    encodedPassword, bcrypt.gensalt(app.bcrypt_rounds)
)
                
```


## #3 Login(Sign in) in a user

To authenticate a user, we need to find out if hash of the the password they pass in matches the hashed password in the database.

```python
...


# Find user by email 
database_user = user_collection.find_one({'email': email})

# Check if client password from login matches database password
if bcrypt.hashpw(jsonPassword, database_user['password']) == database_user['password']:
    ## Let them in
else:
    ## Tell user they have invalid credentials
                         
```


## Decorator Pattern in Python

> A decorator is the name used for a software design pattern. Decorators dynamically alter the functionality of a function, method, or class without having to directly use subclasses or change the source code of the function being decorated. - Python docs


Python documentation on decorators:

https://wiki.python.org/moin/PythonDecorators

## Authorization

Authorization is the process of verifying that someone has access to a resource. It is the process of defining scope of permission.

We won't specifically be implementing authorization in this class but its something to keep in mind if you have resources that need a protected scope. eg. Normal users vs admin users.



