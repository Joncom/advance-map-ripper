#include <config.au3>
#include <functions.au3>
#include <function-tab-select.au3>
#include <function-control-read.au3>
#include <gui.au3>

;$text = ControlCommand ( $MainWindowTitle, "", 50017416, "CurrentTab", "" )
;MsgBox ( 1, "Text", GetMapHeight() )

; Example of getting block data from tiles.
;For $y = 0 To 1;GetMapHeight() - 1
;    For $x = 0 To 1;GetMapWidth() - 1
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

; Used to keep track of where map is currently scrolled to.
$MapScrollX = 0
$MapScrollY = 0

; Resize map window to specific size so it can be scrolled accurately.
ResizeMapWindow($MapWindowWidth, $MapWindowHeight)

; Run the program until it is closed.
While 1
    $Msg = GUIGetMsg()
    Switch $Msg
        Case $GUI_EVENT_CLOSE
            ExitLoop
        Case $ButtonSelectMapTab
            SelectMapTab()
        Case $ButtonSelectMovementTab
            SelectMovementTab()
        Case $ButtonSelectEventsTab
            SelectEventsTab()
        Case $ButtonSelectWildPokemonTab
            SelectWildPokemonTab()
        Case $ButtonSelectHeaderTab
            SelectHeaderTab()
        Case $ButtonMoveMouseToMapTile
            MoveMouseToMapTile(GUICtrlRead($InputTileX), GUICtrlRead($InputTileY))
        Case 0
            ContinueLoop
    EndSwitch
WEnd