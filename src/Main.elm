module Main exposing (..)
import Html exposing (..)

import Calendar.Model exposing (..)
import Calendar.View exposing (..)
import Calendar.Update exposing (..)
import Calendar.Msg exposing (Msg)


main =
  Html.beginnerProgram
    { model = initial
    , view = calendarView
    , update = update
    }
