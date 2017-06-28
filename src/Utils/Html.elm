module Utils.Html exposing (..)

import Html exposing (Attribute)
import Html.Events exposing (on, keyCode, targetValue)
import Json.Decode as Json


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown handler =
    on "keydown" <| Json.map handler keyCode


onChange : (String -> msg) -> Attribute msg
onChange handler =
    on "change" <| Json.map handler targetValue