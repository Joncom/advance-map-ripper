;$text = ControlCommand ( $MainWindowTitle, "", 50017416, "CurrentTab", "" )
;MsgBox ( 1, "Text", GetData($MapHeightID) )

; Example of getting block data from tiles.
;For $y = 0 To 1;GetData($MapHeightID) - 1
;    For $x = 0 To 1;GetData($MapWidthID) - 1
;        MoveMouseToMapTile($x, $y)
;        $block = GetBlockFromStatusbar()
;        MsgBox(1, "Block:", $block)
;    Next
;Next

; Example of how to scroll the palette window.
;$windowPos = ControlGetPos ( $MainWindowTitle, "", "[CLASSNN:Window8]")
;WinActivate ( $MainWindowTitle )
;MouseMove( $windowPos[0] + 10, $windowPos[1] + 10, 0 )
;MouseWheel ( "down" )

; Example of how to resize a non-resizable window.
;ResizeWindow($BlockEditorWindowTitle, 800, 800)

; Example of getting size of a control window.
;$pos = ControlGetPos ( $MainWindowTitle, "", $MapWindowID )
;$text = "Window size is " & $pos[2] & " by " & $pos[3]
;MsgBox(1, "Window Size:", $text)

; Resize map window to specific size so it can be scrolled accurately.
;ResizeMapWindow($MapWindowWidth, $MapWindowHeight)