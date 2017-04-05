
module Calendar.Update exposing (..)

import Calendar.Msg exposing (..)
import Calendar.Model exposing (..)
import Calendar.Server exposing (..)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SelectDay date ->
       (model, Cmd.none)
    LoadStatistic ->
       (model, getStatistic "")
    UpdateStatistic ->
       (model, Cmd.none)
    GetStatistic (Ok newUrl) ->
       ( model, Cmd.none)
    GetStatistic (Err _) ->
       (model, Cmd.none)
