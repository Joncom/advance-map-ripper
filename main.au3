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

Func RipAndSaveMap()
    ; Resize map in preperation for reading tiles.
    ResizeMapWindow($MapWindowWidth, $MapWindowHeight)
    ; Extract Map Data
    $Section = "MapData"
    $MapBank = GetData($MapBankID)
    $MapNo = GetData($MapNoID)
    $MapName = GetData($MapNameID)
    $MapWidth = GetData($MapWidthID)
    $MapHeight = GetData($MapHeightID)
    $MapBlocks = GetBlocks($MapWidth, $MapHeight)
    $MapType = Dec(GetValueInBrackets(GetData($MapTypeID)))
    $MapFightType = Dec(GetValueInBrackets(GetData($MapFightTypeID)))
    $MapCave = Dec(GetValueInBrackets(GetData($MapCaveID)))
    $MapMusic = Dec(StringTrimLeft(GetData($MapMusicNoID), 1)) ; Trim leading '$'.
    $MapWeather = Dec(GetValueInBrackets(GetData($MapWeatherID)))
    $MapShowName = Dec(GetValueInBrackets(GetData($MapShowNameID)))
    $Filename = $MapBank & "." & $MapNo & ".map"
    ; Save Map Data
    IniWrite ( $Filename, $Section, "name", $MapName )          ; Name
    IniWrite ( $Filename, $Section, "bank", $MapBank )          ; Bank
    IniWrite ( $Filename, $Section, "number", $MapNo )          ; Bank
    IniWrite ( $Filename, $Section, "show_name", $MapShowName ) ; Show Name
    IniWrite ( $Filename, $Section, "width", $MapWidth )        ; Width
    IniWrite ( $Filename, $Section, "height", $MapHeight )      ; Height
    IniWrite ( $Filename, $Section, "blocks", $MapBlocks )      ; Blocks
    IniWrite ( $Filename, $Section, "weather", $MapWeather )    ; Weather
    IniWrite ( $Filename, $Section, "music", $MapMusic )        ; Music
    IniWrite ( $Filename, $Section, "cave", $MapCave )          ; Cave
    IniWrite ( $Filename, $Section, "type", $MapType )          ; Type
    IniWrite ( $Filename, $Section, "fight", $MapFightType )    ; Fight Type
EndFunc

RipAndSaveMap()

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