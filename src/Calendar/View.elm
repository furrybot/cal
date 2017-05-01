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

calendarItem : EditState -> Html Msg
calendarItem dayState =
    let
        className =  "calendar-item is-clickable" ++ classNameFromState dayState
    in    
        div [ class className][ text " " ]


calendarRow : User -> Html Msg
calendarRow user =
    div [ class "calendar-row" ]
        [ div [ class "userpic" ] [ img [ src user.userpic, alt user.name, title user.name, width 50, height 50 ] [] ]
        ,   calendarItem Default
        ,   calendarItem Paid
        ,   calendarItem Late
        ,   calendarItem Default
        ,   calendarItem OutOfOffice
        ]

calendarBody : List User -> Html Msg
calendarBody users =
    div [ class "calendar-body" ] 
        (List.map
            (\user ->
                calendarRow user
            )
            users
        )

calendar : Model -> Html Msg
calendar model =
    div [ class "calendar is-weeks" ]
      [ calendarHeader model.daysTitles 
      , calendarBody model.users
      ]

calendarHeader : List Day -> Html Msg
calendarHeader days =
    div [class "calendar-header"] [
        div [ class "calendar-row is-calendar-data" ]
          (List.map
                (\day ->
                    div [ class "calendar-item" ] [text (toString day)]
                )
                days
            )
    ]

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
