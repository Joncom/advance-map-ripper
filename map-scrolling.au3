#include-once
#include <config.au3>

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


Func ScrollMapRight()
    ; Get position of map window.
    $mapWindowPos = ControlGetPos ( $MainWindowTitle, "", $MapWindowID )
    ; Window must be active for MouseMove relative coord to work.
    WinActivate( $MainWindowTitle )
    ; Calculate click position.
    $x = $mapWindowPos[0] + $MapScrollRightX
    $y = $mapWindowPos[1] + $MapScrollRightY
    ; Click scroll button.
    MouseClick ( "left", $x, $y, $MapScrollClicksPerTile, $MouseMoveSpeed )
EndFunc

