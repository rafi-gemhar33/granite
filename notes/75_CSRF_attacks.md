## CSRF attacks

### Cross-site request forgery

- When browser sees the source of the image is mysite.com then browser will make a GET request to mysite.com. When a request is made to mysite.com then browser also sends the cookie. This is how cookies work. This is the important thing to understand here.

- A browser always sends cookies when browser sends request to a URL if browser has cookies for that URL.

- CSRF attack happens because browser always sends cookies to the site for which it has cookies. If an application is not using cookies then CSRF attack is not possible.
