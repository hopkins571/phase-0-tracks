# HTTP status codes
Broken into categories depending on the first digit:
* **1xx: informational**
	* 100 continue
	* 101 switching protocols
* **2xx: success**
    * 200 ok
	* 201 created (request fulfilled, resource completed)
	* 202 accepted  (request accepted, but not completed)
* **3xx: redirection**
	* 300 multiple choices (different options available, e.g. different formats)
	* 301 moved permanently
	* 303 see other (points to other uri where resource can be found)
	* 305 use proxy (can only be accessed through proxy)
	* 307 temporary redirect
	* 308 permanent redirect
* **4xx: client error**
	* 400 bad request
	* 401 unauthorized
	* 403 forbidden
	* 404 not found
	* 405 method not allowed
	* 408 timeout
	* 410 gone
	* 415 unsupported media type
	* 421 misdirected request
	* 429 too many requests
	* 451 unavailable due to legal reasons
* **5xx: server error**
	* 500 generic internal server error
	* 501 not implemented (server lacks ability to fulfill request)
	* 503 service unavailable (temporary)
	* 504 gateway timeout

A **GET** request is used to request data from the server. A **POST** request is used to submit data to the server.

**Cookies** are pieces of data sent in HTTP headers that are meant to store useful session information or track users' browsing history.