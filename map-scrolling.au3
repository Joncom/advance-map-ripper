#include-once
#include <config.au3>


Func ScrollMapUntilTileIsOnScreen($x, $y)
    ; Is the tile to the left of the viewable area?
    If $x < $MapScrollX Then
        ; Scroll left.
        ScrollMapLeft()
    ; Is the tile to the right of the viewable area?
    ElseIf $x >= $MapScrollX + $MapWindowTileWidth Then
        ; Scroll right.
        ScrollMapRight()
    ; Is the tile above the viewable area?
    ElseIf $y < $MapScrollY Then
        ; Scroll up.
        ScrollMapUp()
    ; Is the tile below the viewable area?
    ElseIf $y >= $MapScrollY + $MapWindowTileHeight Then
        ; Scroll down.
        ScrollMapDown()
    Else
        Return ; The tile is visible
    EndIf
    ; If the function has not returned it means there is more work to do.
    ScrollMapUntilTileIsOnScreen($x, $y)
EndFunc


Func ScrollMapLeft()
    $MapScrollX = $MapScrollX - 1
    ClickMapWindow($MapScrollLeftX, $MapScrollLeftY)
EndFunc


Func ScrollMapRight()
    $MapScrollX = $MapScrollX + 1
    ClickMapWindow($MapScrollRightX, $MapScrollRightY)
EndFunc


Func ScrollMapUp()
    $MapScrollY = $MapScrollY - 1
    ClickMapWindow($MapScrollUpX, $MapScrollUpY)
EndFunc


Func ScrollMapDown()
    $MapScrollY = $MapScrollY + 1
    ClickMapWindow($MapScrollDownX, $MapScrollDownY)
EndFunc

; Used by scroll functions to click on scrollbar arrows.
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

