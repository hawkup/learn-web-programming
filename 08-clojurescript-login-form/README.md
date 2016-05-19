# 08-clojurescript-login-form

## Prerequisites
- java
- boot (brew install boot-clj)

### Create css and css/styles.css

### Create new login.cljs
```
src/cljs/modern_cljs/login.cljs
```

### Add require login.cljs to main.cljs.edn
```
{:require [modern-cljs.core modern-cljs.login]
 :compiler-options {:asset-path "js/main.out"}}
```
