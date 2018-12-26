module View.Dashboard exposing (view)

import Bootstrap.Button as Button
import Bootstrap.Card as Card
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Dict exposing (Dict)
import Html exposing (Html, text)
import Html.Attributes exposing (checked, class, disabled, for, href, id, max, min, placeholder, rel, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Model.Model exposing (..)
import View.Utils exposing (icon)
import View.Vehicle


view : Model -> Html Msg
view model =
    Grid.row []
        [ Grid.col [ Col.xs12 ]
            {--[ Grid.simpleRow
                (model.vehicles
                    |> List.map (View.Vehicle.renderCard model model.view)
                    |> List.map (\c -> Card.view c)
                    |> List.map (\cv -> Grid.col [ Col.md6 ] [ cv ])
                )
            ]
            --}
            [ model.vehicles
                |> Dict.values
                |> List.map (View.Vehicle.renderCard model model.view)
                |> Card.columns
            ]
        , Grid.col [ Col.xs12 ]
            [ Button.button
                [ Button.primary
                , Button.block
                , Button.onClick <| To ViewAddingVehicle
                , Button.attrs [ class "mb-3" ]
                ]
                [ icon "plus", text "New Vehicle" ]
            ]
        ]