FORMAT: v1

# Consulter

Consulter is a simple API that creates meeting appointment(s) with a consultant from the available dates and time.

## Allowed HTTPs requests:

<strong>PUT </strong>    : To create resource <br>
<strong>POST</strong>    : Update resource<br>
<strong>GET</strong>     : Get a resource or list of resources<br>
<strong>DELETE</strong>  : To delete resource<br>

## Description Of Usual Server Responses:

<ul>
<li>200 OK - the request was successful (some API calls may return 201 instead).</li>
<li>201 Created - the request was successful and a resource was created.</li>
<li>204 No Content - the request was successful but there is no representation to return (i.e. the response is empty).</li>
<li>400 Bad Request - the request could not be understood or was missing required parameters.</li>
<li>401 Unauthorized - authentication failed or user doesn't have permissions for requested operation.</li>
<li>403 Forbidden - access denied.</li>
<li>404 Not Found - resource was not found.</li>
<li>405 Method Not Allowed - requested method is not supported for resource.</li>
</ul>

## Get Started

1. To get started using this API, you need an API Key

2. To get the Key, you need to sign up using any REST Client application eg. Postman. This documentation focuses on 
using Postman. If you don't have Postman installed, then you can download it from this link: <a href="https://www.postman.com/downloads/">Postman</a>

3. Once you download Postman and have it installed on your system, Open it up. Once open, you will see a link called
'Create a request'. (see the image below)

![screenshot](./app/docs/open.png)

4. It will open a new tab to the right, now there are several steps to take as described from the image below:

![screenshot](./app/docs/data.png)

Follow the numbers: 
 <ol start="1">
 <li>Click the down arrow and select POST</li>
 <li>Enter this URL: http://localhost:3000/api/v1/auth/signup</li>
 <li>Make sure you choose 'Body'</li>
 <li>Select JSON as your type</li>
 <li>Choose 'raw'</li>
 <li> Copy this code below and enter on the area numbered 6, and change the details to your own
 
    {
      "user": {
          "email": "emmanuel@emmanuel.com",
          "username": "ejoka",
          "password": "tanzania"
      }
    }
</li>

 </ol>

...and once that is done, you will be signed up.

5. To sign in, you simply follow almost similar steps as signing up but change the following below:

<ul>
<li>Where you entered the signup link, change it to this one http://localhost:3000/api/v1/auth/signin</li>
<li>On number 6 where you entered your sign up details, now enter this code:
      {
          "auth": {
              "email": "emmanuel@yahoo.com",
              "password": "tanzania"
          }
      }

  ...and just change the details to the one you used during sign up
</li>
<li>Once done click the blue button that says 'send'</li>
<li>It will authenticate you and give you a token key. Copy that Key and move to the next step</li>
</ul>

# Actions

To perform CRUD operations on your meetings, you have to sign in and start creating your data. This is how you do it:

## Getting All Your Meetings

![screenshot](./app/docs/signin.png)

From the Image:

<ol start="1">
<li>Change this place and choose a GET Action</li>
<li>Change the link to: http://localhost:3000/api/v1/meetings</li>
<li>Choose 'Authorization' as you need to be authorized first by using the token Key that you copied</li>
<li>Choose 'Bearer Token'</li>
<li>On your right you will see a place written as Token, to its right paste the Key that you copied</li>
<li>Then click send button at the top, and down below you will see and empy array sign. If you did it correctly, you will see that and its empty as there is no meetings created yet.</li>
</ol>
