
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

type Day
    = M
    | Tu
    | W
    | Th
    | F

type alias ToolbarItem = 
  {  name: String
  ,  stateType: EditState
  }

type alias Position =
  { person : String
  , date : Date
  }

type alias User = 
  { name : String
  , userpic : String
  }

type SelectionState
  = None
  | Selected Position

type alias Model =
    { state : ScreenState
    , selection : SelectionState
    , toolbarItems: List ToolbarItem
    , daysTitles: List Day
    , users: List User
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
    , daysTitles = [M, Tu, W, Th, F]
    , users = 
      [
          { name = "Alesya" , userpic = "https://logopond.com/avatar/104380/triangulate-userpic-200x200.jpg" }
      ,   { name = "Kostya" , userpic = "https://logopond.com/avatar/104380/triangulate-userpic-200x200.jpg" }
      ,   { name = "Dima"   , userpic = "https://logopond.com/avatar/104380/triangulate-userpic-200x200.jpg" }     
      ,   { name = "Eugene" , userpic = "https://logopond.com/avatar/104380/triangulate-userpic-200x200.jpg" }
      ,   { name = "Andrew" , userpic = "https://logopond.com/avatar/104380/triangulate-userpic-200x200.jpg" }
      ,   { name = "Sergey" , userpic = "https://logopond.com/avatar/104380/triangulate-userpic-200x200.jpg" }
      ,   { name = "Alex"   , userpic = "https://logopond.com/avatar/104380/triangulate-userpic-200x200.jpg" }
      ]
    }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
