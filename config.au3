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
$MainMapBankID = "[CLASSNN:Edit19]"
$MainMapNoID = "[CLASSNN:Edit17]"
$MapWindowID = "[CLASSNN:Window10]"

; These size values are important because they make the window small enough
; that scrollbars exist for all maps. And it lets the program know how many
; tiles are viewable so that it knows if it needs to scroll or not.
$MainMapWindowWidth = 133
$MainMapWindowHeight = 165
$MainMapWindowTileWidth = 7
$MainMapWindowTileHeight = 9

; Number of pixels a single mousewheel action scrolls.
$MainMapWindowScrollPx = 8

$MapNameID = "[CLASSNN:Edit39]"
$MapWidthID = "[CLASSNN:Edit22]"
$MapHeightID = "[CLASSNN:Edit21]"

; Tab #'s for navigating tabs.
$MapTab = 1
$MovementTab = 2 ; not yet used
$EventsTab = 3 ; not yet used
$WildPokemonTab = 4 ; not yet used
$HeaderTab = 5



; BLOCK EDITOR WINDOW

$BlockEditorWindowTitle = "Block editor"
$BlockEditorBlocksID = "[CLASSNN:Window6]"