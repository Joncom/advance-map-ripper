#include-once
#include <config.au3>

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