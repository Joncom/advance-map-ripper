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
