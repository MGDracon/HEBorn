module Setup.Pages.PickLocation.Requests exposing (..)

import Requests.Types exposing (ConfigSource)
import Game.Servers.Shared as Servers
import Game.Servers.Settings.Check as Check
import Game.Servers.Settings.Set as Set
import Game.Servers.Settings.Types exposing (..)
import Setup.Pages.PickLocation.Config exposing (..)
import Setup.Pages.PickLocation.Messages exposing (..)


type Response
    = Check Check.Response
    | Set Set.Response


checkRequest :
    Config msg
    -> Settings
    -> Servers.CId
    -> ConfigSource a
    -> Cmd msg
checkRequest { toMsg } =
    Check.request (CheckRequest >> Request >> toMsg)


setRequest : Config msg -> Settings -> Servers.CId -> ConfigSource a -> Cmd msg
setRequest { toMsg } =
    Set.request (SetRequest >> Request >> toMsg)


receive : RequestMsg -> Maybe Response
receive response =
    case response of
        CheckRequest ( code, data ) ->
            data
                |> Check.receive code
                |> Maybe.map Check

        SetRequest ( code, data ) ->
            data
                |> Set.receive code
                |> Maybe.map Set