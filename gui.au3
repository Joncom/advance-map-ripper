#include <GUIConstantsEx.au3>
#include <config.au3>

GUICreate( $GUITitle, $GUIWidth, $GUIHeight )
GUISetState(@SW_SHOW)

$ButtonSelectMapTab = GUICtrlCreateButton ( "Select Map Tab", 5, 5 )