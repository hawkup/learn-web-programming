# 01-write-simple-elm-project

## Prerequisites
- Elm 0.17 (npm install -g elm)

### Starting a new project
```
elm package install
# This command will create elm-package.json and ask you to install elm-lang/core
```

### Install elm-lang/html library
```
elm-package install elm-lang/html
```

### Compile elm to html
```
elm-make Hello.elm --output=index.html
```
