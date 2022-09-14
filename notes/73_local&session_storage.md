<!-- Developer tools > Application > Local Storage. -->

### Local storage
- localStorage provides at least 5MB of data storage
```js
localStorage.setItem("favoriteColor", "black");
localStorage.favoriteColor;
localStorage.removeItem("favoriteColor");
```

### Session storage
- Closing a tab/window ends the session

```js
// Save data to sessionStorage
sessionStorage.setItem("key", "value");
// Get saved data from sessionStorage
let data = sessionStorage.getItem("key");

// Remove saved data from sessionStorage
sessionStorage.removeItem("key");

// Remove all saved data from sessionStorage
sessionStorage.clear();
```
