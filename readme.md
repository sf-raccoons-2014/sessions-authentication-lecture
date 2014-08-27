##  Sessions

* HTTP is a stateless protocol
* We have to create something that can allow us to preserve some sort of state information.
* The session datum is stored in a cookie which is a small piece of data sent from a website and stored in a user's web browser while the user is browsing that website. Every time the user loads the website, the browser sends the cookie back to the server to notify the website of the user's previous activity
* The session id is a 32 byte long MD5 hash value. To date MD5 is uncompromised, but there have been collisions, so it is theoretically possible to create another input text with the same hash value.  But this has had no security impact to date.


