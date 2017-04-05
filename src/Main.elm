module Main exposing (..)
import Html exposing (..)

import Calendar.Model exposing (..)
import Calendar.View exposing (..)
import Calendar.Update exposing (..)
import Calendar.Msg exposing (Msg)


main =
  Html.program
    { init = initial
    , view = calendarView
    , update = update
    , subscriptions = subscriptions
    }
