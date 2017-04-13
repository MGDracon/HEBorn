module Core.Models
    exposing
        ( CoreModel
        , Flags
        , initialModel
        )

import Requests.Models
import Router.Router exposing (Route)
import Game.Models
import OS.Models
import Apps.Models
import Landing.Models
import Phoenix
import Phoenix.Socket as Socket
import Core.Messages exposing (CoreMsg)
import Driver.Websocket.Models


socket =
    Socket.init "ws://localhost:4000/websocket"


type alias CoreModel =
    { route : Route
    , requests : Requests.Models.Model
    , game : Game.Models.GameModel
    , os : OS.Models.Model
    , apps : Apps.Models.AppModel
    , landing : Landing.Models.LandModel
    , websocket : Driver.Websocket.Models.Model
    }


type alias Flags =
    { seed : Int
    }


initialModel : Router.Router.Route -> Int -> CoreModel
initialModel route seedInt =
    { route = route
    , requests = Requests.Models.initialModel seedInt
    , game = Game.Models.initialModel
    , os = OS.Models.initialModel
    , apps = Apps.Models.initialModel
    , landing = Landing.Models.initialModel
    , websocket = Driver.Websocket.Models.initialModel
    }
