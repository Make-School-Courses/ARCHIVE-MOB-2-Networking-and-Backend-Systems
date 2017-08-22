# Project - Product Hunt API

A client wants to build a simple wrapper around Product Hunt using the PH API. The first feature the client wants you to implement is a feed that displays all of today's featured products. The client wants to keep the project lean and asks you explicitly not to use any dependencies or third party libraries.

## Spec

1. Create your URL in a composable manner so the client can easily add more features reusing base URL and/or adding more parameters to existing URLs.

2. Add unit tests verifying the scheme, host, path, base URL, query of the URL.

3. Make a networking request to fetch all of the products featured today on PH.

4. Convert the data returned into models.

5. Display the data returned in a feed that shows each product's name, tagline, number of votes, and thumbnail.

6. If a user clicks on a post, show a new screen with all the comments for that post, sorted in descending order.

7. After you've completed steps 1-6, go back and refactor your code so that you're constructing URL requests with an enum.

**Resources:**
https://api.producthunt.com/v1/docs/

You will need to sign up for Product Hunt, register an application, and generate a token.

Example:

Name: PHAPIExampleApp

Redirect URI: http://localhost:3000/users/auth/producthunt/callback
