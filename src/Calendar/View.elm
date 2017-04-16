module Calendar.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseOver, onMouseOut)
import Date exposing (Date, Month(..), year, month, day)
import Calendar.Model exposing (..)
import Calendar.Msg exposing (..)

stylesheet =
    let 
        tag = "link"
        attrs = 
            [ attribute "rel"       "stylesheet"
            , attribute "property"  "stylesheet"
            , attribute "href"      "/css/master.css"
            ]
        children = []    
    in
        node tag attrs children    

classNameFromState : EditState -> String
classNameFromState state =
    case state of
        DayOff ->
            "calendar-item is-clickable is-"
        Paid ->
            "calendar-item is-clickable is-"
        WorkFromHome ->
            "calendar-item is-clickable is-"
        Vacation ->
            "calendar-item is-clickable is-"


calendarDay : Date -> EditState -> Html Msg
calendarDay date dayState =
    div [ class <| classNameFromState dayState
        , onClick <| SelectDay date
        ][]


calendarRow : List Date -> Model -> Html Msg
calendarRow dateRow model =
    div [ class "calendar-row"]
      [ div [ class "userpic"]

        (List.map
          (\day ->
            calendarDay day Paid
          )
          dateRow
        )
      ]

calenderHeader : Model -> Html Msg
calenderHeader model =
    div [ class "calendar-row is-calendar-data"]
      [ div [class "calendar-item"] [] ]

calendarToolbar : Model -> Html Msg
calendarToolbar model =
    div [class "toolbar"]
        [     div [ class "toolbar-item is-late"] [text "Late"]
            , div [ class "toolbar-item is-paid"] [text "Paid"]
            , div [ class "toolbar-item is-ooo"] [text "Out of office"]
            , div [ class "toolbar-item is-clear"] [text "Clear"]
        ]

calendarView : Model -> Html Msg
calendarView model =
        div [class "main"]
            [     stylesheet 
                , div [ class "header" ] [ text "Calendar" ]
                , div [ class "content" ]
                    [ calendarToolbar model
                    , calenderHeader model
                    ]
            ]
