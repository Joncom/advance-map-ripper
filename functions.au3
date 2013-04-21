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




Func MoveMouseToMapTile($x, $y)
    ; Convert tile position to pixels.
    $pixelX = Int($x) * $tilesize
    $pixelY = Int($y) * $tilesize
    ; Use the center of tile.
    $pixelX = $pixelX + ($tilesize / 2)
    $pixelY = $pixelY + ($tilesize / 2)
    ; Get position of map window.
    $mapWindowPos = ControlGetPos ( $MainWindowTitle, "", $MapWindowID )
    ; Calculate final position.
    $mouseX = $mapWindowPos[0] + $pixelX
    $mouseY = $mapWindowPos[1] + $pixelY
    ; Window must be active for MouseMove relative coord to work.
    WinActivate ( $MainWindowTitle )
    ; Move mouse to tile position.
    MouseMove($mouseX, $mouseY, 0)
EndFunc



Func GetBlockFromStatusbar()
    ; Get status text as string.
    $status = StatusbarGetText($MainWindowTitle)
    ; Break up string into pieces.
    $pieces = StringSplit( $status, "$" )
    ; Count how many pieces in the array.
    $count = UBound( $pieces )
    ; The last piece should be the block.
    $hexBlock = $pieces[$count-1]
    ; Convert hex value to decimal.
    $decBlock = Dec( $hexBlock )
    Return $decBlock
EndFunc



Func EnsureMapWindowFitsMap()
    ; Get map dimensions.
    $mapWidth = Int(GetMapWidth())
    $mapHeight = Int(GetMapWidth())
    ; Convert map dimension to pixels.
    $pixelWidth = $mapWidth * $tilesize
    $pixelHeight = $mapHeight * $tilesize
    ; Add an extra tile to be safe.
    $pixelWidth = $pixelWidth + $tilesize
    $pixelHeight = $pixelHeight + $tilesize
    ; Get size of map window.
    $size = ControlGetPos ( $MainWindowTitle, "", $MapWindowID )
    $winWidth = $size[2]
    $winHeight = $size[3]
    ; Check if resize is needed.
    If $winWidth < $pixelWidth OR $winHeight < $pixelHeight Then
    ;
    EndIf
EndFunc



Func ResizeWindow($title, $width, $height)
    ; Get current position.
    $pos = WinGetPos( $title )
    ; Resize window.
    WinMove( $title, "", $pos[0], $pos[1], $width, $height )
EndFunc



Func IncreaseWindowWidth($title, $pixels)
    ; Get current position/size.
    $pos = WinGetPos( $title )
    ; Resize window.
    WinMove( $title, "", $pos[0], $pos[1], $pos[2] + $pixels, $pos[3] )
EndFunc



Func IncreaseWindowHeight($title, $pixels)
    ; Get current position/size.
    $pos = WinGetPos( $title )
    ; Resize window.
    WinMove( $title, "", $pos[0], $pos[1], $pos[2], $pos[3] + $pixels )
EndFunc



Func GetMapWidth()
    $width = ControlGetText ( $MainWindowTitle, "", $MapWidthID )
    Return $width
EndFunc



Func GetMapHeight()
    $height = ControlGetText ( $MainWindowTitle, "", $MapHeightID )
    Return $height
EndFunc
