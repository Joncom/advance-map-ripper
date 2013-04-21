#include <config.au3>
#include <gui.au3>

; CLICKING ON TABS

Func ClickMapTab()
   SelectTab($MainTabID, $MapTab)
EndFunc

Func ClickMovementTab()
   SelectTab($MainTabID, $MovementTab)
EndFunc

Func ClickEventsTab()
   SelectTab($MainTabID, $EventsTab)
EndFunc

Func ClickEventsTab()
   SelectTab($MainTabID, $WildPokemonTab)
EndFunc

Func ClickHeaderTab()
   SelectTab($MainTabID, $HeaderTab)
EndFunc

; Assumes that "Header" tab is active.
Func GetMapWidth()
   $width = ControlGetText ( $windowTitle, "", $MapWidthID )
   Return $width
EndFunc

Func GetMapHeight()
   $height = ControlGetText ( $windowTitle, "", $MapHeightID )
   Return $height
EndFunc

Func SelectTab($controlID, $tab)
   ; Get the current tab.
   $currentTab = ControlCommand ( $windowTitle, "", $controlID, "CurrentTab", "" )
   While $currentTab <> $tab
	  If $currentTab < $tab Then
		 ; Shift tab to right.
		 ControlCommand ( $windowTitle, "", $controlID, "TabRight", "" )
	  Else
		 ; Shift tab to left.
		 ControlCommand ( $windowTitle, "", $controlID, "TabLeft", "" )
	  EndIf
	  ; Set new current tab.
	  $currentTab = ControlCommand ( $windowTitle, "", $controlID, "CurrentTab", "" )
   WEnd
EndFunc


;$text = ControlCommand ( $windowTitle, "", 50017416, "CurrentTab", "" )
MsgBox ( 1, "Text", GetMapHeight() )