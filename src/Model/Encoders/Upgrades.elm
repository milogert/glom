module Model.Encoders.Upgrades exposing (upgradeEncoder)

import Json.Encode exposing (..)
import Model.Encoders.Weapons exposing (specialEncoder)
import Model.Upgrades exposing (Upgrade)


upgradeEncoder : Upgrade -> Value
upgradeEncoder u =
    object 
        [ ("name", string u.name)
        , ("slots", int u.slots)
        , ("spcials", list <| List.map specialEncoder u.specials)
        , ("cost", int u.cost)
        , ("id", int u.id)
        ]


