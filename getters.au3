#include-once
#include <config.au3>


Func GetMapName()
    Return ControlGetText ( $MainWindowTitle, "", $MapNameID )
EndFunc


Func GetMapNameShowType()
    Return ControlGetText ( $MainWindowTitle, "", $MapShowNameID )
EndFunc


Func GetMapWidth()
    Return ControlGetText ( $MainWindowTitle, "", $MapWidthID )
EndFunc


Func GetMapHeight()
    Return ControlGetText ( $MainWindowTitle, "", $MapHeightID )
EndFunc


Func GetMapBank()
	Return ControlGetText ( $MainWindowTitle, "", $MapBankID )
EndFunc


Func GetMapNo()
	Return ControlGetText ( $MainWindowTitle, "", $MapNoID )
EndFunc


Func GetMapWeather()
    Return ControlGetText ( $MainWindowTitle, "", $MapWeatherID )
EndFunc


Func GetMapMusic()
    Return ControlGetText ( $MainWindowTitle, "", $MapMusicNoID )
EndFunc


Func GetMapType()
    Return ControlGetText ( $MainWindowTitle, "", $MapTypeID )
EndFunc


Func GetMapCaveType()
    Return ControlGetText ( $MainWindowTitle, "", $MapCaveID )
EndFunc


Func GetMapFightType()
    Return ControlGetText ( $MainWindowTitle, "", $MapFightTypeID )
EndFunc


Func GetBlockFromStatusbar()
    ; Get status text as string.
    $status = StatusbarGetText($MainWindowTitle)
    ; Break up string into pieces.
    $pieces = StringSplit( $status, "$" )
    ; Count how many pieces in the array.
    $count = UBound( $pieces )
    ; The last piece should be the block.
    $hexBlock = $pieces[$count-1]
    ; Convert hex value to decimal.
    $decBlock = Dec( $hexBlock )
    ; Return result.
    Return $decBlock
EndFunc
