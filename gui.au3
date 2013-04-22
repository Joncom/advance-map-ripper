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

; MOVING MOUSE TO TILE
$InputTileX = GUICtrlCreateInput ( "0", 5, 155, 20 )
$InputTileY = GUICtrlCreateInput ( "0", 30, 155, 20 )
$ButtonMoveMouseToMapTile = GUICtrlCreateButton ( "Move Mouse To Map Tile", 55, 155 )

; DATA READING
$ButtonGetMapWidth = GUICtrlCreateButton ( "Get Map Width", 5, 185 )
$ButtonGetMapHeight = GUICtrlCreateButton ( "Get Map Height", 5, 215 )

