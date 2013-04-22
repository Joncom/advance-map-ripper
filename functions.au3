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


Func ResizeMapWindow($width, $height)
    ; Get the current size of the map window.
    $size = ControlGetPos ( $MainWindowTitle, "", $MapWindowID )
    $currWidth = $size[2]
    $currHeight = $size[3]
    ; Adjust window width if needed.
    If $currWidth <> $width Then
        $diff = $width - $currWidth
        IncreaseWindowWidth( $MainWindowTitle, $diff )
    EndIf
    ; Increase window weight if needed.
    If $currHeight <> $height Then
        $diff = $height - $currHeight
        IncreaseWindowHeight( $MainWindowTitle, $diff )
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
