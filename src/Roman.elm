module Roman exposing (..)


fromArabic : Int -> String
fromArabic n =
    List.repeat n "I"
        |> String.join ""
        |> String.replace "IIIII" "V"
        |> String.replace "IIII" "IV"
        |> String.replace "VV" "X"
        |> String.replace "VIV" "IX"
        |> String.replace "XXXXX" "L"
        |> String.replace "XXXX" "XL"
        |> String.replace "LL" "C"
        |> String.replace "LXL" "XC"
        |> String.replace "CCCCC" "D"
        |> String.replace "CCCC" "CD"
        |> String.replace "DD" "M"
        |> String.replace "DCD" "CM"
