$windowTitle = "Advance Map - PALLET TOWN"
;$text = ControlCommand ( $windowTitle, "", 50017416, "CurrentTab", "" )
;MsgBox ( 1, "Text", $text )

;ClickMapTab()
;ClickHeaderTab()
;GetMapWidth()

$MapTab = 1
$MovementTab = 2 ; not yet used
$EventsTab = 3 ; not yet used
$WildPokemonTab = 4 ; not yet used
$HeaderTab = 5

$MainTabID = "[CLASS:SysTabControl32; INSTANCE:1]"
$MapNameID = "[CLASSNN:Edit39]"
$MapWidthID = "[CLASSNN:Edit22]"
$MapHeightID = "[CLASSNN:Edit21]"

Func ClickMapTab()
   SelectTab($MainTabID, $MapTab)
EndFunc

Func ClickHeaderTab()
   SelectTab($MainTabID, $HeaderTab)
EndFunc

; Assumes that "Header" tab is active.
Func GetMapWidth()
   $width = ControlGetText ( $windowTitle, "", $MapWidthID )
   Return $width
EndFunc

Func SelectTab($controlID, $tab)
   ; Get the current tab.
   $currentTab = ControlCommand ( $windowTitle, "", $controlID, "CurrentTab", "" )
   While $currentTab <> $tab
	  If $currentTab < $tab Then
		 ; Shift tab to right.
		 ControlCommand ( $windowTitle, "", $controlID, "TabRight", "" )
	  Else
		 ; Shift tab to left.
		 ControlCommand ( $windowTitle, "", $controlID, "TabLeft", "" )
	  EndIf
	  ; Set new current tab.
	  $currentTab = ControlCommand ( $windowTitle, "", $controlID, "CurrentTab", "" )
   WEnd
EndFunc



