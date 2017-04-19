
module Calendar.Model exposing (..)

import Calendar.Msg exposing (..)
import Date exposing (Date)

type EditState
    = Late
    | Paid
    | OutOfOffice
    | Default

type ScreenState
    = Normal
    | Edit EditState

type alias ToolbarItem = 
  {  name: String
  ,  stateType: EditState
  }

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
    , toolbarItems: List ToolbarItem
    }

initial : (Model, Cmd Msg)
initial =
    ({ state = Normal
    , selection = None
    , toolbarItems = 
      [
          { name = "Late" , stateType = Late }
        , { name = "Paid" , stateType = Paid }
        , { name = "OOO" , stateType = OutOfOffice }
        , { name = "Clear" , stateType = Default }
      ]
    }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
