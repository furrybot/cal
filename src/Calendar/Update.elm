
module Calendar.Update exposing (..)

import Calendar.Msg exposing (..)
import Calendar.Model exposing (..)



update : Msg -> Model -> Model
update msg model =
  case msg of
    SelectDay date ->
      model
