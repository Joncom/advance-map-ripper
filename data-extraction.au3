#include-once
#include <config.au3>


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