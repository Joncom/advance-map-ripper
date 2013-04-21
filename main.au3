#include <config.au3>
#include <functions.au3>
#include <gui.au3>

;$text = ControlCommand ( $windowTitle, "", 50017416, "CurrentTab", "" )
;MsgBox ( 1, "Text", GetMapHeight() )

For $x = 0 To GetMapWidth()
    For $y = 0 To GetMapHeight()
        MoveMouseToMapTile($x, $y)
    Next
Next

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