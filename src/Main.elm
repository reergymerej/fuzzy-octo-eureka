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
    { head : Maybe String
    , tail : Maybe (List String)
    }


colors =
    [ "red"
    , "orange"
    , "yellow"
    , "green"
    , "blue"
    , "indigo"
    , "violet"
    ]


getOne : List String -> Maybe String
getOne strings =
    List.head strings


getLast : List String -> Maybe (List String)
getLast strings =
    List.tail strings


init =
    { head = getOne colors
    , tail = Nothing
    }


update : msg -> Model -> Model
update msg model =
    model


renderHead : Maybe String -> Html msg
renderHead head =
    let
        nodes =
            case head of
                Nothing ->
                    []

                Just x ->
                    [ text x ]
    in
    div [] nodes


view : Model -> Html msg
view model =
    div []
        [ renderHead model.head
        ]
