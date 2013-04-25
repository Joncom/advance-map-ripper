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

; Used to keep track of which block is at which tile.
Dim $TileValues[ GetMapWidth() ][ GetMapHeight() ]

; Resize map in preperation for reading tiles.
ResizeMapWindow($MapWindowWidth, $MapWindowHeight)

; Get block for each tile in map.
$text = ""
;For $y = 0 To GetMapHeight() - 1
For $y = 0 To 3
    ;For $x = 0 To GetMapWidth() - 1
    For $x = 0 To 3
        ; Make sure tile is on screen.
        ScrollMapUntilTileIsOnScreen($x, $y)
        ; Move mouse to current tile.
        MoveMouseToMapTile($x, $y)
        ; Get current block.
        $block = GetBlockFromStatusbar()
        ; Store block.
        $TileValues[$x][$y] = $block
        ; Used for reporting.
        $text = $text & $block & " "
    Next
    $text = $text & "\n"
Next

$Filename = "Map-" & GetMapBank() & "-" & GetMapNo() & ".map"
$Section = "Section"
$Key = "Blocks"
$Value = $text

IniWrite ( $Filename, $Section, $Key, $Value )

; Report map data.
;MsgBox(1, "Map Data", $text)


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