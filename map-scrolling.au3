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
    MouseMove($mouseX, $mouseY, $MouseMoveSpeed)
EndFunc


Func ScrollMapLeft()
    ClickMapWindow($MapScrollLeftX, $MapScrollLeftY)
EndFunc


Func ScrollMapRight()
    ClickMapWindow($MapScrollRightX, $MapScrollRightY)
EndFunc


Func ScrollMapUp()
    ClickMapWindow($MapScrollUpX, $MapScrollUpY)
EndFunc


Func ScrollMapDown()
    ClickMapWindow($MapScrollDownX, $MapScrollDownY)
EndFunc


Func ClickMapWindow($x, $y)
    ; Get position of map window.
    $mapWindowPos = ControlGetPos ( $MainWindowTitle, "", $MapWindowID )
    ; Window must be active for MouseMove relative coord to work.
    WinActivate( $MainWindowTitle )
    ; Calculate click position.
    $newX = $mapWindowPos[0] + $x
    $newY = $mapWindowPos[1] + $y
    ; Click scroll button.
    MouseClick ( "left", $newX, $newY, $MapScrollClicksPerTile, $MouseMoveSpeed )
EndFunc

