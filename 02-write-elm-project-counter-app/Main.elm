import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = Int

model : Model
model =
  0

-- UPDATE
type Msg =
  Increase |
  Decrease

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increase ->
      model + 1

    Decrease ->
      model - 1

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Increase ] [ text "+"]
    , div [] [ text (toString model)]
    , button [ onClick Decrease ] [ text "-"]
    ]
