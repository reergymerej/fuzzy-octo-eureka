module Main exposing (main)

import Browser
import Html exposing (..)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias StringThings =
    List String


type alias IntThings =
    List Int


type Person
    = Male StringThings
    | Female IntThings


type alias Model =
    { one : Person
    , two : Person
    }


init =
    { one = Male [ "a", "b", "c" ]
    , two = Female [ 1, 2, 3 ]
    }


update : msg -> Model -> Model
update msg model =
    model


stringToListItem : String -> Html msg
stringToListItem value =
    li [] [ text value ]


intToListItem : Int -> Html msg
intToListItem value =
    li [] [ text (String.fromInt value) ]


stringListToHtml : List String -> Html msg
stringListToHtml list =
    ul [] (List.map stringToListItem list)


intListToHtml : List Int -> Html msg
intListToHtml list =
    ul [] (List.map intToListItem list)


toHtml : Person -> Html msg
toHtml person =
    case person of
        Male things ->
            div []
                [ div [] [ text "a dude" ]
                , stringListToHtml things
                ]

        Female things ->
            div []
                [ div [] [ text "a dudette" ]
                , intListToHtml things
                ]


view : Model -> Html msg
view model =
    div []
        [ toHtml model.one
        , toHtml model.two
        ]
