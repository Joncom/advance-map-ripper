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




Func MoveMouseToMapTile($x, $y)
    ; Convert tile position to pixels.
    $pixelX = Int($x) * $tilesize
    $pixelY = Int($y) * $tilesize
    ; Use the center of tile.
    $pixelX = $pixelX + ($tilesize / 2)
    $pixelY = $pixelY + ($tilesize / 2)
    ; Get position of map window.
    $mapWindowPos = ControlGetPos ( $windowTitle, "", $MapWindowID )
    ; Calculate final position.
    $mouseX = $mapWindowPos[0] + $pixelX
    $mouseY = $mapWindowPos[1] + $pixelY
    ; Make sure that the correct window is active.
    WinActivate ( $windowTitle )
    ; Move mouse to tile position.
    MouseMove($mouseX, $mouseY)
EndFunc



Func GetMapWidth()
    $width = ControlGetText ( $windowTitle, "", $MapWidthID )
    Return $width
EndFunc

Func GetMapHeight()
    $height = ControlGetText ( $windowTitle, "", $MapHeightID )
    Return $height
EndFunc
