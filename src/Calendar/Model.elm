
module Calendar.Model exposing (..)

import Calendar.Msg exposing (..)
import Date exposing (Date)

type EditState
    = Paid
    | WorkFromHome
    | DayOff
    | Vacation

type ScreenState
    = Normal
    | Edit EditState

type alias Position =
  { person : String
  , date : Date
  }

type SelectionState
  = None
  | Selected Position

type alias Model =
    { state : ScreenState
    , selection : SelectionState
    }

initial : (Model, Cmd Msg)
initial =
    ({ state = Normal
    , selection = None
    }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
