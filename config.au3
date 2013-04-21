#include-once

; When moving mouse, use relative coords to the client
; area of the active window. !IMPORTANT!
AutoItSetOption ( "MouseCoordMode", 2 )

$windowTitle = "Advance Map - PALLET TOWN"

$tilesize = 16

$GUITitle = "Advance Map Ripper"
$GUIWidth = 300
$GUIHeight = 300

; Tab #'s for navigating tabs.
$MapTab = 1
$MovementTab = 2 ; not yet used
$EventsTab = 3 ; not yet used
$WildPokemonTab = 4 ; not yet used
$HeaderTab = 5

; IDs for accessing data.
$MainTabID = "[CLASSNN:SysTabControl321]"
$MapWindowID = "[CLASSNN:Window10]"
$MapNameID = "[CLASSNN:Edit39]"
$MapWidthID = "[CLASSNN:Edit22]"
$MapHeightID = "[CLASSNN:Edit21]"