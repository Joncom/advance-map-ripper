#include-once
#include <config.au3>


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

