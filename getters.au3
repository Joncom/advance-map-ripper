#include-once
#include <config.au3>


Func GetData($ID)
    Return ControlGetText ( $MainWindowTitle, "", $ID )
EndFunc


Func GetBlocks($width, $height)
    ; Get block for each tile in map.
    $Blocks = ""
    ;For $y = 0 To GetData($MapHeightID) - 1
    For $y = 0 To 3
        ;For $x = 0 To GetData($MapWidthID) - 1
        For $x = 0 To 3
            ; Make sure tile is on screen.
            ScrollMapUntilTileIsOnScreen($x, $y)
            ; Move mouse to current tile.
            MoveMouseToMapTile($x, $y)
            ; Get current block.
            $Block = GetBlockFromStatusbar()
            ; Add block to the others.
            $Blocks = $Blocks & $Block
            ; Seperate by comma.
            $Blocks = $Blocks & ","
        Next
    Next
    ; Remove extra comma.
    $Blocks = StringTrimRight ( $Blocks, 1 )
    ; Return result.
    Return $Blocks
EndFunc


Func GetValueInBrackets($String)
    $FirstBracketPos = StringInStr ( $String, "[" )
    $SecondBracketPos = StringInStr ( $String, "]" )
    $Count = $SecondBracketPos - $FirstBracketPos - 1
    $Value = StringMid ( $String, $FirstBracketPos + 1, $Count )
    Return $Value
EndFunc


Func GetBlockFromStatusbar()
    ; Get status text as string.
    $status = StatusbarGetText($MainWindowTitle)
    ; Break up string into pieces.
    $pieces = StringSplit( $status, "$" )
    ; Count how many pieces in the array.
    $count = UBound( $pieces )
    ; The last piece should be the block.
    $hexBlock = $pieces[$count-1]
    ; Convert hex value to decimal.
    $decBlock = Dec( $hexBlock )
    ; Return result.
    Return $decBlock
EndFunc

