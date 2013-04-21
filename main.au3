#include <config.au3>
#include <functions.au3>
#include <gui.au3>

;$text = ControlCommand ( $MainWindowTitle, "", 50017416, "CurrentTab", "" )
;MsgBox ( 1, "Text", GetMapHeight() )

; Get block data from tiles.
;For $y = 0 To 1;GetMapHeight() - 1
;    For $x = 0 To 1;GetMapWidth() - 1
;        MoveMouseToMapTile($x, $y)
;        $block = GetBlockFromStatusbar()
;        MsgBox(1, "Block:", $block)
;    Next
;Next

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