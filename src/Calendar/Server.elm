
module Calendar.Server exposing (..)

import Calendar.Msg exposing (..)
import Http
import Json.Decode as Decode



getStatistic : String -> Cmd Msg
getStatistic topic =
  let
    url =
      "http://l8.koalko.me/api/v1" ++ topic
  in
    Http.send GetStatistic (Http.get url decodeDataUrl)


decodeDataUrl : Decode.Decoder String
decodeDataUrl =
  Decode.at ["some_field", "some_field"] Decode.string
