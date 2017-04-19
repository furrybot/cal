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
        Late ->
            " is-late"
        Paid ->
            " is-paid"
        OutOfOffice ->
            " is-ooo"
        Default ->
            " is-clear"

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

calendar : Model -> Html Msg
calendar model =
    div [ class "calendar is-weeks"]
      [ calendarHeader ["m", "t", "w", "t", "f"]]
      

calendarHeader : List String -> Html Msg
calendarHeader days =
    div [ class "calendar-row is-calendar-data"]
      (List.map
            (\day ->
                let 
                    currentDay = String.toUpper day
                in
                     div [ class "calendar-item"] [text currentDay]
            )
            days
        )

calendarToolbar : List ToolbarItem -> Html Msg
calendarToolbar toolbarItems =
    div [class "toolbar"]
        (List.map
            (\item ->
                let 
                    className = "toolbar-item is-" ++ classNameFromState item.stateType
                in
                    div [ class className] [text item.name]
            )
            toolbarItems
        )

calendarView : Model -> Html Msg
calendarView model =
        div [class "main"]
            [     stylesheet 
                , div [ class "header" ] [ text "Calendar" ]
                , div [ class "content" ]
                    [ calendarToolbar model.toolbarItems
                    , calendar model
                    ]
            ]
