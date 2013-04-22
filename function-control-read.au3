#include-once
#include <config.au3>


Func GetMapWidth()
    $width = ControlGetText ( $MainWindowTitle, "", $MapWidthID )
    Return $width
EndFunc


Func GetMapHeight()
    $height = ControlGetText ( $MainWindowTitle, "", $MapHeightID )
    Return $height
EndFunc


Func GetMapBank()
	Return ControlGetText ( $MainWindowTitle, "", $MapBankID )
EndFunc


Func GetMapNo()
	Return ControlGetText ( $MainWindowTitle, "", $MapNoID )
EndFunc
