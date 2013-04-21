#include <config.au3>
#include <gui.au3>

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

; Assumes that "Header" tab is active.
Func GetMapWidth()
   $width = ControlGetText ( $windowTitle, "", $MapWidthID )
   Return $width
EndFunc

Func GetMapHeight()
   $height = ControlGetText ( $windowTitle, "", $MapHeightID )
   Return $height
EndFunc


;$text = ControlCommand ( $windowTitle, "", 50017416, "CurrentTab", "" )
;MsgBox ( 1, "Text", GetMapHeight() )

; Run the program until it is closed.
While 1
    $Msg = GUIGetMsg()
    Switch $Msg
        Case $GUI_EVENT_CLOSE
            ExitLoop
        Case $ButtonSelectMapTab
            SelectMapTab()
        Case $ButtonSelectMovementTab
            SelectMovementTab()
        Case $ButtonSelectEventsTab
            SelectEventsTab()
        Case $ButtonSelectWildPokemonTab
            SelectWildPokemonTab()
        Case $ButtonSelectHeaderTab
            SelectHeaderTab()
        Case 0
            ContinueLoop
    EndSwitch
WEnd