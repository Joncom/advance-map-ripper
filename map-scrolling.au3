#include-once
#include <config.au3>


Func ScrollMapUntilTileIsOnScreen($x, $y)
    ; Is the tile to the left of the viewable area?
    If $x < $ScrollOffsetX Then
        ; Scroll left.
        ScrollMapLeft()
    ; Is the tile to the right of the viewable area?
    ElseIf $x >= $ScrollOffsetX + $MapWindowTileWidth Then
        ; Scroll right.
        ScrollMapRight()
    ; Is the tile above the viewable area?
    ElseIf $y < $ScrollOffsetY Then
        ; Scroll up.
        ScrollMapUp()
    ; Is the tile below the viewable area?
    ElseIf $y >= $ScrollOffsetY + $MapWindowTileHeight Then
        ; Scroll down.
        ScrollMapDown()
    Else
        Return ; The tile is visible
    EndIf
    ; If the function has not returned it means there is more work to do.
    ScrollMapUntilTileIsOnScreen($x, $y)
EndFunc


Func ScrollMapLeft()
    $ScrollOffsetX = $ScrollOffsetX - 1
    ClickMapWindow($ScrollLeftArrowX, $ScrollLeftArrowY)
EndFunc


Func ScrollMapRight()
    $ScrollOffsetX = $ScrollOffsetX + 1
    ClickMapWindow($ScrollRightArrowX, $ScrollRightArrowY)
EndFunc


Func ScrollMapUp()
    $ScrollOffsetY = $ScrollOffsetY - 1
    ClickMapWindow($ScrollUpArrowX, $ScrollUpArrowY)
EndFunc


Func ScrollMapDown()
    $ScrollOffsetY = $ScrollOffsetY + 1
    ClickMapWindow($ScrollDownArrowX, $ScrollDownArrowY)
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
    MouseClick ( "left", $newX, $newY, $ScrollClicksPerTile, $MouseMoveSpeed )
EndFunc

