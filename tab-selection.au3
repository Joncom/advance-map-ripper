#include-once
#include <config.au3>


Func SelectMapTab()
    SelectTab($TabID, $MapTab)
EndFunc


Func SelectMovementTab()
    SelectTab($TabID, $MovementTab)
EndFunc


Func SelectEventsTab()
    SelectTab($TabID, $EventsTab)
EndFunc


Func SelectWildPokemonTab()
    SelectTab($TabID, $WildPokemonTab)
EndFunc


Func SelectHeaderTab()
    SelectTab($TabID, $HeaderTab)
EndFunc


Func SelectTab($controlID, $tab)
    ; Get the current tab.
    $currentTab = ControlCommand ( $MainWindowTitle, "", $controlID, "CurrentTab", "" )
    While $currentTab <> $tab
        If $currentTab < $tab Then
            ; Shift tab to right.
            ControlCommand ( $MainWindowTitle, "", $controlID, "TabRight", "" )
        Else
            ; Shift tab to left.
            ControlCommand ( $MainWindowTitle, "", $controlID, "TabLeft", "" )
        EndIf
        ; Set new current tab.
        $currentTab = ControlCommand ( $MainWindowTitle, "", $controlID, "CurrentTab", "" )
    WEnd
EndFunc

