module RomanNumerals_Spec exposing (..)

import Expect
import Roman
import Test exposing (..)


params : List ( Int, String )
params =
    [ ( 1, "I" )
    , ( 2, "II" )
    , ( 3, "III" )
    , ( 4, "IV" )
    , ( 5, "V" )
    , ( 6, "VI" )
    , ( 9, "IX" )
    , ( 10, "X" )
    , ( 40, "XL" )
    , ( 50, "L" )
    , ( 90, "XC" )
    , ( 100, "C" )
    , ( 389, "CCCLXXXIX" )
    , ( 400, "CD" )
    , ( 444, "CDXLIV" )
    , ( 499, "CDXCIX" )
    , ( 500, "D" )
    , ( 900, "CM" )
    , ( 1000, "M" )
    , ( 1987, "MCMLXXXVII" )
    , ( 1985, "MCMLXXXV" )
    , ( 1990, "MCMXC" )
    ]


suite : Test
suite =
    describe "Roman Numerals"
        (params
            |> List.map
                (\( arabic, roman ) ->
                    test (String.fromInt arabic ++ "->" ++ roman) <|
                        \_ ->
                            arabic
                                |> Roman.fromArabic
                                |> Expect.equal roman
                )
        )
