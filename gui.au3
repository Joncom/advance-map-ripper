#include-once
#include <config.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>




#Region ### START Koda GUI section ### Form=D:\wamp\www\advance-map-ripper\gui.kxf
$Form1 = GUICreate("Form1", 377, 241, 192, 124)
$Group1 = GUICtrlCreateGroup("Tab Selection", 8, 8, 361, 65)
$ButtonSelectMapTab = GUICtrlCreateButton("Map", 16, 32, 49, 25)
$ButtonSelectMovementTab = GUICtrlCreateButton("Movement", 72, 32, 65, 25)
$ButtonSelectEventsTab = GUICtrlCreateButton("Events", 144, 32, 57, 25)
$ButtonSelectWildPokemonTab = GUICtrlCreateButton("Wild Pokemon", 208, 32, 89, 25)
$ButtonSelectHeaderTab = GUICtrlCreateButton("Header", 304, 32, 57, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Map Information", 8, 80, 361, 57)
$ButtonGetMapWidth = GUICtrlCreateButton("Width", 16, 104, 81, 25)
$ButtonGetMapHeight = GUICtrlCreateButton("Height", 104, 104, 89, 25)
$ButtonGetMapBank = GUICtrlCreateButton("Bank", 200, 104, 73, 25)
$ButtonGetMapNo = GUICtrlCreateButton("Number", 280, 104, 81, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("Map Window", 8, 144, 361, 89)
$ButtonMoveMouseToMapTile = GUICtrlCreateButton("Mouse To Tile", 16, 168, 89, 25)
$InputTileX = GUICtrlCreateInput("0", 128, 168, 33, 21)
$InputTileY = GUICtrlCreateInput("0", 184, 168, 33, 21)
$Label1 = GUICtrlCreateLabel("X:", 112, 172, 14, 17)
$Label2 = GUICtrlCreateLabel("Y:", 168, 172, 14, 17)
$ButtonScrollMapLeft = GUICtrlCreateButton("Scroll Left", 16, 200, 81, 25)
$ButtonScrollMapRight = GUICtrlCreateButton("Scroll Right", 104, 200, 81, 25)
$ButtonScrollMapUp = GUICtrlCreateButton("Scroll Up", 192, 200, 81, 25)
$ButtonScrollMapDown = GUICtrlCreateButton("Scroll Down", 280, 200, 81, 25)
$ButtonResizeMapWindow = GUICtrlCreateButton("Resize", 312, 168, 49, 25)
$ButtonScrollMapToTile = GUICtrlCreateButton("Scroll To Tile", 224, 168, 81, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###



; Use title as per the config.
WinSetTitle($Form1, "", $GUITitle)