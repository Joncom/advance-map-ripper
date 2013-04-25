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
            $HexBlock = GetNthValueFromStatubar(3)
            ; Convert block value to decimal.
            $DecBlock = Dec($HexBlock)
            ; Add block to the others.
            $Blocks = $Blocks & $DecBlock
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
    ; Find position of opening bracket.
    $FirstBracketPos = StringInStr ( $String, "[" )
    ; Remove all characters up to and including first bracket.
    $String = StringTrimLeft( $String, $FirstBracketPos )
    ; Find position of closing bracket.
    $SecondBracketPos = StringInStr ( $String, "]" )
    ; Keep only characters before closing bracket.
    $String = StringMid ( $String, 1, $SecondBracketPos - 1 )
    ; Return new string.
    Return $String
EndFunc


Func GetNthValueFromStatubar($n)
    ; Get status text as string.
    $Status = StatusbarGetText($MainWindowTitle)
    ; Find values within the string.
    $Result = StringRegExp( $Status, "[A-Za-z: ]+\$([A-Z0-9]+)(?:[\s]*[A-Za-z: ]+\$([A-Z0-9]+))?(?:[\s]*[A-Za-z: ]+\$([A-Z0-9]+))?", 1 )
    ; Return the desired value.
    Return $Result[$n - 1]
EndFunc

