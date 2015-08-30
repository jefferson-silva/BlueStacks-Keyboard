#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


WinTitle = BlueStacks App Player

WinActivate, %WinTitle%
WinGetPos, X, Y, Width, Height, %WinTitle%

NewX := X + 4
NewY := Y + Height
NewWidth := Width - 15
EditWidth := NewWidth - 20

Gui, Add, Edit, w%EditWidth% vMessage
Gui, Show, x%NewX% y%NewY% w%NewWidth%, Whats Keyboard

#IfWinActive Whats Keyboard
Enter::
	Gui, Submit, NoHide

	; send text to clipboard
	Clipboard = %Message%
	; activate bluestacks window
	WinActivate, %WinTitle%
	; paste clipboard content
	Send, {CtrlDown}v{CtrlUp}
	Sleep, 100
	Send, {Enter}
	; erase Edit
	GuiControl, , Message
	; activate virtual keyabord
	WinActivate, Whats Keyboard
Return
#IfWinActive

GuiClose:
ExitApp