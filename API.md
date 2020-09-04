FORMAT: v1

# Consulter

Consulter is a simple API that makes a meeting appointment with a consultant from the available dates and time.

## Allowed HTTPs requests:

PUT     : To create resource 
POST    : Update resource
GET     : Get a resource or list of resources
DELETE  : To delete resource

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

