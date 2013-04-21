#include <GUIConstantsEx.au3>
#include <config.au3>

GUICreate( $GUITitle, $GUIWidth, $GUIHeight )
GUISetState(@SW_SHOW)

; SELECTING TABS
$ButtonSelectMapTab = GUICtrlCreateButton ( "Select Map Tab", 5, 5 )
$ButtonSelectMovementTab = GUICtrlCreateButton ( "Select Movement Tab", 5, 35 )
$ButtonSelectEventsTab = GUICtrlCreateButton ( "Select Events Tab", 5, 65 )
$ButtonSelectWildPokemonTab = GUICtrlCreateButton ( "Select Wild Pokemon Tab", 5, 95 )
$ButtonSelectHeaderTab = GUICtrlCreateButton ( "Select Header Tab", 5, 125 )