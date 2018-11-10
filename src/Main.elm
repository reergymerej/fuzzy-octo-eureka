module Main exposing (main)

import Browser
import Html exposing (..)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type Person
    = Male
    | Female


type alias Model =
    { one : Person
    , two : Person
    }


init =
    { one = Male
    , two = Female
    }


update : msg -> Model -> Model
update msg model =
    model


toHtml : Person -> Html msg
toHtml person =
    case person of
        Male ->
            div [] [ text "a dude" ]

        Female ->
            div [] [ text "a dudette" ]


view : Model -> Html msg
view model =
    div []
        [ toHtml model.one
        , toHtml model.two
        ]
