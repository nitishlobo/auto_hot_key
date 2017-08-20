#InstallKeybdHook
#SingleInstance force

/*
-------------------------------------------------------------------
^ means ctrl
! means alt
-------------------------------------------------------------------

SHORTCUTS WITHIN THIS SCRIPT:
Alt-A: make window always on top

Alt-W: make window less transparent
Alt-S: make window more transparent

Alt-X: make window clickthoughable
Alt-Z: make window under mouse unclickthroughable

Alt-left:  sends Previous
Alt-space: sends Play/Pause
Alt-right: sends Next
Alt-down:  sends Volume Down
Alt-m:     sends Mute
Alt-up:    sends Volume Up
Alt-.:     shortcut list

-------------------------------------------------------------------
USEFUL LINKS:
Key summary	- https://autohotkey.com/docs/commands/Send.htm
More keys	- https://autohotkey.com/docs/KeyList.htm
Examples	- https://autohotkey.com/docs/Hotkeys.htm
Media control	- https://superuser.com/questions/278951/my-keyboard-has-no-media-keys-can-i-control-media-without-them


*/

!a::
WinGet, currentWindow, ID, A
WinGet, ExStyle, ExStyle, ahk_id %currentWindow%
if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
{
	Winset, AlwaysOnTop, off, ahk_id %currentWindow%
	SplashImage,, x0 y0 b fs12, OFF always on top.
	Sleep, 1500
	SplashImage, Off
}
else
{
	WinSet, AlwaysOnTop, on, ahk_id %currentWindow%
	SplashImage,,x0 y0 b fs12, ON always on top.
	Sleep, 1500
	SplashImage, Off
}
return

!w::
WinGet, currentWindow, ID, A
if not (%currentWindow%)
{
	%currentWindow% := 255
}
if (%currentWindow% != 255)
{
	%currentWindow% += 5
	WinSet, Transparent, % %currentWindow%, ahk_id %currentWindow%
}
SplashImage,,w100 x0 y0 b fs12, % %currentWindow%
SetTimer, TurnOffSI, 1000, On
Return

!s::
SplashImage, Off
WinGet, currentWindow, ID, A
if not (%currentWindow%)
{
	%currentWindow% := 255
}
if (%currentWindow% != 5)
{
	%currentWindow% -= 5
	WinSet, Transparent, % %currentWindow%, ahk_id %currentWindow%
}
SplashImage,, w100 x0 y0 b fs12, % %currentWindow%
SetTimer, TurnOffSI, 1000, On
Return

!x::
WinGet, currentWindow, ID, A
WinSet, ExStyle, +0x80020, ahk_id %currentWindow%
return

!z::
MouseGetPos,,, MouseWin ; Gets the unique ID of the window under the mouse
WinSet, ExStyle, -0x80020, ahk_id %currentWindow%
Return

TurnOffSI:
SplashImage, off
SetTimer, TurnOffSI, 1000, Off
Return

!Left::Send   {Media_Prev}
!Space::Send   {Media_Play_Pause}
!Right::Send  {Media_Next}
!Down::Send  {Volume_Down}
!m::Send  {Volume_Mute}
!Up::Send {Volume_Up}

!.::
MsgBox,
(Alt-A: make window always on top
Alt-W: make window less transparent
Alt-S: make window more transparent
Alt-X: make window clickthoughable
Alt-Z: make window under mouse unclickthroughable

Alt-left: sends Previous
Alt-space: sends Play/Pause
Alt-right: sends Next
Alt-down: sends Volume Down
Alt-m: sends Mute
Alt-up: sends Volume Up
Alt-.: command list
)
return
