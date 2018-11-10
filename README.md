# fuzzy-octo-eureka

Let's play with types.



type Msg
    = Change String

defines a type named Changed that has associated data String.  It also secretly
creates a constructor for this type of Msg.

Change : String -> Msg

That's why, `onInput` can do
```
input [ onInput Change ] []
```

https://package.elm-lang.org/packages/elm/html/latest/Html-Events#onInput

onInput : (String -> msg) -> Attribute msg
          |     this    |

matches
Change : String -> Msg
         |   this    |

created by
type Msg
    = Change String


## install
```
yarn
```


## start
```
yarn start
# open http://localhost:8000/src/Main.elm
```
