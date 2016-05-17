# 05-clojurescript-livereload

## Prerequisites
- java
- boot (brew install boot-clj)

### Add boot-http dependency
```
[pandeiro/boot-http "0.7.0"] ;; add http dependency
```

### require
```
'[pandeiro.boot-http :refer [serve]] ;; make serve task visible
```

### Serve and Compile
```
boot wait serve -d target cljs target -d target
```

### Watch and Recompile
```
boot serve -d target watch cljs target -d target
```

### Livereload
```
boot serve -d target watch reload cljs target -d target
```

### Run defined task on build.boot
```
boot dev
```
