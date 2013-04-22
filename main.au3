#include <config.au3>
#include <map-scrolling.au3> ; Functions for scrolling the current map.
#include <tab-selection.au3> ; Functions for changing which tab is selected.
#include <data-extraction.au3> ; Getter functions for reading data.
#include <window-resizing.au3> ; Functions for resizing windows.
#include <gui.au3> ; Sets up the graphical user interface.

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
;ResizeMapWindow($MapWindowWidth, $MapWindowHeight)

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
        Case $ButtonGetMapWidth
            MsgBox(1, "Map Width", GetMapWidth())
        Case $ButtonGetMapHeight
            MsgBox(1, "Map Height", GetMapHeight())
        Case $ButtonGetMapBank
            MsgBox(1, "Map Bank", GetMapBank())
        Case $ButtonGetMapNo
            MsgBox(1, "Map Bank", GetMapNo())
        Case $ButtonScrollMapLeft
            ScrollMapLeft()
        Case $ButtonScrollMapRight
            ScrollMapRight()
        Case $ButtonScrollMapUp
            ScrollMapUp()
        Case $ButtonScrollMapDown
            ScrollMapDown()
        Case $ButtonResizeMapWindow
            ResizeMapWindow($MapWindowWidth, $MapWindowHeight)
        Case $ButtonScrollMapToTile
            ScrollMapUntilTileIsOnScreen(Int(GUICtrlRead($InputTileX)), Int(GUICtrlRead($InputTileY)))
        Case 0
            ContinueLoop
    EndSwitch
WEnd