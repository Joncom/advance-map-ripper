#include-once
#include <config.au3>

; SELECTING TABS

Func SelectMapTab()
   SelectTab($MainTabID, $MapTab)
EndFunc

Func SelectMovementTab()
   SelectTab($MainTabID, $MovementTab)
EndFunc

Func SelectEventsTab()
   SelectTab($MainTabID, $EventsTab)
EndFunc

Func SelectWildPokemonTab()
   SelectTab($MainTabID, $WildPokemonTab)
EndFunc

Func SelectHeaderTab()
   SelectTab($MainTabID, $HeaderTab)
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




Func MoveMouseToTile($x, $y)
  Return 0
EndFunc



Func GetMapWidth()
   $width = ControlGetText ( $windowTitle, "", $MapWidthID )
   Return $width
EndFunc

Func GetMapHeight()
   $height = ControlGetText ( $windowTitle, "", $MapHeightID )
   Return $height
EndFunc