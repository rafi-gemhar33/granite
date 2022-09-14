- Cookies can store only 4 KB of data.
- Cookies can be set, changed or removed by both server and the client.

```js
document.cookie = "username=john; expires=Mon, 26 Mar 2021 17:04:05 UTC";
document.cookie = "username=john; max-age=31536000"; //expires in 1 year


document.cookie = "foo=bar; Secure;"; // only sent over https

document.cookie = "username=john; HttpOnly";// cant be accessed bu js

document.cookie = "username=john; HttpOnly; SameSite=strict"; // SameSite=Lax.

```
