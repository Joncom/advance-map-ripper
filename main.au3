#include <config.au3>           ; Settings and configuration.
#include <map-scrolling.au3>    ; Functions for scrolling the current map.
#include <tab-selection.au3>    ; Functions for changing which tab is selected.
#include <data-extraction.au3>  ; Getter functions for reading data.
#include <window-resizing.au3>  ; Functions for resizing windows.
#include <gui.au3>              ; Sets up the graphical user interface.

; Used to keep track of where map is currently scrolled to.
$MapScrollX = 0
$MapScrollY = 0

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
            MoveMouseToMapTile(Int(GUICtrlRead($InputTileX)), Int(GUICtrlRead($InputTileY)))
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