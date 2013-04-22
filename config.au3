#include-once



; AUTOIT

; Mouse movement coordinates are relative to the active window.
AutoItSetOption ( "MouseCoordMode", 2 ) ;1=absolute, 0=relative, 2=client
; How long to wait between window-related actions like MouseMove.
AutoItSetOption ( "WinWaitDelay", 5 ) ; Default 250 ms



; GENERAL

$tilesize = 16



; GUI

$GUITitle = "AM Ripper" ; Don't use word "Advance" because confuses title searching.
$GUIWidth = 300
$GUIHeight = 300



; MAIN WINDOW

$MainWindowTitle = "Advance" ; First part of title.
$MainTabID = "[CLASSNN:SysTabControl321]"
$MapWindowID = "[CLASSNN:Window10]"

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

; Number of pixels a single mousewheel action scrolls the map.
$MapWindowScrollPx = 8

$MapNameID = "[CLASSNN:Edit39]"
$MapWidthID = "[CLASSNN:Edit22]"
$MapHeightID = "[CLASSNN:Edit21]"
$MapBankID = "[CLASSNN:Edit19]"
$MapNoID = "[CLASSNN:Edit17]"

; Tab #'s for navigating tabs.
$MapTab = 1
$MovementTab = 2 ; not yet used
$EventsTab = 3 ; not yet used
$WildPokemonTab = 4 ; not yet used
$HeaderTab = 5



; BLOCK EDITOR WINDOW

$BlockEditorWindowTitle = "Block editor"
$BlockEditorBlocksID = "[CLASSNN:Window6]"