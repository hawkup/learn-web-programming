import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String

main =
  Html.beginnerProgram
    { model = model
    , update = update
    , view = view
    }

-- MODEL

type alias Model =
  { firstname : String
  , lastname : String
  , address : String
  , phone : String
  }

model : Model
model =
  Model "" "" "" ""

-- UPDATE

type Msg
  = FirstName String
  | LastName String
  | Address String
  | Phone String

update : Msg -> Model -> Model
update msg model =
  case msg of
    FirstName firstname ->
      { model | firstname = firstname }

    LastName lastname ->
      { model | lastname = lastname }

    Address address ->
      { model | address = address }

    Phone phone ->
      { model | phone = phone }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ type' "text", placeholder "First name", onInput FirstName ] []
    , input [ type' "text", placeholder "Last name", onInput LastName ] []
    , input [ type' "text", placeholder "Address", onInput Address ] []
    , input [ type' "text", placeholder "Phone", onInput Phone] []
    , viewValidation model
    ]

viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if String.isEmpty model.firstname == True then
        ("red", "Please fill First name")
      else if String.isEmpty model.lastname == True then
        ("red", "Please fill Last name")
      else if String.isEmpty model.address == True then
        ("red", "Please fill Address")
      else if String.isEmpty model.phone == True then
        ("red", "Please fill Phone")
      else
        ("green", "OK")
  in
    div [ style [("color", color)] ] [ text message ]
