module Calendar.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onMouseOver, onMouseOut)
import Date exposing (Date, Month(..), year, month, day)
import Calendar.Model exposing (..)
import Calendar.Msg exposing (..)


classNameFromState : EditState -> String
classNameFromState state =
    case state of
        DayOff ->
            "calendar-item is-clickable"
        Paid ->
            "calendar-item is-clickable"
        WorkFromHome ->
            "calendar-item is-clickable"
        Vacation ->
            "calendar-item is-clickable"


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


calendarEditHeader : Model -> Html Msg
calendarEditHeader model =
    div [class "toolbar transparent"]
      [ div [ class "toolbar-item is-late"] []]


calendarView : Model -> Html Msg
calendarView model =
        div [class "Content"]
            [ div [ class "calendar-toolbar-box" ]
                [ calendarEditHeader model
                , calenderHeader model
                ]
            ]
