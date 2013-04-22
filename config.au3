#include-once


; GENERAL

; Mouse movement coordinates are relative to the active window.
AutoItSetOption ( "MouseCoordMode", 2 ) ;1=absolute, 0=relative, 2=client

; How long to wait between window-related actions like MouseMove.
AutoItSetOption ( "WinWaitDelay", 5 ) ; Default 250 ms

$tilesize = 16
$GUIWidth = 300
$GUIHeight = 300
$MouseMoveSpeed = 0 ; In miliseconds. 0 = instant



; TITLES

$MainWindowTitle = "Advance" ; First part of title.
$BlockEditorWindowTitle = "Block editor"
$GUITitle = "AM Ripper" ; Don't use word "Advance" because confuses title searching.



; CONTROL IDS

$MainTabID = "[CLASSNN:SysTabControl321]"
$MapWindowID = "[CLASSNN:Window10]"
$MapNameID = "[CLASSNN:Edit39]"
$MapWidthID = "[CLASSNN:Edit22]"
$MapHeightID = "[CLASSNN:Edit21]"
$MapBankID = "[CLASSNN:Edit19]"
$MapNoID = "[CLASSNN:Edit17]"
$BlockEditorBlocksID = "[CLASSNN:Window6]"



; MAP

; Make the window small enough to force vertical & horizontal scrollbars.
$MapWindowWidth = 133
$MapWindowHeight = 165

; Precisely how many tiles are viewable in map window?
$MapWindowTileWidth = 7
$MapWindowTileHeight = 9

; Positions of arrows to click on to scroll the map.
$MapScrollUpX = 123
$MapScrollUpY = 10
$MapScrollDownX = 123
$MapScrollDownY = 137
$MapScrollLeftX = 11
$MapScrollLeftY = 155
$MapScrollRightX = 105
$MapScrollRightY = 154

; How many clicks to scroll one tile?
$MapScrollClicksPerTile = 2



; TABS

$MapTab = 1
$MovementTab = 2
$EventsTab = 3
$WildPokemonTab = 4
$HeaderTab = 5
