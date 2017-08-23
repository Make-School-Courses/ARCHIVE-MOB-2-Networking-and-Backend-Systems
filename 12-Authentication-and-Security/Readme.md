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

https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication

## Signing up a user

To sign up a user, we need to store their password in the database. But we should never store passwords in plain text! Instead we are going to hash the password and store the hash in the database instead

## Hashing passwords with BCrypt

```python
...

app.bcrypt_rounds = 12


hashed = bcrypt.hashpw(
    encodedPassword, bcrypt.gensalt(app.bcrypt_rounds)
)
                
```


### Signing in a user

To authenticate a user, we need to find out if hash of the the password they pass in matches the hashed password in the database.

```python
...


# Find user by email 
user = user_collection.find_one({'email': email})

if bcrypt.hashpw(jsonPassword, user['password']) == user['password']:
    ## Do something
else:
    ## Do something
                         
```


## Decorator Pattern in Python

> A decorator is the name used for a software design pattern. Decorators dynamically alter the functionality of a function, method, or class without having to directly use subclasses or change the source code of the function being decorated. - Python docs


Python documentation on decorators:

https://wiki.python.org/moin/PythonDecorators

## Authorization

Authorization is the process of verifying that someone has access to a resource. It is the process of defining scope of permission.

We won't specifically be implementing authorization in this class but its something to keep in mind if you have resources that need a protected scope. eg. Normal users vs admin users.



