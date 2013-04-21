$windowTitle = "Advance Map - PALLET TOWN"
;$text = ControlCommand ( $windowTitle, "", 50017416, "CurrentTab", "" )
;MsgBox ( 1, "Text", $text )

;ClickMapTab()
;ClickHeaderTab()
GetMapWidth()

Func ClickMapTab()
   $controlID = 50017416
   $tab = 1
   SelectTab($controlID, $tab)
EndFunc

Func ClickHeaderTab()
   $controlID = 50017416
   $tab = 5
   SelectTab($controlID, $tab)
EndFunc

Func GetMapWidth()
   ; Assumes that "Header" tab is active.
   $controlID = 50322704
   $text = ControlGetText ( $windowTitle, "", $controlID )
   MsgBox ( 1, "Text", $text )
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



