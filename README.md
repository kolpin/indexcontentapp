#Index the content

The application home page contains two tabs:

**Parse link** and **Already indexed links**

##Parse link

In the field "Url for index" enter the link to the resource on the Internet: http://example.com/page.html (Supports only http links to https requires a certificate.)

Click on the "Index" button and wait for indexing pages.

In case of an error message is displayed.

https://monosnap.com/file/H0VvNskOYqLdYuwg8VyfPprkDJX8E6

In case of successful indexing displays the headers, url and page content

https://monosnap.com/file/UwQ9IyDFFIbsjpzKjXkn8MyOxLNTIB


####Rest API Endpoint

/rest/index?url=http://example.com/page.html

##Already indexed links 
Indexed page is stored in the database, their references can be viewed by clicking on the button "get links"

http://take.ms/6aQR0

####Rest API Endpoint

/rest/list