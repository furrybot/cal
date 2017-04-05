module Calendar.Msg exposing (..)
import Date exposing (Date)
import Http

type Msg
    = SelectDay Date
    | LoadStatistic
    | GetStatistic (Result Http.Error String)
    | UpdateStatistic
