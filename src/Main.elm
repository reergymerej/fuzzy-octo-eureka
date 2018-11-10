module Main exposing (main)

import Browser
import Html exposing (..)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { string : String
    , int : Int
    }


init =
    { string = "Hello"
    , int = 999
    }


update : msg -> Model -> Model
update msg model =
    model


renderString : String -> Html msg
renderString string =
    div [] [ text string ]


view : Model -> Html msg
view model =
    div []
        [ renderString model.string
        , renderString (String.fromInt model.int)
        ]
