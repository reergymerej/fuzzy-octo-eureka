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
    Maybe String


colors =
    [ "red"
    , "orange"
    , "yellow"
    , "green"
    , "blue"
    , "indigo"
    , "violet"
    ]


init =
    List.head colors


update : msg -> Model -> Model
update msg model =
    model


view : Model -> Html msg
view model =
    let
        nodes =
            case model of
                Nothing ->
                    []

                Just x ->
                    [ text x ]
    in
    div [] nodes
