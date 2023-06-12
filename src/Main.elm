module Main exposing (Model, Msg, main)

import Browser
import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events as Evts
import Roman


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = view
        }



-- Init


type alias Model =
    { birthYear : Maybe Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { birthYear = Just 1987 }
    , Cmd.none
    )


type Msg
    = ChangeBirthYear String



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        ChangeBirthYear raw ->
            ( { birthYear = String.toInt raw }
            , Cmd.none
            )



-- View


view : Model -> Html Msg
view model =
    {-
       <div class="nes-container with-title is-centered">
         <p class="title">Container.is-centered</p>
         <p>Good morning. Thou hast had a good night's sleep, I hope.</p>
       </div>
    -}
    Html.main_
        [ Attr.class "" ]
        [ field
            { id = "birthyear"
            , label = "Birth Year"
            , placeholder = "1987"
            , value =
                model.birthYear
                    |> Maybe.map String.fromInt
                    |> Maybe.withDefault ""
            , onChange = ChangeBirthYear
            }
        , Html.div [ Attr.id "roman-birthyear" ]
            [ Html.p [] [ Html.text "Roman" ]
            , Html.p [ Attr.class "value" ]
                [ model.birthYear
                    |> Maybe.map Roman.fromArabic
                    |> Maybe.withDefault ""
                    |> Html.text
                ]
            ]
        ]


field :
    { label : String
    , id : String
    , placeholder : String
    , value : String
    , onChange : String -> Msg
    }
    -> Html Msg
field props =
    Html.div
        [ Attr.class "nes-field" ]
        [ Html.label [ Attr.for props.id ]
            [ Html.text props.label
            ]
        , Html.input
            [ Attr.placeholder props.placeholder
            , Attr.id props.id
            , Attr.value props.value
            , Evts.onInput props.onChange
            , Attr.autofocus True
            , Attr.class "nes-input"
            ]
            []
        ]
