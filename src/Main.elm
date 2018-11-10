module Main exposing (main)

import Browser
import Html exposing (..)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias StringCollection =
    { head : Maybe String
    , tail : Maybe (List String)
    , last : Maybe String
    }


type alias NumberCollection =
    { head : Maybe Int
    , tail : Maybe (List Int)
    , last : Maybe Int
    }


type alias Model =
    { colors : StringCollection
    , numbers : NumberCollection
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


numbers =
    [ 0, 1, 2, 3, 4, 5, 6 ]


getOne : List a -> Maybe a
getOne list =
    List.head list


getTail : List a -> Maybe (List a)
getTail list =
    List.tail list


getLast : List a -> Maybe a
getLast list =
    case list of
        [] ->
            Nothing

        [ head ] ->
            Just head

        head :: tail ->
            getLast tail


init =
    { colors =
        { head = getOne colors
        , tail = getTail colors
        , last = getLast colors
        }
    , numbers =
        { head = getOne numbers
        , tail = getTail numbers
        , last = getLast numbers
        }
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


renderMaybeInt : Maybe Int -> Html msg
renderMaybeInt maybe =
    let
        nodes =
            case maybe of
                Nothing ->
                    []

                Just int ->
                    [ text (String.fromInt int) ]
    in
    div [] nodes


renderCollectionHead : Maybe String -> Html msg
renderCollectionHead head =
    renderMaybeString head


renderNumberCollectionHead : Maybe Int -> Html msg
renderNumberCollectionHead head =
    renderMaybeInt head


renderCollectionLast : Maybe String -> Html msg
renderCollectionLast last =
    renderMaybeString last


renderNumberCollectionLast : Maybe Int -> Html msg
renderNumberCollectionLast last =
    renderMaybeInt last


renderListItem : String -> Html msg
renderListItem string =
    li [] [ text string ]


renderIntListItem : Int -> Html msg
renderIntListItem int =
    li [] [ text (String.fromInt int) ]


renderTail : Maybe (List String) -> Html msg
renderTail list =
    case list of
        Nothing ->
            ul [] []

        Just strings ->
            ul [] (List.map renderListItem strings)


renderNumberTail : Maybe (List Int) -> Html msg
renderNumberTail list =
    case list of
        Nothing ->
            ul [] []

        Just ints ->
            ul [] (List.map renderIntListItem ints)


renderCollectionTail : Maybe (List String) -> Html msg
renderCollectionTail tail =
    renderTail tail


renderNuberCollectionTail : Maybe (List Int) -> Html msg
renderNuberCollectionTail tail =
    renderNumberTail tail


renderCollection : StringCollection -> Html msg
renderCollection collection =
    div []
        [ renderCollectionHead collection.head
        , renderCollectionTail collection.tail
        , renderCollectionLast collection.last
        ]


renderNumberCollection : NumberCollection -> Html msg
renderNumberCollection collection =
    div []
        [ renderNumberCollectionHead collection.head
        , renderNuberCollectionTail collection.tail
        , renderNumberCollectionLast collection.last
        ]


view : Model -> Html msg
view model =
    div []
        [ renderCollection model.colors
        , renderNumberCollection model.numbers
        ]
