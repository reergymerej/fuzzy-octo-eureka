module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (onInput)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type Person
    = Male (List String)
    | Female (List Int)


type alias Model =
    { one : Person
    , two : Person
    , text : String
    }


init =
    { one = Male [ "a", "b", "c" ]
    , two = Female [ 1, 2, 3 ]
    , text = ""
    }



-- This quietly creates a function Change : String -> Msg.


type Msg
    = Change String


getMessageToEmit : String -> Msg
getMessageToEmit string =
    Change ("foo" ++ string)


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change string ->
            { model | text = string }


stringToListItem : String -> Html msg
stringToListItem value =
    li [] [ text value ]


intToListItem : Int -> Html msg
intToListItem value =
    li [] [ text (String.fromInt value) ]


listToHtml : (a -> Html msg) -> List a -> Html msg
listToHtml transformer list =
    ul [] (List.map transformer list)


toHtml : Person -> Html msg
toHtml person =
    case person of
        Male things ->
            div []
                [ div [] [ text "a dude" ]
                , listToHtml stringToListItem things
                ]

        Female things ->
            div []
                [ div [] [ text "a dudette" ]
                , listToHtml intToListItem things
                ]


view : Model -> Html Msg
view model =
    div []
        [ toHtml model.one
        , toHtml model.two
        , input [ onInput getMessageToEmit ] []
        , div [] [ text model.text ]
        ]
