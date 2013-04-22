#include-once


; GENERAL

; Mouse movement coordinates are relative to the active window.
AutoItSetOption ( "MouseCoordMode", 2 ) ;1=absolute, 0=relative, 2=client

; How long to wait between window-related actions like MouseMove.
AutoItSetOption ( "WinWaitDelay", 5 ) ; Default 250 ms

$tilesize = 16
$MouseMoveSpeed = 0 ; In miliseconds. 0 = instant



; TITLES

; Only use first part of title so that as the title
; changes with each map, the window is still matched.
$MainWindowTitle = "Advance"

$GUITitle = "AM Ripper" ; Don't use word "Advance" because confuses title searching.



; CONTROL IDS

$TabID = "[CLASSNN:SysTabControl321]"
$MapWindowID = "[CLASSNN:Window10]"
$MapNameID = "[CLASSNN:Edit39]"
$MapWidthID = "[CLASSNN:Edit22]"
$MapHeightID = "[CLASSNN:Edit21]"
$MapBankID = "[CLASSNN:Edit19]"
$MapNoID = "[CLASSNN:Edit17]"
$MapWeatherID = "[CLASS:Edit; INSTANCE:33]"
$MapMusicNoID = "[CLASS:Edit; INSTANCE:35]"
$MapCaveID = "[CLASS:Edit; INSTANCE:34]"
$MapTypeID = "[CLASS:Edit; INSTANCE:32]"
$MapFightTypeID = "[CLASS:Edit; INSTANCE:31]"
$MapShowNameID = "[CLASS:Edit; INSTANCE:38]"




; MAP

; Make the window small enough to force vertical & horizontal scrollbars.
$MapWindowWidth = 133
$MapWindowHeight = 165

; Precisely how many tiles are viewable in map window?
$MapWindowTileWidth = 7
$MapWindowTileHeight = 9

; Positions of arrows to click on to scroll the map.
$ScrollUpArrowX = 123
$ScrollUpArrowY = 10
$ScrollDownArrowX = 123
$ScrollDownArrowY = 137
$ScrollLeftArrowX = 11
$ScrollLeftArrowY = 155
$ScrollRightArrowX = 105
$ScrollRightArrowY = 154

; How many clicks to scroll one tile?
$ScrollClicksPerTile = 2



; TABS

$MapTab = 1
$MovementTab = 2
$EventsTab = 3
$WildPokemonTab = 4
$HeaderTab = 5
