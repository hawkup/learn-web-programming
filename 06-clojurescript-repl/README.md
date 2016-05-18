# 06-clojurescript-repl

## Prerequisites
- java
- boot (brew install boot-clj)

### Add boot-cljs-repl dependency and make it visible
```
;; dependencies
[adzerk/boot-cljs-repl "0.3.0"]
;; require
'[adzerk.boot-cljs-repl :refer [cljs-repl start-repl]]
```

### Add Clojure and Clojurescirpt
```
;; dependencies
[org.clojure/clojure "1.7.0"]
[org.clojure/clojurescript "1.7.170"]
```

### Add dependencies required by bREPL
```
;; dependencies
[com.cemerick/piggieback "0.2.1"]
[weasel "0.7.0"]
[org.clojure/tools.nrepl "0.2.12"]
```

### Boot and start nREPL server
```
boot serve -d target watch reload cljs-repl cljs target -d target
```

### Open REPL
```
;; open terminal on the same path
boot repl -c
;; when REPL opened
;; boot.user =>
;; run command to connect browser
boot.user => (start-repl)
;; and then open browser to localhost:3000 or another port that you serve project
;; you can evaluate CLJS forms from the bREPL
;; cljs.user =>
```

### Test
```
cljs.user => (js/alert "Hello, ClojureScript")
```

### Add cljs-repl to dev task
```
(cljs-repl) ;; before cljs task
```
