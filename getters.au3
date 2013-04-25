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

    If $n = 1 Then
        $Result = StringRegExp( $Status, "[A-Za-z]:+ \$([A-Z0-9]+)", 1 )
    ElseIf $n = 2 Then
        $Result = StringRegExp( $Status, "[A-Za-z]:+ \$([A-Z0-9]+)[\s]*[A-Za-z]:+ \$([A-Z0-9]+)", 1 )
    ElseIf $n = 3 Then
        $Result = StringRegExp( $Status, "[A-Za-z: ]+\$([A-Z0-9]+)[\s]*[A-Za-z: ]+\$([A-Z0-9]+)[\s]*[A-Za-z: ]+\$([A-Z0-9]+)", 1 )
    EndIf
    Return $Result[$n - 1]
    ;X: $05 Y: $00    Block: $1D
    ;X: $05 Y: $00

    ; [A-Za-z: ]+\$([A-Z0-9]+)[A-Za-z: ]*\$([A-Z0-9]*)[A-Za-z: ]*\$([A-Z0-9]*)


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

