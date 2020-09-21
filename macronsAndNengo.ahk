;About:
;version: 1.0
;released: 2020/09/21 (yyyy/mm/dd)

;------------------------------------------------------------
;Created By:
;Adam H. Lisbon
;Japanese & Korean Studies Librarian`
;Associate Professor
;University Libraries
;University of Colorado Boulder

;------------------------------------------------------------
;License:
;Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
;https://creativecommons.org/licenses/by-nc-sa/4.0/

;------------------------------------------------------------
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

setTitleMatchMode, 2
setKeyDelay, 100

;------------------------------------------------------------
;Use the Caps Lock key to swtich between an IME and English
capslock::
	send {alt down}{shift down}{alt up}{shift up}
exit

;------------------------------------------------------------
;keyboard commands for typing Japanese vowels in Romaji with macrons.
>!a::
	sendInput ā
exit

>!i::
	sendInput ī
exit

>!u::
	sendInput ū
exit

>!e::
	sendInput ē
exit

>!o::
	sendInput ō
exit

>+!a::
	sendInput Ā
exit

>+!i::
	sendInput Ī
exit

>+!u::
	sendInput Ū
exit

>+!e::
	sendInput Ē
exit

>+!o::
	sendInput Ō
exit

>!y::
	sendInput ¥
exit

;------------------------------------------------------------
;keyboard command for typing Korean vowels in Romanization with accent marks.
>^o::
	sendInput ŏ
exit

>+^o::
	sendInput Ŏ
exit

>^u::
	sendInput ŭ
exit

>+^u::
	sendInput Ŭ
exit

>^w::
	sendInput ₩ 
exit

;------------------------------------------------------------
^+y::
;clears data from variables.
	clipboard:=
	spreadsheet:=
;determines if you are using a spreadsheet program.
;can currently check the following spreadsheet programs and web apps:
;Excel, Excel in Office365, Google Sheets
	if WinActive("ahk_class XLMAIN")
		spreadsheet:= "Excel"
	if WinActive(" - Google Sheets")
		spreadsheet:= "Google Sheets"
	if WinActive(".xlsx - ")
		spreadsheet:= "Excel via Office365"
	if spreadsheet!=
		{
		send ^c
		if clipboard=
			{
			msgBox, You may be actively editing or trying to copy a blank cell in %spreadsheet%.`n`n1. Finish editing the cell.`n2. Highlight the cell with the year you want to convert. 
			exit
			}
		goTo skipCopy
		}
	send ^+{left}
	send ^c
	skipCopy:
	clipboard:= regExReplace(clipboard, "`r`n","") ; Some spreadsheet data is not true plain text and needs to have "carriage return" and "line feed" formatting removed.
	sleep 300
;years where the Western Year is when the Japanese Imperial era changes.
	if clipboard < 1868
		{
		msgBox, This macro only converts dates before 1868.
		exit
		}
	if clipboard= 1868
		{
		msgBox, Caution!`n`n1868 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before September 7, 1868 is Keiō 4`n--on or after September 8, 1868 is Meiji 1`n`n This macro does not convert years when the imperial era changes.
		exit
		}
	if clipboard= 1912
		{ 
		msgBox, Caution!`n`n1912 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before June 11, 1912 is Meiji 45`n--on or after June 12, 1868 is Taishō 1`n`n This macro does not convert years when the imperial era changes.
		exit
		}
	if clipboard= 1926
		{
		msgBox, Caution!`n`n1926 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before December 26, 1926 is Taishō 15`n--on or after December 25, 1926 is Shōwa 1`n`n This macro does not convert years when the imperial era changes.
		exit
		}
	if clipboard= 1989
		{
		msgBox, Caution!`n`n1989 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before January 7, 1989 is Shōwa 64`n--on or after January 8, 1989 is Shōwa 1`n`n This macro does not convert years when the imperial era changes.
		exit
		}
	if clipboard= 2019
		{
		msgBox, Caution!`n`n2019 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before April 30, 2019 is Heisei 31`n--on or after May 1, 2019 is Reiwa 1`n`n This macro does not convert years when the imperial era changes.
		exit
		}
;number is checked for letter indicating an imperial era.
	if clipboard not contains m,t,s,h,r
		goTo convertWesternYear
;conversion from Nengō to Western year.
;Meiji era
	if clipboard contains m
		{
		clipboard:= strReplace(clipboard, "m", "")
		if clipboard > 45
			{
			MsgBox, Error. The Meiji era ends in Meiji 45.
			exit
			}
		clipboard:= clipboard + 1867
		if clipboard= 1912
			{
			msgBox, Caution! Meiji 45 is the last year of the Meiji Era.`n`nIf your specific date is on or before June 11, 1912, this is Meiji 45.`nHowever, if it is on or after June 12, 1912, it is Taishō 1.`n`nThe macro will not convert the year.
			exit
			}
		}
;Taishō Era
	if clipboard contains t
		{
		clipboard:= strReplace(clipboard, "t", "")
		if clipboard > 15
			{
			msgBox, Error. The Taishō era ends in Taishō 15.
			exit
			}
		clipboard:= clipboard + 1911
		}
;Shōwa Era
	if clipboard contains s
		{
		clipboard:= strReplace(clipboard, "s", "")
		if clipboard > 64
			{
			MsgBox, Error. The Shōwa era ends in Shōwa 64.
			exit
			}
		clipboard:= clipboard + 1925
		}
;Heisei Era
	if clipboard contains h
		{
		clipboard:= strReplace(clipboard, "h", "")
		if clipboard > 31
			{
			MsgBox, Error. The Heisei era ends in Heisei 31.
			exit
			}
		clipboard:= clipboard + 1988
		}
;Reiwa Era
	if clipboard contains r
		{
		clipboard:= strReplace(clipboard, "r", "")
		clipboard:= clipboard + 2018
		}
	goTo pasteYear
	convertWesternYear:
;conversion from Western years to Nengō years
	if clipboard between 1868 and 1912
		{
		clipboard:= clipboard - 1867
		clipboard:= "Meiji " . clipboard
		}
	if clipboard between 1912 and 1926
		{
		clipboard:= clipboard - 1911
		clipboard:= "Taishō " . clipboard
		}
	if clipboard between 1926 and 1997
		{
		clipboard:= clipboard - 1925
		clipboard:= "Shōwa " . clipboard
		}
	if clipboard between 1998 and 2018
		{
		clipboard:= clipboard - 1988
		clipboard:= "Heisei " . clipboard
		}
	if clipboard between 2019 and 2030
		{
		clipboard:= clipboard - 2018
		clipboard:= "Reiwa " . clipboard
		}
	 pasteYear:
	send ^v
	if spreadsheet= Excel
		send {enter}
	if spreadsheet= Excel via Office365
		send {enter}
	if spreadsheet= Google Sheets
		send {enter 2}
exit
