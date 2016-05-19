# 07-clojurescript-overwrite-default-resource

## Prerequisites
- java
- boot (brew install boot-clj)

### Change main.js in index.html to js/main.js

### Create html/js directory

### Create html/js/main.cljs.edn file

### Edit main.cljs.edn
```
{:require [modern-cljs.core]
 :compiler-options {:asset-path "js/main.out"}}
```

### Run boot dev
