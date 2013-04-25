#include <config.au3>           ; Settings and configuration.
#include <scrolling.au3>        ; Functions for scrolling.
#include <mouse-movement.au3>   ; Functions for moving the mouse.
#include <tab-selection.au3>    ; Functions for changing which tab is selected.
#include <getters.au3>          ; Getter functions for reading data.
#include <window-resizing.au3>  ; Functions for resizing windows.
#include <gui.au3>              ; Sets up the graphical user interface.


; Used to keep track of position when scrolling.
$ScrollOffsetX = 0
$ScrollOffsetY = 0

; Resize map in preperation for reading tiles.
ResizeMapWindow($MapWindowWidth, $MapWindowHeight)

$MapName = GetData($MapNameID)
$MapWidth = GetData($MapWidthID)
$MapHeight = GetData($MapHeightID)
$MapBank = GetData($MapBankID)
$MapNo = GetData($MapNoID)
$MapBlocks = GetBlocks($MapWidth, $MapHeight)
$Filename = "Map-" & $MapBank & "-" & $MapNo & ".map"
$Section = "Map." & $MapBank & "." & $MapNo
IniWrite ( $Filename, $Section, "name", $MapName )     ; Name
IniWrite ( $Filename, $Section, "width", $MapWidth )   ; Width
IniWrite ( $Filename, $Section, "height", $MapHeight ) ; Height
IniWrite ( $Filename, $Section, "blocks", $MapBlocks )    ; Blocks

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
            MsgBox(1, "Map Width", GetData($MapWidthID))
        Case $ButtonGetMapHeight
            MsgBox(1, "Map Height", GetData($MapHeightID))
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