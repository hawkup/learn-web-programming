# 16-write-elm-project-side-effects-random

## Prerequisites
- Elm 0.17 (npm install -g elm)

## The Elm Architecture + Effects
All of these effects are built on two important concepts:
- Commands -- A command is a way of demanding some effect.
- Subscriptions -- A subscribtion lets you register that you are interested in something.

## Extending the Architecture Skeleton
```
type alias Model =
{ ...
}

type Msg = Submit | ...

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  ...

view : Model -> Html Msg
view model =
  ...

subscriptions : Model -> Sub Msg
subscriptions model =
  ...

init : (Model, Cmd Msg)
init =
  ...
```

## Writing the code
- When write code with effects. Break it into two phases
Phase one is about show on screen.
* set model
* view
* set init update and simple message
* init value

Phase two filling the details.
* add new message
* add new update
