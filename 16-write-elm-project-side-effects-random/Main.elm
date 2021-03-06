import Html exposing (Html, button, h1, text, div)
import Html.App as Html
import Html.Events exposing (onClick)
import Random

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL
type alias Model =
  { dieFace: Int
  }

init : (Model, Cmd Msg)
init =
  (Model 1, Cmd.none)

-- UPDATE
type Msg
  = Roll
  | NewFace Int

-- Random.generate : (a -> msg) -> Random.Generator a -> Cmd msg
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFace (Random.int 1 6))

    NewFace newFace ->
      (Model newFace, Cmd.none)

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (toString model.dieFace) ]
    , button [ onClick Roll ] [ text "Roll" ]
    ]
