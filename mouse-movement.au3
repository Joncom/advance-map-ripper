#include-once
#include <config.au3>


Func MoveMouseToMapTile($x, $y)
    ; Take into where the map is scrolled to.
    $x = $x - $ScrollOffsetX
    $y = $y - $ScrollOffsetY
    ; Convert tile position to pixels.
    $pixelX = $x * $tilesize
    $pixelY = $y * $tilesize
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
    MouseMove($mouseX, $mouseY, $MouseMoveSpeed)
EndFunc

