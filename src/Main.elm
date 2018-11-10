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
    , last : Maybe String
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


getTail : List String -> Maybe (List String)
getTail strings =
    List.tail strings


getLast : List String -> Maybe String
getLast strings =
    Just "xxx"


init =
    { head = getOne colors
    , tail = getTail colors
    , last = getLast colors
    }


update : msg -> Model -> Model
update msg model =
    model


renderMaybeString : Maybe String -> Html msg
renderMaybeString maybe =
    let
        nodes =
            case maybe of
                Nothing ->
                    []

                Just string ->
                    [ text string ]
    in
    div [] nodes


renderListItem : String -> Html msg
renderListItem string =
    li [] [ text string ]


renderTail : Maybe (List String) -> Html msg
renderTail list =
    case list of
        Nothing ->
            ul [] []

        Just strings ->
            ul [] (List.map renderListItem strings)


view : Model -> Html msg
view model =
    div []
        [ renderMaybeString model.head
        , renderTail model.tail
        , renderMaybeString model.last
        ]
